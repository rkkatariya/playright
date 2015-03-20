<%-- 
    Document   : chart
    Created on : Mar 13, 2015, 1:09:48 PM
    Author     : Rahul
--%>

<jsp:include page="header.jsp"/>
<!--Load the Ajax API-->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript">
    document.getElementById('navigator').style.visibility = 'hidden';
    document.getElementById('navigator').style.height = '0px';
    var fromDate = '<%= request.getParameter("fromDate") %>';
    var toDate = '<%= request.getParameter("toDate") %>';
    var allData = '<%= request.getParameter("allData") %>';
    var params = 'fromDate='+fromDate+'&toDate='+toDate+'&allData='+allData;
    // Load the Visualization API and the piechart package.
    google.load('visualization', '1', {'packages': ['corechart']});
//    google.load("visualization", "1.1", {packages:['bar']});
    // Set a callback to run when the Google Visualization API is loaded.
    google.setOnLoadCallback(drawChart);
    function drawChart() {
        var query;
        query = new google.visualization.Query('ChartServlet?chart=citywisesplit&'+params);
        query.send(handleCityResponse);

        query = new google.visualization.Query('ChartServlet?chart=languagewisesplit&'+params);
        query.send(handleLangResponse);

        query = new google.visualization.Query('ChartServlet?chart=newspaperwisesplit&'+params);
        query.send(handleNewspaperResponse);
        
        query = new google.visualization.Query('ChartServlet?chart=journalfactorsplit&'+params);
        query.send(handleJournalFactResponse);
    
        query = new google.visualization.Query('ChartServlet?chart=cfvaluebar&'+params);
        query.send(handleCFResponse);

    };
</script>
<script type="text/javascript">
    function handleCityResponse(response) {
        if (response.isError()) {
            alert('Error in query: ' + response.getMessage() + ' ' + response.getDetailedMessage());
            return;
        }
        var options = {
            title: 'City Breakup',
            titleTextStyle: {
                color: '#DADADA',
                fontSize: 20,
                bold: true
            },
            width: 600,
            height: 400,
            is3D: true,
            backgroundColor: '#3B3B3B',
            legend: {
                position: 'labeled',
                textStyle: {
                    color: '#DADADA'     // The color of the text.
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
            width: 600,
            height: 400,
            is3D: true,
//            animation: {
//                startup: true,
//                duration: 3000
//            },
            title: 'Language Breakup',
            titleTextStyle: {
                color: '#DADADA',
                fontSize: 20,
                bold: true
            },
            backgroundColor: '#3B3B3B',
            legend: {
                textStyle: {
                    color: '#DADADA'     // The color of the text.
                }
            },
            hAxis: {  
                textStyle: {
                    color: '#DADADA'
                }
            },
            vAxis: {
                textStyle: {
                    color: '#DADADA'
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
            height: 400,
            is3D: true,
//            animation: {
//                startup: true,
//                duration: 3000
//            },
            title: 'Newspaper Breakup',
            titleTextStyle: {
                color: '#DADADA',
                fontSize: 20,
                bold: true
            },
            backgroundColor: '#3B3B3B',
            legend: {
                textStyle: {
                    color: '#DADADA'     // The color of the text.
                }
            },
            hAxis: {  
                textStyle: {
                    color: '#DADADA'
                }
            },
            vAxis: {
                textStyle: {
                    color: '#DADADA'
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
            title: 'Journalist Factor Breakup',
            titleTextStyle: {
                color: '#DADADA',
                fontSize: 20,
                bold: true
            },
            width: 600,
            height: 400,
            is3D: true,
            backgroundColor: '#3B3B3B',
            legend: {
                position: 'labeled',
                textStyle: {
                    color: '#DADADA'     // The color of the text.
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
            width: 600,
            height: 400,
            is3D: true,
//            animation: {
//                startup: true,
//                duration: 3000
//            },
            title: 'Circulation Figure per Keyword',
            titleTextStyle: {
                color: '#DADADA',
                fontSize: 20,
                bold: true
            },
            backgroundColor: '#3B3B3B',
            legend: {
                textStyle: {
                    color: '#DADADA'     // The color of the text.
                }
            },
            hAxis: {  
                textStyle: {
                    color: '#DADADA'
                }
            },
            vAxis: {
                textStyle: {
                    color: '#DADADA'
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
//        var chart = new google.charts.Bar(document.getElementById('langwise_div'));
//        chart.draw(data, google.charts.Bar.convertOptions(options));
    }
</script>
<style type="text/css">
    .container{
        width: 90%;
        margin: 0 auto;
        background-color: #3B3B3B; 
    }
    .rowdiv{
        width: 100%; 
        min-height: 400px;
        text-align: center;
        background-color: #3B3B3B;        
    }
    .innerdivl{
        float: left; 
        width: 50%; 
        min-height: 400px;
        text-align: left;
        background-color: #3B3B3B;
    }
    .innerdivr{
        float: right; 
        width: 50%; 
        min-height: 400px;
        text-align: right;
        background-color: #3B3B3B;
    }    
    .innerdivf{
        width: 100%; 
        min-height: 400px;
        text-align: center;
        background-color: #3B3B3B;
    }    
</style>
<br>
<div class="container">
    <div class="wrapper">
        <div class="rowdiv">
            <div class="innerdivl">
                <div id="citywise_div"></div>
            </div>
            <div class="innerdivr">
                <div id="langwise_div"></div>
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
        <div class="rowdiv">
            <div class="innerdivf">
                <div id="newspaperwise_div"></div>
            </div>        
        </div>

    </div>
</div>
