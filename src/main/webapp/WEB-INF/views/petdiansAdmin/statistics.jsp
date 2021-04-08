<%--
  Created by IntelliJ IDEA.
  User: m
  Date: 2021-03-29
  Time: 오후 5:05
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../../includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>

    .secondBody {

    }

</style>


<!-- MAIN CONTENT-->
<div class="section__content section__content--p30">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="overview-wrap">
                    <h2 class="title-1">Crawling Statistics</h2>
                    <button class="au-btn au-btn-icon au-btn--blue">
                        <i class="zmdi zmdi-plus"></i>add item
                    </button>
                </div>
            </div>
        </div>
        <div class="row m-t-25">
            <div class="col-sm-6 col-lg-3">
                <div class="overview-item overview-item--c1">
                    <div class="overview__inner">
                        <div class="overview-box clearfix">
                            <div class="icon">
                                <i class="zmdi zmdi-account-o"></i>
                            </div>
                            <div class="text">
                                <h2>Missing Pets</h2>
                                <h2>10368</h2>

                            </div>
                        </div>
                        <div>
                            <br/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-lg-3">
                <div class="overview-item overview-item--c2">
                    <div class="overview__inner">
                        <div class="overview-box clearfix">
                            <div class="icon">
                                <i class="zmdi zmdi-shopping-cart"></i>
                            </div>
                            <div class="text">
                                <h2>Witnessed Pets</h2>
                                <h2>388,688</h2>
                            </div>
                        </div>
                        <div>
                            <br/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-lg-3">
                <div class="overview-item overview-item--c3">
                    <div class="overview__inner">
                        <div class="overview-box clearfix">
                            <div class="icon">
                                <i class="zmdi zmdi-calendar-note"></i>
                            </div>
                            <div class="text">
                                <h2>Rescued Pets</h2>
                                <h2>1,086</h2>
                            </div>
                        </div>
                        <div>
                            <br/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-lg-3">
                <div class="overview-item overview-item--c4">
                    <div class="overview__inner">
                        <div class="overview-box clearfix">
                            <div class="icon">
                                <i class="zmdi zmdi-money"></i>
                            </div>
                            <div class="text">
                                <h2>Adopted Pets</h2>
                                <h2>$1,060,386</h2>
                            </div>
                        </div>
                        <div>
                            <br/>
                        </div>
<%--                        <div class="overview-chart">--%>
<%--                            <div class="chartjs-size-monitor"--%>
<%--                                 style="position: absolute; inset: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">--%>
<%--                                <div class="chartjs-size-monitor-expand"--%>
<%--                                     style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">--%>
<%--                                    <div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>--%>
<%--                                </div>--%>
<%--                                <div class="chartjs-size-monitor-shrink"--%>
<%--                                     style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">--%>
<%--                                    <div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <canvas id="percentChart" height="115" width="296" class="chartjs-render-monitor"--%>
<%--                                    style="display: block; width: 296px; height: 115px;"></canvas>--%>
<%--                        </div>--%>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-lg-6">
                <div class="au-card recent-report">
                    <div class="au-card-inner">
                        <h3 class="title-2">recent reports</h3>
                        <div class="chart-info">
                            <div class="chart-info__left">
                                <div class="chart-note">
                                    <span class="dot dot--blue"></span>
                                    <span>products</span>
                                </div>
                                <div class="chart-note mr-0">
                                    <span class="dot dot--green"></span>
                                    <span>services</span>
                                </div>
                            </div>
                            <div class="chart-info__right">
                                <div class="chart-statis">
<span class="index incre">
<i class="zmdi zmdi-long-arrow-up"></i>25%</span>
                                    <span class="label">products</span>
                                </div>
                                <div class="chart-statis mr-0">
