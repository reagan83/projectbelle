<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default2.aspx.cs" Inherits="ProjectBelle._Default2" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>OpenText BPM Reporting</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/css/bootstrap.css" rel="stylesheet" media="all" type="text/css" />
    <link href="/css/opentext.css" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet" type="text/css">
    <link href="/css/daterangepicker.css" rel="stylesheet" />
    <script src="/js/jquery-1.7.2.min.js" type="text/javascript"></script>

    <script src="/js/highcharts.js" type="text/javascript"></script>
    <script src="/js/exporting.js"></script>

</head>
<body>

    <div class="page-title container-fluid">
        <div class="pull-left">
            <h1>Analytics Dashboard</h1>
        </div>
        <div class="pull-right">
            <img src="/img/opentext-site-logo.png" alt="OpenText" />
        </div>
    </div>


    <div class="navbar">
        <div class="navbar-inner nav-collapse">
            <div class="container-fluid">
                <div class="brand">B2B Bank, Inc.</div>
                <ul class="nav pull-right">
                    <li class="">
                        <a href="#">Account Settings</a>
                    </li>
                    <li class="divider-vertical"></li>
                    <li class="">
                        <a href="#">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span2 well">
              <div class="sidebar-nav">
                    <ul class="nav nav-list">
                        <li class="nav-header">
                            <i class="icon-home"></i>
                            System Overview
                        </li>
                        <li class="active">
                            <a href="#TabDashboard" data-toggle="tab">
                                Dashboard
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li class="nav-header">
                            <i class="icon-book"></i>
                            Analytics
                        </li>
                        <li><a href="#TabReports" data-toggle="tab">Activity Reports</a></li>
                        <li><a href="#TabReports" data-toggle="tab">Process Reports</a></li>
                        <li><a href="#TabReports" data-toggle="tab">Timed Sequence Reports</a></li>

                        <li class="divider"></li>
                        <li class="nav-header">
                            <i class="icon-cog"></i>
                            Configuration
                        </li>
                        <li>
                            <a href="#TabConfiguration" data-toggle="tab">
                                System Setup
                            </a>
                        </li>
                        <li><a href="#TabConfiguration" data-toggle="tab">Data Connections</a></li>
                    </ul>
                    </div>
            </div>
            <div class="span10">
                <div class="tab-content active">
                    <div class="tab-pane active" id="TabDashboard">
                        <div class="page-header">
                            <h1>Process Overview</h1>
                        </div>

                        <div class="row-fluid">
                            <div class="pagination">
                                <ul>
                                    <li class="">
                                        Total Processes - 5,349                                    </li>
                                </ul>
                            </div>
                            <div class="span12">

                                <div class="row">
                                    <div id="y_axis"></div>
                                    <div id="chartDashboard"></div>
                                </div>

<div id="container2" style="min-width: 400px; height: 400px; margin: 0 auto"></div>

		<script type="text/javascript">


		    $(function () {
		        var chart;

		        function requestData() {
		            $.ajax({
		                url: '/dashboard/query.aspx',
		                success: function (point) {
		                    var series = chart.series[0],
                                shift = series.data.length > 20; // shift if the series is longer than 20

		                    // add the point
		                    chart.series[0].addPoint(point, true, shift);

		                    // call it again after one second
		                    setTimeout(requestData, 1000);
		                },
		                cache: false
		            });
		        }

		        $(document).ready(function () {
		            chart = new Highcharts.Chart({
		                chart: {
		                    renderTo: 'container2',
		                    defaultSeriesType: 'spline',
		                    events: {
		                        load: requestData
		                    }
		                },
		                title: {
		                    text: 'Processes Completed'
		                },
		                xAxis: {
		                    type: 'datetime',
		                    tickPixelInterval: 150,
		                    maxZoom: 20 * 1000
		                },
		                yAxis: {
		                    minPadding: 0.2,
		                    maxPadding: 0.2,
		                    title: {
		                        text: 'Value',
		                        margin: 80
		                    }
		                },
		                series: [{
		                    name: 'Random data',
		                    data: []
		                }]
		            });
		        });
    
		    });
            </script>
                            </div>
                        </div>

                    </div>
                    <div class="tab-pane" id="TabReports">
                        <div class="page-header">
                            <h1>Reports Page</h1>
                                                                   
  
                        </div>
                                                                <div id="chart-10">
                                        <button id="testbutton1">Run</button>

                                        </div>
                    </div>
                    <div class="tab-pane" id="TabConfiguration">
                        <div class="page-header">
                            <h1>Configuration Page</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="">
      <div id="footer-floor">
        <div class="container">
          <div class="row">
            <div class="span12" style="text-align: center;">
              <p>
                © 2012 OpenText, Inc. All Rights Reserved.
                &nbsp;<a href="#">Report a problem</a>.
              </p>
            </div>
          </div>
        </div>
      </div>
    </footer>

    <script src="/js/date.js" type="text/javascript"></script>
    <script src="/js/daterangepicker.js" type="text/javascript"></script>

    <script src="/js/less-1.3.0.min.js" type="text/javascript"></script>
    <script src="/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="/js/bootstrap-tab.js" type="text/javascript"></script>
    <script src="/js/bootstrap-button.js" type="text/javascript"></script>

</body>
</html>
