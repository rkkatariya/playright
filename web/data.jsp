<%-- 
    Document   : data
    Created on : Mar 15, 2015, 12:56:58 AM
    Author     : Rahul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"/>
<link rel="stylesheet" type="text/css" href="js/easyui/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<style type="text/css">
    #fm{
        margin:0;
        padding:10px 30px;
    }
    .ftitle{
        font-size:14px;
        font-weight:bold;
        padding:5px 0;
        margin-bottom:10px;
        border-bottom:1px solid #ccc;
    }
    .fitem{
        margin-bottom:5px;
    }
    .fitem label{
        display:inline-block;
        width:25%;
    }
    .fitem input{
        width:160px;
    }
</style>
<script type="text/javascript" src="js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui/plugins/datagrid-detailview.js"></script>
<script type="text/javascript" src="js/easyui/plugins/jquery.datebox.js"></script>
<script type="text/javascript">
    var url;
    function newCvgData() {
        $('#dlg').dialog('open').dialog('setTitle', 'Add Data');
        $('#fm').form('clear');
        url = 'DataController?action=saveCvgData';
        var now = new Date();
        $("#newsDate").datebox("setValue", myformatter(now));
    }
    function editCvgData() {
        var row = $('#dg').datagrid('getSelected');
        if (row) {
            $('#dlg').dialog('open').dialog('setTitle', 'Edit Data');
            $('#fm').form('load', row);
            url = 'DataController?action=saveCvgData';
        } else {
            $.messager.show({
                        title: 'Error',
                        msg: 'Please select a row'
                    });
        }
    }
    function saveCvgData() {
        $('#fm').form('submit', {
            url: url,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (result) {
                var result = eval('(' + result + ')');
                if (result.errorMsg) {
                    $.messager.show({
                        title: 'Error',
                        msg: result.errorMsg
                    });
                } else {
                    $('#dlg').dialog('close');        // close the dialog
                    $('#dg').datagrid('reload');    // reload the user data
                }
            }
        });
    }
    function destroyCvgData() {
        var row = $('#dg').datagrid('getSelected');
        if (row) {
            $.messager.confirm('Confirm', 'Are you sure you want to delete this data?', function (r) {
                if (r) {
                    $.post('DataController?action=deleteCvgData', {cvgDataId: row.id}, function (result) {
                        if (result.success) {
                            $('#dg').datagrid('reload');    // reload the user data
                        } else {
                            $.messager.show({// show error message
                                title: 'Error',
                                msg: result.errorMsg
                            });
                        }
                    }, 'json');
                }
            });
        } else {
            $.messager.show({
                        title: 'Error',
                        msg: 'Please select a row'
                    });
        }
    }