<span class="index decre">
<i class="zmdi zmdi-long-arrow-down"></i>10%</span>
                                    <span class="label">services</span>
                                </div>
                            </div>
                        </div>
                        <!-- 그래프 차트 -->
                        <div class="recent-report__chart">
                            <div class="chartjs-size-monitor"
                                 style="position: absolute; inset: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
                                <div class="chartjs-size-monitor-expand"
                                     style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                                    <div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
                                </div>
                                <div class="chartjs-size-monitor-shrink"
                                     style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                                    <div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
                                </div>
                            </div>
                            <canvas id="crawlingChart" height="250" width="667" class="chartjs-render-monitor"
                                    style="display: block; width: 667px; height: 250px;"></canvas>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-lg-6">
                <div class="au-card chart-percent-card">
                    <div class="au-card-inner">
                        <h3 class="title-2 tm-b-5">char by %</h3>
                        <div class="row no-gutters">
                            <div class="col-xl-6">
                                <div class="chart-note-wrap">
                                    <div class="chart-note mr-0 d-block">
                                        <span class="dot dot--blue"></span>
                                        <span>products</span>
                                    </div>
                                    <div class="chart-note mr-0 d-block">
                                        <span class="dot dot--red"></span>
                                        <span>services</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="percent-chart">
                                    <div class="chartjs-size-monitor"
                                         style="position: absolute; inset: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
                                        <div class="chartjs-size-monitor-expand"
                                             style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                                            <div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
                                        </div>
                                        <div class="chartjs-size-monitor-shrink"
                                             style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                                            <div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
                                        </div>
                                    </div>
                                    <canvas id="percent-chart" height="280" width="268" class="chartjs-render-monitor"
                                            style="display: block; width: 268px; height: 280px;"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-6">
                <div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
                    <div class="au-card-title" style="background-image:url('images/bg-title-01.jpg');">
                        <div class="bg-overlay bg-overlay--blue"></div>
                        <h3>
                            <i class="zmdi zmdi-account-calendar"></i>26 April, 2018</h3>
                        <button class="au-btn-plus">
                            <i class="zmdi zmdi-plus"></i>
                        </button>
                    </div>
                    <div class="au-task js-list-load">
                        <div class="au-task__title">
                            <p>Tasks for John Doe</p>
                        </div>
                        <div class="au-task-list js-scrollbar3">
                            <div class="au-task__item au-task__item--danger">
                                <div class="au-task__item-inner">
                                    <h5 class="task">
                                        <a href="#">Meeting about plan for Admin Template 2018</a>
                                    </h5>
                                    <span class="time">10:00 AM</span>
                                </div>
                            </div>
                            <div class="au-task__item au-task__item--warning">
                                <div class="au-task__item-inner">
                                    <h5 class="task">
                                        <a href="#">Create new task for Dashboard</a>
                                    </h5>
                                    <span class="time">11:00 AM</span>
                                </div>
                            </div>
                            <div class="au-task__item au-task__item--primary">
                                <div class="au-task__item-inner">
                                    <h5 class="task">
                                        <a href="#">Meeting about plan for Admin Template 2018</a>
                                    </h5>
                                    <span class="time">02:00 PM</span>
                                </div>
                            </div>
                            <div class="au-task__item au-task__item--success">
                                <div class="au-task__item-inner">
                                    <h5 class="task">
                                        <a href="#">Create new task for Dashboard</a>
                                    </h5>
                                    <span class="time">03:30 PM</span>
                                </div>
                            </div>
                            <div class="au-task__item au-task__item--danger js-load-item" style="display: none;">
                                <div class="au-task__item-inner">
                                    <h5 class="task">
                                        <a href="#">Meeting about plan for Admin Template 2018</a>
                                    </h5>
                                    <span class="time">10:00 AM</span>
                                </div>
                            </div>
                            <div class="au-task__item au-task__item--warning js-load-item" style="display: none;">
                                <div class="au-task__item-inner">
                                    <h5 class="task">
                                        <a href="#">Create new task for Dashboard</a>
                                    </h5>
                                    <span class="time">11:00 AM</span>
                                </div>
                            </div>
                        </div>
                        <div class="au-task__footer">
                            <button class="au-btn au-btn-load js-load-btn">load more</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
                    <div class="au-card-title" style="background-image:url('images/bg-title-02.jpg');">
                        <div class="bg-overlay bg-overlay--blue"></div>
                        <h3>
                            <i class="zmdi zmdi-comment-text"></i>New Messages</h3>
                        <button class="au-btn-plus">
                            <i class="zmdi zmdi-plus"></i>
                        </button>
                    </div>
                    <div class="au-inbox-wrap js-inbox-wrap">
                        <div class="au-message js-list-load">
                            <div class="au-message__noti">
                                <p>You Have
                                    <span>2</span>
                                    new messages
                                </p>
                            </div>
                            <div class="au-message-list">
                                <div class="au-message__item unread">
                                    <div class="au-message__item-inner">
                                        <div class="au-message__item-text">
                                            <div class="avatar-wrap">
                                                <div class="avatar">
                                                    <img src="images/icon/avatar-02.jpg" alt="John Smith">
                                                </div>
                                            </div>
                                            <div class="text">
                                                <h5 class="name">John Smith</h5>
                                                <p>Have sent a photo</p>
                                            </div>
                                        </div>
                                        <div class="au-message__item-time">
                                            <span>12 Min ago</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="au-message__item unread">
                                    <div class="au-message__item-inner">
                                        <div class="au-message__item-text">
                                            <div class="avatar-wrap online">
                                                <div class="avatar">
                                                    <img src="images/icon/avatar-03.jpg" alt="Nicholas Martinez">
                                                </div>
                                            </div>
                                            <div class="text">
                                                <h5 class="name">Nicholas Martinez</h5>
                                                <p>You are now connected on message</p>
                                            </div>
                                        </div>
                                        <div class="au-message__item-time">
                                            <span>11:00 PM</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="au-message__item">
                                    <div class="au-message__item-inner">
                                        <div class="au-message__item-text">
                                            <div class="avatar-wrap online">
                                                <div class="avatar">
                                                    <img src="images/icon/avatar-04.jpg" alt="Michelle Sims">
                                                </div>
                                            </div>
                                            <div class="text">
                                                <h5 class="name">Michelle Sims</h5>
                                                <p>Lorem ipsum dolor sit amet</p>
                                            </div>
                                        </div>
                                        <div class="au-message__item-time">
                                            <span>Yesterday</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="au-message__item">
                                    <div class="au-message__item-inner">
                                        <div class="au-message__item-text">
                                            <div class="avatar-wrap">
                                                <div class="avatar">
                                                    <img src="images/icon/avatar-05.jpg" alt="Michelle Sims">
                                                </div>
                                            </div>
                                            <div class="text">
                                                <h5 class="name">Michelle Sims</h5>
                                                <p>Purus feugiat finibus</p>
                                            </div>
                                        </div>
                                        <div class="au-message__item-time">
                                            <span>Sunday</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="au-message__item js-load-item" style="display: none;">
                                    <div class="au-message__item-inner">
                                        <div class="au-message__item-text">
                                            <div class="avatar-wrap online">
                                                <div class="avatar">
                                                    <img src="images/icon/avatar-04.jpg" alt="Michelle Sims">
                                                </div>
                                            </div>
                                            <div class="text">
                                                <h5 class="name">Michelle Sims</h5>
                                                <p>Lorem ipsum dolor sit amet</p>
                                            </div>
                                        </div>
                                        <div class="au-message__item-time">
                                            <span>Yesterday</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="au-message__item js-load-item" style="display: none;">
                                    <div class="au-message__item-inner">
                                        <div class="au-message__item-text">
                                            <div class="avatar-wrap">
                                                <div class="avatar">
                                                    <img src="images/icon/avatar-05.jpg" alt="Michelle Sims">
                                                </div>
                                            </div>
                                            <div class="text">
                                                <h5 class="name">Michelle Sims</h5>
                                                <p>Purus feugiat finibus</p>
                                            </div>
                                        </div>
                                        <div class="au-message__item-time">
                                            <span>Sunday</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="au-message__footer">
                                <button class="au-btn au-btn-load js-load-btn">load more</button>
                            </div>
                        </div>
                        <div class="au-chat">
                            <div class="au-chat__title">
                                <div class="au-chat-info">
                                    <div class="avatar-wrap online">
                                        <div class="avatar avatar--small">
                                            <img src="images/icon/avatar-02.jpg" alt="John Smith">
                                        </div>
                                    </div>
                                    <span class="nick">
