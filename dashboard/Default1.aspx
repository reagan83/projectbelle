<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default1.aspx.cs" Inherits="ProjectBelle._Default1" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>OpenText BPM Reporting</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/css/bootstrap.css" rel="stylesheet" media="all" type="text/css" />
    <link href="/css/opentext.css" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet" type="text/css">
    <link href="/css/daterangepicker.css" rel="stylesheet" />


    <script src="/js/d3.min.js" type="text/javascript"></script>
    <script src="/js/d3.layout.min.js" type="text/javascript"></script>
    <script src="/js/rickshaw.min.js" type="text/javascript"></script>

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
                            <div class="span12">
                                <ul class="thumbnails">
                                    <li class="span4">
                                    </li>
                                </ul>

                                <div class="row">
                                    <div id="y_axis"></div>
                                    <div id="chartDashboard"></div>
                                </div>
                                <script>

                                    var graph = new Rickshaw.Graph({
                                        element: document.querySelector("#chartDashboard"),
                                        width: 500,
                                        height: 200,
                                        series: [{
                                            color: 'steelblue',
                                            data: [
                                                { x: 0, y: 40 },
                                                { x: 1, y: 49 },
                                                { x: 2, y: 38 },
                                                { x: 3, y: 30 },
                                                { x: 4, y: 32 }]
                                        }]
                                    });

                                    var y_ticks = new Rickshaw.Graph.Axis.Y({
                                        graph: graph,
                                        orientation: 'left',
                                        tickFormat: Rickshaw.Fixtures.Number.formatKMBT,
                                        element: document.getElementById('y_axis'),
                                    });


                                    graph.render();

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
    <script src="/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="/js/bootstrap-tab.js" type="text/javascript"></script>
    <script src="/js/bootstrap-button.js" type="text/javascript"></script>

</body>
</html>
