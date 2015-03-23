<%-- 
    Document   : data
    Created on : Mar 12, 2015, 5:24:46 PM
    Author     : Rahul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"/>
        <link href="css/lightcolor/gray/jtable.css" rel="stylesheet"
              type="text/css" />
        <link href="css/jquery-ui.css" rel="stylesheet"
              type="text/css" />
        <!-- jTable script file. -->
        <script src="js/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="js/jquery-ui.js" type="text/javascript"></script>
        <script src="js/jquery.jtable.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#DataTableContainer').jtable({
                    title: 'Coverage Analytics Data',
                    paging: true,
                    pageSize: 10,
                    actions: {
                        listAction: 'DataController?action=list',
                        createAction: 'DataController?action=create',
                        updateAction: 'DataController?action=update',
                        deleteAction: 'DataController?action=delete'
                    },
                    fields: {
                        id: {
                            title: 'Id',
                            width: '10%',
                            key: true,
                            create: true
                        },
                        newspaper: {
                            title: 'Newspaper',
                            width: '30%',
                            edit: true
                        },
                        source: {
                            title: 'Source',
                            width: '20%',
                            edit: true
                        },
                        edition: {
                            title: 'Edition',
                            width: '20%',
                            edit: true
                        },
                        language: {
                            title: 'Language',
                            width: '20%',
                            edit: true
                        }
                    }
                });
                $('#DataTableContainer').jtable('load');
            });
        </script>


        <div style="text-align: center;">
            <div id="DataTableContainer"></div>
        </div>
<jsp:include page="footer.jsp"/>