<a href="#">John Smith</a>
</span>
                                </div>
                            </div>
                            <div class="au-chat__content">
                                <div class="recei-mess-wrap">
                                    <span class="mess-time">12 Min ago</span>
                                    <div class="recei-mess__inner">
                                        <div class="avatar avatar--tiny">
                                            <img src="images/icon/avatar-02.jpg" alt="John Smith">
                                        </div>
                                        <div class="recei-mess-list">
                                            <div class="recei-mess">Lorem ipsum dolor sit amet, consectetur adipiscing
                                                elit non iaculis
                                            </div>
                                            <div class="recei-mess">Donec tempor, sapien ac viverra</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="send-mess-wrap">
                                    <span class="mess-time">30 Sec ago</span>
                                    <div class="send-mess__inner">
                                        <div class="send-mess-list">
                                            <div class="send-mess">Lorem ipsum dolor sit amet, consectetur adipiscing
                                                elit non iaculis
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="au-chat-textfield">
                                <form class="au-form-icon">
                                    <input class="au-input au-input--full au-input--h65" type="text"
                                           placeholder="Type a message">
                                    <button class="au-input-icon">
                                        <i class="zmdi zmdi-camera"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="copyright">
                    <p>Copyright © 2018 Colorlib. All rights reserved.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    $(document).ready(function () {

        const brandProduct = 'rgba(71,94,246,0.8)'
        const brandService = 'rgba(54,234,126,0.8)'
        const color3 = 'rgba(254,98,11,0.8)'
        const color4 = 'rgba(212,225,90,0.8)'

        var elements = 10
        var data1 = [52, 60, 55, 50, 65, 80, 57, 70, 100, 115]
        var data2 = [102, 70, 80, 100, 56, 53, 80, 75, 65, 90]
        var data3 = [13, 50, 34, 65, 47, 87, 90, 47, 60, 40]
        var data4 = [30, 60, 40, 20, 34, 63, 18, 57, 56, 12]

        var ctx = document.getElementById("crawlingChart");
        console.log(ctx);
        if (ctx) {
            ctx.height = 250;
            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', ''],
                    datasets: [{
                            label: 'Missing Pets',
                            backgroundColor: 'transparent',
                            borderColor: brandService,
                            pointHoverBackgroundColor: '#fff',
                            borderWidth: 0,
                            data: data1
                        },{
                            label: 'Witnessed Pets',
                            backgroundColor: 'transparent',
                            borderColor: brandProduct,
                            pointHoverBackgroundColor: '#fff',
                            borderWidth: 0,
                            data: data2

                        },{
                            label: 'Rescued Pets',
                            backgroundColor: 'transparent',
                            borderColor: color3,
                            pointHoverBackgroundColor: '#fff',
                            borderWidth: 0,
                            data: data3

                        },{
                            label: 'Adopted Pets',
                            backgroundColor: 'transparent',
                            borderColor: color4,
                            pointHoverBackgroundColor: '#fff',
                            borderWidth: 0,
                            data: data4

                        }
                    ]
                },
                options: {
                    maintainAspectRatio: true,
                    legend: {
                        display: false
                    },
                    responsive: true,
                    scales: {
                        xAxes: [{
                            gridLines: {
                                drawOnChartArea: true,
                                color: '#f2f2f2'
                            },
                            ticks: {
                                fontFamily: "Poppins",
                                fontSize: 12
                            }
                        }],
                        yAxes: [{
                            ticks: {
                                beginAtZero: true,
                                maxTicksLimit: 5,
                                stepSize: 50,
                                max: 150,
                                fontFamily: "Poppins",
                                fontSize: 12
                            },
                            gridLines: {
                                display: true,
                                color: '#f2f2f2'

                            }
                        }]
                    },
                    elements: {
                        point: {
                            radius: 0,
                            hitRadius: 10,
                            hoverRadius: 4,
                            hoverBorderWidth: 3
                        }
                    }


                }
            });
        }

        // Percent Chart
        var ctx = document.getElementById("percentChart");
        if (ctx) {
            ctx.height = 280;
            var myChart = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    datasets: [
                        {
                            label: "My First dataset",
                            data: [60, 40],
                            backgroundColor: [
                                '#00b5e9',
                                '#fa4251'
                            ],
                            hoverBackgroundColor: [
                                '#00b5e9',
                                '#fa4251'
                            ],
                            borderWidth: [
                                0, 0
                            ],
                            hoverBorderColor: [
                                'transparent',
                                'transparent'
                            ]
                        }
                    ],
                    labels: [
                        'Products',
                        'Services'
                    ]
                },
                options: {
                    maintainAspectRatio: false,
                    responsive: true,
                    cutoutPercentage: 55,
                    animation: {
                        animateScale: true,
                        animateRotate: true
                    },
                    legend: {
                        display: false
                    },
                    tooltips: {
                        titleFontFamily: "Poppins",
                        xPadding: 15,
                        yPadding: 10,
                        caretPadding: 0,
                        bodyFontSize: 16
                    }
                }
            });
        }


        // document.querySelector(".pagination").addEventListener("click", function (e) {
        //
        //     e.preventDefault();
        //     e.stopPropagation();
        //
        //     const actionForm = document.querySelector(".actionForm");
        //     const target = e.target;
        //
        //     const pageNum = target.getAttribute("href")
        //
        //     if (pageNum) {
        //         actionForm.querySelector("input[name='page']").value = pageNum;
        //         actionForm.submit();
        //     }
        //
        // }, false);
        //
        // document.querySelector("select[name='day']").addEventListener("change", function (e) {
        //
        //     const actionForm = document.querySelector(".actionForm");
        //     const day = document.querySelector("select[name='day']");
        //     actionForm.querySelector("input[name='day']").value = day[day.selectedIndex].value;
        //     actionForm.submit();
        //
        // }, false)
        //
        // document.querySelector(".au-btn-filter").addEventListener("click", function (e) {
        //
        //     e.preventDefault();
        //     e.stopPropagation();
        //
        //     const actionForm = document.querySelector(".actionForm");
        //     //type
        //     const type = document.querySelector("select[name='property']");
        //     actionForm.querySelector("input[name='type']").value = type[type.selectedIndex].value;
        //
        //     //keyword
        //     const keyword = document.querySelector(".table-data__tool-left input[name='skeyword']").value;
        //     actionForm.querySelector("input[name='keyword']").value = keyword;
        //
        //     //init page
        //     actionForm.querySelector("input[name='page']").value = pageNum = 1;
        //     actionForm.submit();
        //
        // }, false)
        //
        // //day
        // function change() {
        //
        //     const day = document.querySelector("select[name='day']");
        //     const actionForm = document.querySelector(".actionForm");
        //     actionForm.querySelector("input[name='day']").value = day[day.selectedIndex].value;
        //     actionForm.querySelector("input[name='page']").value = pageNum = 1;
        //     actionForm.submit();
        //
        // }
    })
</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>