</script>
<script type="text/javascript">
    $(function () {
        $('#dg').datagrid({
            view: detailview,
            detailFormatter: function (index, row) {
                return '<div style="padding:2px; width: 50%"><table id="ddv-' + row.id + '"></table></div>';
            },
            onExpandRow: function (index, row) {
                //Auto-Collapse last expanded row START
//                var opts = $(this).datagrid('options');
//                if (opts.lastExpandIndex != undefined) {
//                    $(this).datagrid('collapseRow', opts.lastExpandIndex);
//                }
//                opts.lastExpandIndex = index;
                //Auto-Collapse last expanded row END                
//                var ddv = $(this).datagrid('getRowDetail', index).find('table.ddv');
                gen_sub_grid(index, row);
            }
        });
    });
    function gen_sub_grid(parentIndex, parentRow) {
        var parentId = parentRow.id;
        var emData;
        var emColumns = [[
                {field: 'id', title: 'Id', width: 50, align: 'right', hidden: 'true'},
                {field: 'commodity', title: 'Keyword', width: 300, align: 'left'},
                {field: 'headline', title: 'Headline', width: 65, align: 'right', editor: 'numberbox'},
                {field: 'image', title: 'Image', width: 65, align: 'right', editor: 'numberbox'},
                {field: 'article', title: 'Article', width: 65, align: 'right', editor: 'numberbox'},
                {field: 'cvgDataId', title: 'Cvg Data Id', width: 50, align: 'right', hidden: 'true'},
                {field: 'action', title: 'Action', width: 90, align: 'center',
                    formatter: function (value, row, index) {
                        if (row.editing) {
                            var s = '<a href="#" onclick="saverow(' + parentId + ',this)">Save</a> ';
                            var c = '<a href="#" onclick="cancelrow(' + parentId + ',this)">Cancel</a>';
                            return s + c;
                        } else {
                            var e = '<a href="#" onclick="editrow(' + parentId + ',this)">Edit</a> ';
                            return e;
                        }
                    }
                }
            ]];
        $('#ddv-' + parentId).datagrid({
            url: 'DataController?action=listEntityMatrix&cvgDataId=' + parentRow.id,
            fitColumns: true,
            singleSelect: true,
            rownumbers: true,
            loadMsg: 'Loading ...',
            height: 'auto',
            idField: 'id',
            columns: emColumns,
            onBeforeEdit: function (index, row) {
                row.editing = true;
                updateActions('#ddv-' + parentId, index);
            },
            onAfterEdit: function (index, row) {
                row.editing = false;
                updateActions('#ddv-' + parentId, index);
            },
            onCancelEdit: function (index, row) {
                row.editing = false;
                updateActions('#ddv-' + parentId, index);
            },
            onResize: function () {
                $('#dg').datagrid('fixDetailRowHeight', parentIndex);
            },
            onLoadSuccess: function () {
                setTimeout(function () {
                    $('#dg').datagrid('fixDetailRowHeight', parentIndex);
                }, 0);
            }
        });
        $('#ddv-' + parentIndex).datagrid('loadData', emData);
        $('#dg').datagrid('fixDetailRowHeight', parentIndex);
    }
    ;
    function updateActions(target, index) {
        $(target).datagrid('updateRow', {
            index: index,
            row: {}
        });
    }
    function getRowIndex(target) {
        var tr = $(target).closest('tr.datagrid-row');
        return parseInt(tr.attr('datagrid-row-index'));
    }
    function editrow(parentId, target) {
        $('#ddv-' + parentId).datagrid('beginEdit', getRowIndex(target));
    }
    function saverow(parentId, target) {
        var tr = $(target).closest('tr.datagrid-row');
        var idx = parseInt(tr.attr('datagrid-row-index'));
        $('#ddv-' + parentId).datagrid('endEdit', idx);
        var tbl = tr.closest('div.datagrid-view').children('table');
        var row = tbl.datagrid('getRows')[idx];
        $.ajax("DataController?action=saveEntityMatrix", {
            type: 'POST',
            dataType: 'json',
            data: JSON.stringify(row),
            contentType: 'application/json',
            mimeType: 'application/json'
        });

    }
    function cancelrow(parentId, target) {
        $('#ddv-' + parentId).datagrid('cancelEdit', getRowIndex(target));
    }
</script>
<script type="text/javascript">
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
    function formatDate(value) {
        var d = new Date(value);
        return $.fn.datebox.defaults.formatter(d);
    };
    function getMonth(str) {
        var arr = str.split(' ');
        var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        var m = 1;
        for (m; m <= months.length; m++) {
            if (months[m] == arr[0])
            {
                break;
            }
        } 
        return m;
    };
    function getDay(str) {
        var arr = str.split(' ');
        var d = arr[1].replace(',', '');
        return d;
    };
    function getYear(str) {
        var arr = str.split(', ');
        return arr[1];
    }; 
    function myformatter(date){
        var y = date.getFullYear();
        var m = date.getMonth()+1;
        var d = date.getDate();
        return (d<10?('0'+d):d) + '/' + (m<10?('0'+m):m) + '/' + y;
    };
    function myparser(s){
            if (!s) return new Date();
            var n = s.indexOf(",");
            var ss;
            var d;
            var m;
            var y;
            if (n > 1) {
                d = getDay(s);
                m = getMonth(s)+1;
                y = getYear(s);
            } else {
                var ss = (s.split('/'));
                d = parseInt(ss[0],10);
                m = parseInt(ss[1],10);
                y = parseInt(ss[2],10);		
            }
            if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
                return new Date(y,m-1,d);
            } else {
                return new Date();
            }
    };
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
    $.extend($.fn.validatebox.defaults.rules, { 
            validJF: {    
                    validator: function(value){  
                            if (value > 0 && value < 6 )
                                return true; 
                    },  
                    message: 'Please enter a value between 1 and 5.'  
            }
    });     
