<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="ProjectBelle._Default" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>OpenText BPM Reporting</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/css/bootstrap.min.css" rel="stylesheet" media="all" type="text/css" />
    <link href="/css/opentext.css" rel="stylesheet" type="text/css" />
    <script src="/js/d3.v2.min.js" type="text/javascript"></script>
</head>
<body>

    <div class="page-title container-fluid">
        <div class="pull-left">
            <h1>BPM Portal</h1>
        </div>
        <div class="pull-right">
            <img src="/img/opentext-site-logo.png" alt="OpenText" />
        </div>
    </div>


    <div class="navbar">
        <div class="navbar-inner nav-collapse">
            <div class="container-fluid">
                <div class="brand">XYZ Financial Services, Inc.</div>
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
                                        <div id="xline"></div>
                                        <div id="yline"></div>
                                        <div id="scatter-dots"></div>

                                                                    <div id="paired-bar-chart">
                            <script type="text/javascript">
<!-- Data for bar chart: Two time-series, alternating to form a single series. Bar Color will switch back & forth -->
//var data = d3.range(10).map(Math.random);
var data = [23, 85, 67, 38, 70, 30, 80, 18 ];
var colorlist = ["maroon", "darkblue"];
var labellist = ["Underwriting", "", "Annuities", "", "Claims Support", "", "Customer Turnover", ""];

var w = 815,
    h = 260,
    labelpad = 165,
    x = d3.scale.linear().domain([0, 100]).range([0, w]),
    y = d3.scale.ordinal().domain(d3.range(data.length)).rangeBands([0, h], .2);

var vis = d3.select("#paired-bar-chart")
  .append("svg:svg")
    .attr("width", w + 40)
    .attr("height", h + 20)
  .append("svg:g")
    .attr("transform", "translate(20,0)");

var bars = vis.selectAll("g.bar")
    .data(data)
  .enter().append("svg:g")
    .attr("class", "bar")
    .attr("transform", function(d, i) { return "translate(" + labelpad + "," + y(i) + ")"; });

bars.append("svg:rect")
    .attr("fill", function(d, i) { return colorlist[i % 2]; } )   //Alternate colors
    .attr("width", x)
    .attr("height", y.rangeBand());

bars.append("svg:text")
    .attr("x", 0)
    .attr("y", 10 + y.rangeBand() / 2)
    .attr("dx", -6)
    .attr("dy", ".35em")
    .attr("text-anchor", "end")
    .text(function(d, i) { return labellist[i]; });


var rules = vis.selectAll("g.rule")
    .data(x.ticks(10))
  .enter().append("svg:g")
    .attr("class", "rule")
    .attr("transform", function(d) { return "translate(" + x(d) + ", 0)"; });

rules.append("svg:line")
    .attr("y1", h)
    .attr("y2", h + 6)
    .attr("x1", labelpad)
    .attr("x2", labelpad)
    .attr("stroke", "black");

rules.append("svg:line")
    .attr("y1", 0)
    .attr("y2", h)
    .attr("x1", labelpad)
    .attr("x2", labelpad)
    .attr("stroke", "white")
    .attr("stroke-opacity", .3);


rules.append("svg:text")
    .attr("y", h + 8)
    .attr("x", labelpad)
    .attr("dy", ".71em")
    .attr("text-anchor", "middle")
    .text(x.tickFormat(10));

</script>
</div>



                                        <div id="paired-line-chart">
                                        
                                        <script type="text/javascript">

