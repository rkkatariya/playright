<%-- 
    Document   : chart
    Created on : Mar 13, 2015, 1:09:48 PM
    Author     : Rahul
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Playright Analytics</title>
        <link href="css/prchart.css" rel="stylesheet" type="text/css" />
        <!--Load the Ajax API-->
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
        <script type="text/javascript">
            var fromDate = '<%= request.getParameter("fromDate")%>';
            var toDate = '<%= request.getParameter("toDate")%>';
            var allData = '<%= request.getParameter("allData")%>';
            var params = 'fromDate=' + fromDate + '&toDate=' + toDate + '&allData=' + allData;
            // Load the Visualization API and the piechart package.
            google.load('visualization', '1', {'packages': ['corechart']});
//            google.load("visualization", "1.1", {packages:['bar']});
            // Set a callback to run when the Google Visualization API is loaded.
            google.setOnLoadCallback(drawChart);
            function drawChart() {
                var query;
                query = new google.visualization.Query('ChartServlet?chart=citywisesplit&' + params);
                query.send(handleCityResponse);

                query = new google.visualization.Query('ChartServlet?chart=languagewisesplit&' + params);
                query.send(handleLangResponse);

                query = new google.visualization.Query('ChartServlet?chart=newspaperwisesplit&' + params);
                query.send(handleNewspaperResponse);

                query = new google.visualization.Query('ChartServlet?chart=journalfactorsplit&' + params);
                query.send(handleJournalFactResponse);

                query = new google.visualization.Query('ChartServlet?chart=cfvaluebar&' + params);
                query.send(handleCFResponse);

            }
            ;
        </script>
        <script type="text/javascript">
            function handleCityResponse(response) {
                if (response.isError()) {
                    alert('Error in query: ' + response.getMessage() + ' ' + response.getDetailedMessage());
                    return;
                }
                var options = {
                    colors:['#003399','#0066CC','#0033CC',
                        '#000099','#0000CC','#000066',
                        '#333399','#3333FF','#3333CC',
                        '#3333CC'],
//                    title: 'City Breakup',
                    titleTextStyle: {
                        color: '#444444',
                        fontSize: 20,
                        bold: true
                    },
                    width: 400,
                    height: 240,
                    is3D: true,
                    backgroundColor: '#FFFFFF',
                    legend: {
                        position: 'labeled',
                        textStyle: {
                            color: '#444444'     // The color of the text.
                        }
                    }
                };
                var data = response.getDataTable();
                // Instantiate and draw our chart, passing in some options.
                // Do not forget to check your div ID
                var view = new google.visualization.DataView(data);
                view.setColumns([0, 1,
                    {calc: "stringify",
                        sourceColumn: 1,
                        type: "string",
                        role: "annotation"}
                ]);

                var chart = new google.visualization.PieChart(document.getElementById('citywise_div'));
                chart.draw(view, options);
            }
        </script>
        <script type="text/javascript">
            function handleLangResponse(response) {
                if (response.isError()) {
                    alert('Error in query: ' + response.getMessage() + ' ' + response.getDetailedMessage());
                    return;
                }
                var options = {
                    colors:['#003399','#0066CC','#0033CC',
                        '#000099','#0000CC','#000066',
                        '#333399','#3333FF','#3333CC',
                        '#3333CC'],
                    width: 400,
                    height: 240,
                    is3D: true,
                    //            animation: {
                    //                startup: true,
                    //                duration: 3000
                    //            },
//                    title: 'Language Breakup',
                    titleTextStyle: {
                        color: '#444444',
                        fontSize: 20,
                        bold: true
                    },
                    backgroundColor: '#FFFFFF',
                    legend: {
                        textStyle: {
                            color: '#444444'     // The color of the text.
                        }
                    },
                    hAxis: {
                        textStyle: {
                            color: '#444444'
                        }
                    },
                    vAxis: {
                        textStyle: {
                            color: '#444444'
                        }
                    }
                };
                var data = response.getDataTable();
                var view = new google.visualization.DataView(data);
                view.setColumns([0, 1,
                    {calc: "stringify",
                        sourceColumn: 1,
                        type: "string",
                        role: "annotation"}
                ]);
                var chart = new google.visualization.ColumnChart(document.getElementById('langwise_div'));
                chart.draw(view, options);
                //        var chart = new google.charts.Bar(document.getElementById('langwise_div'));
                //        chart.draw(data, google.charts.Bar.convertOptions(options));
            }
        </script>
        <script type="text/javascript">
            function handleNewspaperResponse(response) {
                if (response.isError()) {
                    alert('Error in query: ' + response.getMessage() + ' ' + response.getDetailedMessage());
                    return;
                }
                var options = {
                    colors:['#003399','#0066CC','#0033CC',
                        '#000099','#0000CC','#000066',
                        '#333399','#3333FF','#3333CC',
                        '#3333CC'],
                    width: 800,
                    height: 240,
                    is3D: true,
                    //            animation: {
                    //                startup: true,
                    //                duration: 3000
                    //            },
//                    title: 'Newspaper Breakup',
                    titleTextStyle: {
                        color: '#444444',
                        fontSize: 20,
                        bold: true
                    },
                    backgroundColor: '#FFFFFF',
                    legend: {
                        textStyle: {
                            color: '#444444'     // The color of the text.
                        }
                    },
                    hAxis: {
                        textStyle: {
                            color: '#444444'
                        }
                    },
                    vAxis: {
                        textStyle: {
                            color: '#444444'
                        }
                    }
                };
                var data = response.getDataTable();
                var view = new google.visualization.DataView(data);
                view.setColumns([0, 1,
                    {calc: "stringify",
                        sourceColumn: 1,
                        type: "string",
                        role: "annotation"}
                ]);
                var chart = new google.visualization.ColumnChart(document.getElementById('newspaperwise_div'));
                chart.draw(view, options);
                //        var chart = new google.charts.Bar(document.getElementById('langwise_div'));
                //        chart.draw(data, google.charts.Bar.convertOptions(options));
            }
        </script>
        <script type="text/javascript">
            function handleJournalFactResponse(response) {
                if (response.isError()) {
                    alert('Error in query: ' + response.getMessage() + ' ' + response.getDetailedMessage());
                    return;
                }
                var options = {
                    colors:['#003399','#0066CC','#0033CC',
                        '#000099','#0000CC','#000066',
                        '#333399','#3333FF','#3333CC',
                        '#3333CC'],
//                    title: 'Journalist Factor Breakup',
                    titleTextStyle: {
                        color: '#444444',
                        fontSize: 20,
                        bold: true
                    },
                    width: 400,
                    height: 240,
                    is3D: true,
                    backgroundColor: '#FFFFFF',
                    legend: {
                        position: 'labeled',
                        textStyle: {
                            color: '#444444'     // The color of the text.
                        }
                    }
                };
                var data = response.getDataTable();
                // Instantiate and draw our chart, passing in some options.
                // Do not forget to check your div ID
                var view = new google.visualization.DataView(data);
                view.setColumns([0, 1,
                    {calc: "stringify",
                        sourceColumn: 1,
                        type: "string",
                        role: "annotation"}
                ]);

                var chart = new google.visualization.PieChart(document.getElementById('journalfact_div'));
                chart.draw(view, options);
            }
        </script>
        <script type="text/javascript">
            function handleCFResponse(response) {
                if (response.isError()) {
                    alert('Error in query: ' + response.getMessage() + ' ' + response.getDetailedMessage());
                    return;
                }
                var options = {
                    colors:['#003399','#0066CC','#0033CC',
                        '#000099','#0000CC','#000066',
                        '#333399','#3333FF','#3333CC',
                        '#3333CC'],
                    width: 400,
                    height: 240,
                    is3D: true,
                    //            animation: {
                    //                startup: true,
                    //                duration: 3000
                    //            },
//                    title: 'Circulation Figure per Keyword',
                    titleTextStyle: {
                        color: '#444444',
                        fontSize: 20,
                        bold: true
                    },
                    backgroundColor: '#FFFFFF',
                    legend: {
                        textStyle: {
                            color: '#444444'     // The color of the text.
                        }
                    },
                    hAxis: {
                        textStyle: {
                            color: '#444444'
                        }
                    },
                    vAxis: {
                        textStyle: {
                            color: '#444444'
                        }
                    }
                };
                var data = response.getDataTable();
                var view = new google.visualization.DataView(data);
                view.setColumns([0, 1,
                    {calc: "stringify",
                        sourceColumn: 1,
                        type: "string",
                        role: "annotation"}
                ]);
                var chart = new google.visualization.ColumnChart(document.getElementById('circfig_div'));
                chart.draw(view, options);
//                var chart = new google.charts.Bar(document.getElementById('circfig_div'));
//                chart.draw(data, google.charts.Bar.convertOptions(options));
            }
        </script>
        <script type="text/javascript">
        </script>
    </head>
    <body>
        <div id="header_container">
            <div id="header">
                <a href="index.jsp" style="text-align: left; float: left;"><img src="images/logo.png" alt="Playright Analytics" title="Playright Analytics" border="0" /></a>
                <a href="index.jsp" style="text-align: right; float: right;"><img src="images/rcb.png" alt="Royal Challengers Bangalore" title="Royal Challengers Bangalore" border="0" /></a>
            </div>
        </div>            
        <div id="body_container">
            <div class="printbutton">
                <div class="innerdivf">
                    <button id="print" name="print" onclick="window.print();">Print</button>
                </div>        
            </div>          
            <div class="rowdivtitle">
                <div class="innerdivl">
                    <div id="titlel">City Breakup</div>
                </div>
                <div class="innerdivr">
                    <div id="titler">Language Breakup</div>
                </div>
            </div>            
            <div class="rowdiv">
                <div class="innerdivl">
                    <div id="citywise_div"></div>
                </div>
                <div class="innerdivr">
                    <div id="langwise_div"></div>
                </div>
            </div>
            <div class="rowdivtitle">
                <div class="innerdivl">
                    <h>Journalist Factor Breakup</h>
                </div>
                <div class="innerdivr">
                    <h>Circulation Figure per Keyword</h>
                </div>
            </div>            
            <div class="rowdiv">
                <div class="innerdivl">
                    <div id="journalfact_div"></div>
                </div>
                <div class="innerdivr">
                    <div id="circfig_div"></div>
                </div>
            </div>
            <div class="rowdivtitle">
                <div class="innerdivf">
                    <h>Newspaper Breakup</h>
                </div>        
            </div>             
            <div class="rowdiv">
                <div class="innerdivf">
                    <div id="newspaperwise_div"></div>
                </div>        
            </div>
        </div>
        <div id="footer_container">
            <div id="footer">
                <a href="http://revvster.in/" style="text-align: center; float: bottom;"><img src="images/powered-by.png" alt="Revvster Inc." title="Revvster Inc." border="0" /></a>
            </div>
        </div>
    </body>
</html>