</script>
<br>
<div id="dgcontainer" style="margin-left: auto; margin-right: auto; width: 99%">
    <table id="dg" title="Managa Analytical Data" class="easyui-datagrid" 
           style="width:100%;height:450px;margin-left:auto;margin-right:auto;"
           align="center"
           url="DataController?action=listCvgData"
           toolbar="#toolbar"
           rownumbers="true" fitColumns="true" 
           idField="id"
           singleSelect="true" pagination="true">
        <thead>
            <tr>
                <th field="id" width="5" align="center" hidden="true"><b>Id</b></th>
                <th field="newsDate" formatter="formatDate"><b>News Date</b></th>
                <th field="newspaper"><b>Newspaper</b></th>
                <th field="language"><b>Language</b></th>
                <th field="headline" width="50"><b>Headline</b></th>
                <th field="edition"><b>Edition</b></th>                    
                <th field="supplement" width="50"><b>Supplement</b></th>
                <th field="source"><b>Source</b></th>
                <th field="pageNo" width="35" align="right"><b>Page No</b></th>
                <th field="height" width="35" align="right"><b>Height</b></th>
                <th field="width" width="35" align="right"><b>Width</b></th>
                <th field="totalArticleSize" width="50" align="right"><b>Total Article Size</b></th>
                <th field="circulationFigure" width="50" align="right"><b>Circulation Figure</b></th>
                <th field="quantitativeAve" width="50" align="right"><b>Quantitative AVE</b></th>
                <th field="journalistFactor" width="50" align="right"><b>Journalist Factor</b></th>
                <th field="imageUrl" align="center"><b>Image</b></th>
            </tr>
        </thead>
    </table>        
</div>
<div id="toolbar">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newCvgData()">Add Data</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editCvgData()">Edit Data</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyCvgData()">Remove Data</a>
</div>
<div id="dlg" class="easyui-dialog" style="width:50%;height:560px;padding:10px 20px"
     closed="true" buttons="#dlg-buttons">
    <div class="ftitle">Manage Analytical Data</div>
    <form id="fm" method="post" enctype="multipart/form-data" novalidate>
        <div class="fitem" hidden="true">
            <input name="id" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>News Date:</label>
            <input id="newsDate" name="newsDate" class="easyui-datebox" validType="validDate"
                   data-options="formatter:myformatter,parser:myparser" required="true"/>
            <label><i>(dd/mm/yyyy)</i></label>
        </div>        
        <div class="fitem">
            <label>Newspaper:</label>
            <input name="newspaper" class="easyui-textbox" style="width:300px" required="true">
        </div>
        <div class="fitem">
            <label>Language:</label>
            <input name="language" class="easyui-combobox" required="true"
                   data-options="
                   valueField: 'value',
                   textField: 'value',
                   url: 'DataController?action=getLanguages'">
        </div>        
        <div class="fitem">
            <label>Headline:</label>
            <input name="headline" class="easyui-textbox" style="width:300px" required="true">
        </div>        
        <div class="fitem">
            <label>Edition</label>
            <input name="edition" class="easyui-textbox" style="width:300px" required="true">
        </div>
        <div class="fitem">
            <label>Supplement</label>
            <input name="supplement" class="easyui-textbox" style="width:300px">
        </div>
        <div class="fitem">
            <label>Source:</label>
            <input name="source" class="easyui-textbox" style="width:300px">
        </div>
        <div class="fitem">
            <label>Page No:</label>
            <input name="pageNo" class="easyui-numberbox">
        </div>
        <div class="fitem">
            <label>Height:</label>
            <input name="height" class="easyui-numberbox">
        </div>
        <div class="fitem">
            <label>Width:</label>
            <input name="width" class="easyui-numberbox">
        </div>
        <div class="fitem">
            <label>Total Article Size:</label>
            <input name="totalArticleSize" class="easyui-numberbox">
        </div>
        <div class="fitem">
            <label>Circulation Figure:</label>
            <input name="circulationFigure" class="easyui-numberbox">
        </div>
        <div class="fitem">
            <label>Quantitative AVE:</label>
            <input name="quantitativeAve" class="easyui-numberbox" required="true"
                   data-options="
                   min:0,
                   precision:2">
        </div>
        <div class="fitem">
            <label>Journalist Factor:</label>
            <input name="journalistFactor" class="easyui-numberbox" validType="validJF" required="true">
        </div>
        <div class="fitem">
            <label>Image:</label>
            <input name="image" accept="image/*" class="easyui-filebox" style="width:380px" 
                   data-options="buttonText: 'Choose Image', buttonAlign: 'left'">
        </div>
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveCvgData()" style="width:90px">Save</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
</div>
<jsp:include page="footer.jsp"/>
