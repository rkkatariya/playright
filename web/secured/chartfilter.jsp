<%-- 
    Document   : chartfilter
    Created on : Mar 19, 2015, 11:02:21 AM
    Author     : Rahul
--%>

<!DOCTYPE html>
<jsp:include page="header.jsp"/> 
<script type="text/javascript" src="../js/jquery.modal.js"></script>
<div id="body_container">   
    <div style="width:60%;margin: 0px auto;padding:10px">
        <div class="easyui-panel" title="Use Date Filter" 
             style="background-color:#bdc3c7; padding: 20px 10px 5px 10px;">
            <form id="ff" method="POST" target="_blank">
                <table cellpadding="5" align="center">
                    <tr>
                        <td style="color:#2c3e50; font-weight:bold;">From Date:</td>
                        <td><input class="easyui-datebox" type="text" name="fromDate" validType="validDate"
                                   data-options="formatter:myformatter,parser:myparser"></td>
                        <td style="color:#2c3e50; font-weight:bold;">To Date:</td>
                        <td><input class="easyui-datebox" type="text" name="toDate" validType="validDate"
                                   data-options="formatter:myformatter,parser:myparser"></td>
                        <td><input type="hidden" id="allData" name="allData" value="N"></td>
                    </tr>
                </table>
            </form>
            <div style="text-align:center;padding:20px">
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="generateCharts('../charts_print.jsp')">Print Charts</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="generateCharts('../charts.jsp')">View Charts</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="showModal('CHARTS')">Email Charts</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="showModal('HTML')">Email Data</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="downloadAsCSV()">Download Data</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">Clear Dates</a>
            </div>
        </div>

        <div class="easyui-panel" title="Use Entire Data" 
             style="background-color:#bdc3c7; padding: 10px 10px 5px 10px;">
            <div style="text-align:center;padding:20px">
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="generateChartsAllData('../charts_print.jsp')">Print Charts</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="generateChartsAllData('../charts.jsp')">View Charts</a>
<!--                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="downloadAsCSVAllData()">Download Data</a>-->
            </div>
        </div>
    </div>
</div>
<div  style="background-color:#3B3B3B; border: none;display: none" id="emailDialog">
    <div style="margin: 0px auto;padding:10px 10px 10px 10px;">
        <form id="mailpopup" method="POST">
            <table cellpadding="5">
                <tr>
                    <td style="color:#DADADA; font-weight:bold;">Recipient Email Address:</td>
                    <td><input class="textbox" type="text" name="emailAddress" id="emailAddress"></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="color:#DADADA; font-weight:bold;">Email Subject:</td>
                    <td><input class="textbox" type="text" name="emailSubject" id="emailSubject"></td>
                </tr>
                <tr id="mailContent">
                    <td style="color:#DADADA; font-weight:bold;">Email Content:</td>
                    <td><textarea class="textbox" rows="5" cols="50" name="emailContent" id="emailContent"></textarea></td>
                    <td><input type="hidden" id="textareaval"></td>
                </tr>    
            </table>
        </form>
        <br>
        <div style="text-align:center;padding:5px">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="sendMail()" >Send Mail</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" rel="modal:close">Close</a>
        </div>
    </div>
</div>
<script type="text/javascript">
    function generateChartsAllData(action) {
        document.getElementById("allData").value = "Y";
        generateCharts(action);
        document.getElementById("allData").value = "N";
    }
    ;
    function generateCharts(action) {
        document.getElementById("ff").action = action;
        document.getElementById("ff").submit();
    }
    ;
    function showModal(action) {
        window.action = action;
        if (action === 'CHARTS') {
            $('#mailContent').show();
        } else {
            $('#mailContent').hide();
        }
        $("#emailDialog").modal({
            escapeClose: false,
            clickClose: false,
            showClose: false
        });
    }
    ;

    function sendMail() {

        var fromDate = $('input[name="fromDate"]').val();
        var toDate = $('input[name="toDate"]').val();
        var postData = $('#mailpopup').serializeArray();

        $.ajax({
            url: 'EmailServlet?action=' + window.action + "&fromDate=" + fromDate + "&toDate=" + toDate,
            type: 'POST',
            data: postData
        }).success(function () {
            $.modal.close();
        }).error(function () {
            $.messager.show({
                title: 'Error',
                msg: 'Unable to send email'
            });
        });
    }
    ;

    function clearForm() {
        $('#ff').form('clear');
    }
    ;
    function downloadAsCSV() {
        var fromDate = $('input[name="fromDate"]').val();
        var toDate = $('input[name="toDate"]').val();
        var allData = $('input[name="allData"]').val();
        var params = 'fromDate=' + fromDate + '&toDate=' + toDate + '&allData=' + allData;
        document.getElementById("ff").action = '/playright/CSVServlet?' + params;
        document.getElementById("ff").method = 'GET';
        document.getElementById("ff").submit();
        document.getElementById("ff").action = 'charts.jsp';
    }
    ;
    function downloadAsCSVAllData() {
        document.getElementById("allData").value = "Y";
        downloadAsCSV();
        document.getElementById("allData").value = "N";
    }
    ;    
</script>
<script type="text/javascript">
    function myformatter(date) {
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        var d = date.getDate();
        return (d < 10 ? ('0' + d) : d) + '/' + (m < 10 ? ('0' + m) : m) + '/' + y;
    }
    ;
    function myparser(s) {
        if (!s)
            return new Date();
        var ss = (s.split('/'));
        var d = parseInt(ss[0], 10);
        var m = parseInt(ss[1], 10);
        var y = parseInt(ss[2], 10);
        if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
//                console.log(new Date(y,m-1,d));
            return new Date(y, m - 1, d);
        } else {
            return new Date();
        }
    }
    ;
    $.extend($.fn.datebox.defaults, {
        formatter: function (date) {
            var y = date.getFullYear();
            var m = date.getMonth() + 1;
            var d = date.getDate();
            return (d < 10 ? ('0' + d) : d) + '/' + (m < 10 ? ('0' + m) : m) + '/' + y;
        },
        parser: function (s) {
            if (!s)
                return new Date();
            var ss = s.split('/');
            var d = parseInt(ss[0], 10);
            var m = parseInt(ss[1], 10);
            var y = parseInt(ss[2], 10);
            if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
                return new Date(y, m - 1, d);
            } else {
                return new Date();
            }
        }
    });

    $.extend($.fn.validatebox.defaults.rules, {
        validDate: {
            validator: function (value) {
                var date = $.fn.datebox.defaults.parser(value);
                var s = $.fn.datebox.defaults.formatter(date);
                return s == value;
            },
            message: 'Please enter a valid date.'
        }
    });
</script>
<jsp:include page="footer.jsp"/>

