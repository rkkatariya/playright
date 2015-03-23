<%-- 
    Document   : data.jsp
    Created on : Mar 14, 2015, 12:20:27 AM
    Author     : Rahul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"/>
    <link rel="stylesheet" href="js/gridJs/css/ui.jqgrid.css">
    <link rel="stylesheet" href="css/jquery-ui.css" type="text/css" />
    <!-- jTable script file. -->
    <script src="js/jquery-1.11.1.js" type="text/javascript"></script>
    <script src="js/jquery-ui.js" type="text/javascript"></script>        
    <script src="js/gridJs/js/i18n/grid.locale-en.js"></script>
    <script src="js/gridJs/js/jquery.jqGrid.src.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            $("#dataGrid").jqGrid({
                url: "DataController?action=list",
                datatype: "json",
                mtype: 'POST',
                colNames: ['Id', 'Newspaper', 'Source', 'Edition', 'Language'],
                colModel: [{
                        name: 'id',
                        index: 'id',
                        width: 10
                    }, {
                        name: 'newspaper',
                        index: 'newspaper',
                        width: 150,
                        editable: true
                    }, {
                        name: 'source',
                        index: 'source',
                        width: 150,
                        editable: true
                    }, {
                        name: 'edition',
                        index: 'edition',
                        width: 150,
                        editable: true
                    }, {
                        name: 'language',
                        index: 'language',
                        width: 150,
                        editable: true
                    }],
                pager: '#datapager',
                rowNum: 10,
                rowList: [10, 20, 30],
                sortname: 'invid',
                sortorder: 'desc',
                viewrecords: true,
                gridview: true,
                caption: 'Coverage Analytics Data',
                jsonReader: {
                    repeatitems: false,
                },
                editurl: "DataController?action=update"
            });
//            $("#dataGrid").jqGrid('setGridHeight', $("#datapager").height() - ($("#gbox_dataGrid").height() - $('#gbox_dataGrid .ui-jqgrid-bdiv').height()));
            $("#dataGrid").jqGrid('setGridHeight', 240 );
            jQuery("#dataGrid").jqGrid('navGrid', '#datapager', {
                edit: true,
                add: true,
                del: true,
                search: true
            });
        });
    </script>

    <br>
    <table id="dataGrid">
        <tr>
            <td />
        </tr>
    </table>
    <div id="datapager"></div>
<jsp:include page="footer.jsp"/>