/*
                                            d3.csv("./us-income-inequality.csv", function (data1) {

                                                Read CSV file: first row =>  year,top1,top5 
                                                var maxval = 0,
        sampsize = 0;
                                                var label_array = new Array(),
        val_array1 = new Array();

                                                sampsize = data1.length;

                                                for (var i = 0; i < sampsize; i++) {
                                                    label_array[i] = parseInt(data1[i].year);
                                                    val_array1[i] = { x: label_array[i], y: parseFloat(data1[i].p99), z: parseFloat(data1[i].p95) };
                                                    maxval = Math.max(maxval, parseFloat(data1[i].p99), parseFloat(data1[i].p95));
                                                }

                                                maxval = (1 + Math.floor(maxval / 10)) * 10;


                                                var w = 815,
        h = 500,
        p = 30,
        x = d3.scale.linear().domain([label_array[0], label_array[sampsize - 1]]).range([0, w]),
        y = d3.scale.linear().domain([0, maxval]).range([h, 0]);

                                                var vis = d3.select("#paired-line-chart")
       .data([val_array1])
     .append("svg:svg")
       .attr("width", w + p * 2)
       .attr("height", h + p * 2)
     .append("svg:g")
       .attr("transform", "translate(" + p + "," + p + ")");


                                                var rules = vis.selectAll("g.rule")
      .data(x.ticks(15))
     .enter().append("svg:g")
       .attr("class", "rule");

                                                // Draw grid lines
                                                rules.append("svg:line")
    .attr("x1", x)
    .attr("x2", x)
    .attr("y1", 0)
    .attr("y2", h - 1);

                                                rules.append("svg:line")
    .attr("class", function (d) { return d ? null : "axis"; })
    .data(y.ticks(10))
    .attr("y1", y)
    .attr("y2", y)
    .attr("x1", 0)
    .attr("x2", w - 10);

                                                // Place axis tick labels
                                                rules.append("svg:text")
    .attr("x", x)
    .attr("y", h + 15)
    .attr("dy", ".71em")
    .attr("text-anchor", "middle")
    .text(x.tickFormat(10))
    .text(String);

                                                rules.append("svg:text")
    .data(y.ticks(12))
    .attr("y", y)
    .attr("x", -10)
    .attr("dy", ".35em")
    .attr("text-anchor", "end")
    .text(y.tickFormat(5));


                                                // Series I
                                                vis.append("svg:path")
       .attr("class", "line")
       .attr("fill", "none")
       .attr("stroke", "maroon")
       .attr("stroke-width", 2)
       .attr("d", d3.svg.line()
         .x(function (d) { return x(d.x); })
         .y(function (d) { return y(d.y); }));

                                                vis.selectAll("circle.line")
       .data(val_array1)
     .enter().append("svg:circle")
       .attr("class", "line")
       .attr("fill", "maroon")
       .attr("cx", function (d) { return x(d.x); })
       .attr("cy", function (d) { return y(d.y); })
       .attr("r", 1);

                                                // Series II
                                                vis.append("svg:path")
       .attr("class", "line")
       .attr("fill", "none")
       .attr("stroke", "darkblue")
       .attr("stroke-width", 2)
       .attr("d", d3.svg.line()
         .x(function (d) { return x(d.x); })
         .y(function (d) { return y(d.z); }));

                                                vis.select("circle.line")
       .data(val_array1)
     .enter().append("svg:circle")
       .attr("class", "line")
       .attr("fill", "darkblue")
       .attr("cx", function (d) { return x(d.x); })
       .attr("cy", function (d) { return y(d.z); })
       .attr("r", 1);

                                                // -----------------------------
                                                // Add Title then Legend
                                                // -----------------------------
                                                vis.append("svg:text")
       .attr("x", w / 4)
       .attr("y", 20)
       .text("% share of income (excluding capital gains): U.S. 1920-2008");

                                                vis.append("svg:rect")
       .attr("x", w / 2 - 20)
       .attr("y", 50)
       .attr("stroke", "darkblue")
       .attr("height", 2)
       .attr("width", 40);

                                                vis.append("svg:text")
       .attr("x", 30 + w / 2)
       .attr("y", 55)
       .text("Top 5% households");

                                                vis.append("svg:rect")
       .attr("x", w / 2 - 20)
       .attr("y", 80)
       .attr("stroke", "maroon")
       .attr("height", 2)
       .attr("width", 40);

                                                vis.append("svg:text")
       .attr("x", 30 + w / 2)
       .attr("y", 85)
       .text("Top 1% households");
                                            });

                                            */
       </script>

                                               







                                        
                                        </div>



                                    </li>
                                </ul>
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

    <script src="/js/less-1.3.0.min.js" type="text/javascript"></script>
    <script src="/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="/js/bootstrap-tab.js" type="text/javascript"></script>
    <script src="/js/bootstrap-button.js" type="text/javascript"></script>




                                            <script type="text/javascript">
                                                $(document).ready(function () {
                                                    $('#testbutton1').bind('click', function (event) {
                                                        console.log("clicked!");

                                                       
                                                        $.ajax({
                                                        url: 'http://127.0.0.1:1337/ProcessStatistics/ProcessCompleted',
                                                        dataType: "jsonp",
                                                        jsonpCallback: "_testcb",
                                                        cache: false,
                                                        timeout: 5000,
                                                        success: function (data) {
                                                        //$("#test").append(data);
                                                            console.log("Success: " + data);

                                                            var dataset = [[-1, -3], [2, 4], [3, -4], [-3, 1]];

                                                                var width = 400;
                                                                var height = 400;

                                                                var x = d3.scale.linear()
                                                                .domain([-5, 5])
                                                                .range([0, width]);
                                                                var y = d3.scale.linear()
                                                                .domain([-5, 5])
                                                                .range([0, height]);

                                                                var chart = d3.selectAll("#chart-10").append("svg")
                                                                .attr("width", width + 70)
                                                                .attr("height", height + 70)
                                                                .attr("class", chart)
                                                                .append("g")
                                                                .attr("transform", "translate(30, 30)");

                                                                chart.selectAll("xline")
                                                                .data(x.ticks(11))
                                                                .enter().append("line")
                                                                .attr("x1", x)
                                                                .attr("x2", x)
                                                                .attr("y1", 0)
                                                                .attr("y2", height)
                                                                .style("stroke", "#ccc");

                                                                chart.selectAll("yline")
                                                                .data(y.ticks(11))
                                                                .enter().append("line")
                                                                .attr("y1", y)
                                                                .attr("y2", y)
                                                                .attr("x1", 0)
                                                                .attr("x2", width)
                                                                .style("stroke", "#ccc");


                                                                chart.selectAll("scatter-dots")
                                                                .data(dataset)
                                                                .enter().append("circle")
                                                                .attr("cx", function (d) { return x(d[0]); })
                                                                .attr("cy", function (d) { return y(d[1]); })
                                                                .attr("r", 10)
                                                                .style("opacity", 0.6);

                                                        },
                                                        error: function (jqXHR, textStatus, errorThrown) {
                                                        alert('error ' + textStatus + " " + errorThrown);
                                                        }
                                                        });
                                                        
                                                    });

                                                });

                                        </script>

</body>
</html>
