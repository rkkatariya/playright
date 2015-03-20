<%-- 
    Document   : chartfilter
    Created on : Mar 19, 2015, 11:02:21 AM
    Author     : Rahul
--%>

<!DOCTYPE html>
<jsp:include page="header.jsp"/>
<link rel="stylesheet" type="text/css" href="js/easyui/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<script type="text/javascript" src="js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<br>
<div class="easyui-panel" style="background-color:#3B3B3B; border: none">
        <div style="width:45%;margin: 0px auto;padding:10px 10px 10px 10px;">
            <form id="ff" method="POST" action="charts.jsp" target="_blank">
                <table cellpadding="5" align="center">
                    <tr>
                        <td style="color:#DADADA; font-weight:bold;">From Date:</td>
                        <td><input class="easyui-datebox" type="text" name="fromDate" validType="validDate"
                                   data-options="formatter:myformatter,parser:myparser"></td>
                        <td style="color:#DADADA; font-weight:bold;">To Date:</td>
                        <td><input class="easyui-datebox" type="text" name="toDate" validType="validDate"
                                   data-options="formatter:myformatter,parser:myparser"></td>
                        <td><input type="hidden" id="allData" name="allData" value="N"></td>
                    </tr>
                </table>
            </form>
            <br>
            <div style="text-align:center;padding:5px">
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitFormAllData()">Generate Charts [All Data]</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">Generate Charts</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">Clear</a>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function submitFormAllData(){
            document.getElementById("allData").value="Y";
            submitForm();
            document.getElementById("allData").value="N";
        };
        function submitForm(){
            document.getElementById("ff").submit();
        };
        function clearForm(){
            $('#ff').form('clear');
        };
    </script>
    <script type="text/javascript">
        function myformatter(date){
            var y = date.getFullYear();
            var m = date.getMonth()+1;
            var d = date.getDate();
            return (d<10?('0'+d):d) + '/' + (m<10?('0'+m):m) + '/' + y;
        };
        function myparser(s){
            if (!s) return new Date();
            var ss = (s.split('/'));
            var d = parseInt(ss[0],10);
            var m = parseInt(ss[1],10);
            var y = parseInt(ss[2],10);	           
            if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
//                console.log(new Date(y,m-1,d));
                return new Date(y,m-1,d);
            } else {
                return new Date();
            }
        };
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
                    validator: function(value){  
                        var date = $.fn.datebox.defaults.parser(value);
                        var s = $.fn.datebox.defaults.formatter(date);
                        return s==value; 
                    },  
                    message: 'Please enter a valid date.'  
            }
        });    
    </script>
    <jsp:include page="footer.jsp"/>

