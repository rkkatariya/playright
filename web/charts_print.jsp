<%-- 
    Document   : chart
    Created on : Mar 13, 2015, 1:09:48 PM
    Author     : Rahul
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>PlayRight Analytics</title>
        <link href="css/prchart_print.css" rel="stylesheet" type="text/css" />
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

                query = new google.visualization.Query('ChartServlet?chart=journalfactorsplit&' + params);
                query.send(handleJournalFactResponse);

                query = new google.visualization.Query('ChartServlet?chart=cfvaluebar&' + params);
                query.send(handleKeywordResponse);
                
                query = new google.visualization.Query('ChartServlet?chart=topenglish&' + params);
                query.send(handleTopEngResponse);

                query = new google.visualization.Query('ChartServlet?chart=topvernacular&' + params);
                query.send(handleTopVernacularResponse);
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
                    chartArea: { 
                        top: 5,
                        left: 10,
                        width: '90%',
                        height: '90%'
                    },                    
                    colors: ['#e74c3c','#f1c40f','#c0392b'],
                    pieHole: 0.5,
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
                    chartArea: { 
                        top: 5,
                        left: 20,
                        width: '90%',
                        height: '85%'
                    },                    
                    colors:['#e74c3c'],
                    backgroundColor: '#FFFFFF',
                    legend: {
                        position: 'none',
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
            function handleJournalFactResponse(response) {
                if (response.isError()) {
                    alert('Error in query: ' + response.getMessage() + ' ' + response.getDetailedMessage());
                    return;
                }
                var options = {
                    chartArea: { 
                        top: 5,
                        left: 10,
                        width: '90%',
                        height: '90%'
                    },                    
                    colors: ['#e74c3c','#f1c40f','#c0392b'],
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
            function handleKeywordResponse(response) {
                if (response.isError()) {
                    alert('Error in query: ' + response.getMessage() + ' ' + response.getDetailedMessage());
                    return;
                }
                var options = {
                    chartArea: { 
                        top: 5,
                        left: 50,
                        width: '82%',
                        height: '72%'
                    },                      
                    colors:['#f1c40f'],
                    backgroundColor: '#FFFFFF',
                    legend: {
                        position: 'none',
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
                var formatter = new google.visualization.NumberFormat(
                    {prefix: '₹ ', pattern: '##,##,##,###'}
                    );
                formatter.format(data, 1);                
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
            function handleTopEngResponse(response) {
                if (response.isError()) {
                    alert('Error in query: ' + response.getMessage() + ' ' + response.getDetailedMessage());
                    return;
                }
                var options = {
                    chartArea: {
                        top: 5,
                        left: 145,
                        width: '55%', 
                        height: '80%'
                    },
                    colors:['#f1c40f'],
                    backgroundColor: '#FFFFFF',
                    legend: {
                        position: 'none',
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
                var chart = new google.visualization.BarChart(document.getElementById('topenglish_div'));
                chart.draw(view, options);
            }            
        </script>        
        <script type="text/javascript">
            function handleTopVernacularResponse(response) {
                if (response.isError()) {
                    alert('Error in query: ' + response.getMessage() + ' ' + response.getDetailedMessage());
                    return;
                }
                var options = {
                    chartArea: { 
                        top: 5,
                        left: 145,
                        width: '55%', 
                        height: '80%'
                    },
                    colors:['#e74c3c'],
                    backgroundColor: '#FFFFFF',
                    legend: {
                        position: 'none',
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
                var chart = new google.visualization.BarChart(document.getElementById('topvernacular_div'));
                chart.draw(view, options);
            }
        </script>

    </head>
    <body>
        <div id="header_container">
            <div id="header">
                <div style="float: left; width: 15%">
                    <img src="images/logo.png" alt="PlayRight Analytics" title="PlayRight Analytics" border="0" />
                </div>
                <div style="float: left; height: 86px; margin: 0 auto; width: 70%;">
                    <ul style="text-align: center; padding: 15px 0 0 0;">
                        <li style="padding: 0 0 5px 0; font-size: 20px;">PlayRight Media Analysis</li>
                        <% if ("Y".equalsIgnoreCase(request.getParameter("allData"))) { %>
                            <li id="dateStr" style="padding: 5px 0 5px 0; font-size: 12px;"></li>
                            <script type="text/javascript">
                                $.ajax({
                                    url: "ChartServlet",
                                    data:'action=getMinMaxDateStr',
                                    type:"GET",
                                    success:function(data){$('#dateStr').text(data);}
                                });                                
                            </script>
                        <% } else { %>
                            <li style="padding: 0 0 5px 0; font-size: 12px;"><%= request.getParameter("fromDate")%> - <%= request.getParameter("toDate")%></li>
                        <% }%>
                        <li style="padding: 0 0 5px 0; font-size: 12px;">Royal Challengers Bangalore</li>
                    </ul>
                </div>
                <div style="float: right; width: 15%">
                    <img src="images/rcb.png" alt="Royal Challengers Bangalore" title="Royal Challengers Bangalore" border="0" />
                </div>                
            </div> 
        </div>            
        <div id="body_container">
            <div class="printbutton">
                <div class="innerdivf" >
                    <h style="font-size: 20px">Total PR Value is &#x20B9; </h>
                    <h style="font-size: 20px" id="totalPRValue"></h>
                    <button id="print" name="print" onclick="window.print();" style="float: right; margin-right: 50">Print</button>
                </div>        
            </div>            
            <div class="printbutton">
                <div class="innerdivf">
                    
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
                    <h>National Distribution of Coverage</h>
                </div>
                <div class="innerdivr">
                    <h>Language Distribution of Coverage</h>
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
                <div class="innerdivl">
                    <h>Journalist Distribution</h>
                </div>
                <div class="innerdivr">
                    <h>Keyword PR Value</h>
                </div>
            </div>
            <div class="rowdiv">
                <div class="innerdivl">
                    <div id="topenglish_div"></div>
                </div>
                <div class="innerdivr">
                    <div id="topvernacular_div"></div>
                </div>
            </div>
            <div class="rowdivtitle" style="height: 35px;">
                <div class="innerdivl">
                    <h>Top English Print Distribution</h>
                </div>
                <div class="innerdivr">
                    <h>Top Vernacular Print Distribution</h>
                </div>
            </div>            
        </div>
        <div id="footer_container">
            <div id="footer">
                <div style="float: left; width: 420px; padding: 0 0 0 10px">
                    <ul>
                        <li style="font-size: 10px">Copyright © 2015 All rights reserved.</li>
                        <li style="font-size: 8px ">This page or any portion thereof may not be reproduced or used in any manner whatsoever without the express written permission of PlayRight Consulting Private Limited.</li>
                    </ul>
                </div>   
                <div style="float: right; width: 150px">
                    <img src="images/powered-by.png" alt="Revvster Inc." title="Revvster Inc." border="0" />
                </div>
            </div>
        </div>
        <script type="text/javascript">
            var fromDate = '<%= request.getParameter("fromDate")%>';
            var toDate = '<%= request.getParameter("toDate")%>';
            var allData = '<%= request.getParameter("allData")%>';
            var params = 'fromDate=' + fromDate + '&toDate=' + toDate + '&allData=' + allData;
            $.ajax({
                url: "ChartServlet",
                data:'action=getTotalPRValue&' + params,
                type:"GET",
                success:function(data){$('#totalPRValue').text(data);}
            });
        </script>                          
    </body>
</html>