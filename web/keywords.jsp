<%-- 
    Document   : keywords
    Created on : Mar 19, 2015, 12:08:30 AM
    Author     : Rahul
--%>

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
<br>
<div id="dgcontainer" style="margin-left: auto; margin-right: auto; width: 60%">	
    <table id="dg" title="Managa Keywords" class="easyui-datagrid" 
           style="width:100%;height:450px;margin-left:auto;margin-right:auto;"
           align="center"
           url="DataController?action=listKeywords"
           toolbar="#toolbar"
           rownumbers="true" fitColumns="true" 
           idField="id"
           singleSelect="true">
        <thead>
            <tr>
                <th field="id" width="40" hidden="true">Id</th>
                <th field="keyword" width="40">Keyword</th>
                <th field="isDeleted" width="40" hidden="true">Is Deleted</th>
            </tr>
        </thead>
    </table>
</div>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newKeyword()">New Keyword</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editKeyword()">Edit Keyword</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyKeyword()">Remove Keyword</a>
</div>

<div id="dlg" class="easyui-dialog" style="width:600px;height:180px;padding:10px 20px"
     closed="true" buttons="#dlg-buttons">
    <div class="ftitle">Keyword</div>
    <form id="fm" method="post" novalidate>
        <div class="fitem">
            <label>Keyword:</label>
            <input name="keyword" class="easyui-textbox" required="true" style="width:300px">
        </div>
        <div class="fitem" hidden="true">
            <input name="id" class="easyui-textbox">
        </div>
        <div class="fitem" hidden="true">
            <input name="isDeleted" class="easyui-textbox">
        </div>
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveKeyword()" style="width:90px">Save</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
</div>
<script type="text/javascript">
    var url;
    function newKeyword() {
        $('#dlg').dialog('open').dialog('setTitle', 'New Keyword');
        $('#fm').form('clear');
        url = 'DataController?action=addKeyword';
    }
    function editKeyword() {
        var row = $('#dg').datagrid('getSelected');
        if (row) {
            $('#dlg').dialog('open').dialog('setTitle', 'Edit Keyword');
            $('#fm').form('load', row);
            url = 'DataController?action=updateKeyword&id=' + row.id;
        } else {
            $.messager.show({
                        title: 'Error',
                        msg: 'Please select a row'
                    });
        }
    }
    function saveKeyword() {
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
                    $('#dlg').dialog('close');		// close the dialog
                    $('#dg').datagrid('reload');	// reload the user data
                }
            }
        });
    }
    function destroyKeyword() {
        var row = $('#dg').datagrid('getSelected');
        if (row) {
            $.messager.confirm('Confirm', 'Are you sure you want to delete this keyword?', function (r) {
                if (r) {
                    $.post('DataController?action=updateKeyword', 
                    {id: row.id,isDeleted: 'Y',keyword: row.keyword}, 
                    function (result) {
                        if (result.success) {
                            $('#dg').datagrid('reload');	// reload the user data
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
        width:80px;
    }
    .fitem input{
        width:160px;
    }
</style>
<jsp:include page="footer.jsp"/>
