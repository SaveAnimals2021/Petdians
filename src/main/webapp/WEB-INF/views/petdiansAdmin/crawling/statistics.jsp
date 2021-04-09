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

    .dot--missing {
        background: #5EEE98;
    }

    .dot--rescued {
        background: #FE813C;
    }

    .dot--adopted {
        background: #DDE77B;
    }

    .dot--witnessed {
        background: #6C7EF8;
    }

    .percent-chart {
        padding: 0;
    }

    .top-campaign {
        padding-bottom: 24px;
        padding-top: 20px;
        background-color: #E4D2E5;
    }

    .chart-statis {
        margin-right: 10px;
    }

    .crawl-between {
        display: flex;
        justify-content: space-between;
    }

    .crawl-center {
        display: flex;
        justify-content: center;
    }

    .crawl-time {
        display: flex;
        justify-content: space-between;
        padding-right: inherit;
        padding-left: inherit;
        margin-bottom: 1em;
    }

    .dot--gray {
        background: #BBBBBB;
    }

</style>


<!-- MAIN CONTENT-->
<div class="section__content section__content--p30">
    <div class="container-fluid">

        <div class="row m-t-25">
            <div class="col-sm-6 col-lg-3">
                <div class="overview-item overview-item--c1">
                    <div class="overview__inner">
                        <div class="overview-box clearfix">
                            <div class="icon">
                                <i class="zmdi zmdi-pin-help"></i>
                            </div>
                            <div class="text">
                                <h2>Missing Pets</h2>
                                <div class="crawl-between">
                                    <h2>${list[0].missingCount}</h2>
                                    <div class="chart-statis">
<span class="index decre">
<i class="zmdi zmdi-long-arrow-down"></i>10%</span>
                                    </div>
                                </div>
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
                                <i class="zmdi zmdi-eye"></i>
                            </div>
                            <div class="text">
                                <h2>Witnessed Pets</h2>
                                <div class="crawl-between">
                                    <h2>${list[0].witnessedCount}</h2>
                                    <div class="chart-statis">
<span class="index decre">
<i class="zmdi zmdi-long-arrow-down"></i>10%</span>
                                    </div>
                                </div>
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
                                <i class="zmdi zmdi-plaster"></i>
                            </div>
                            <div class="text">
                                <h2>Rescued Pets</h2>
                                <div class="crawl-between">
                                    <h2>${list[0].rescuedCount}</h2>
                                    <div class="chart-statis">
<span class="index decre">
<i class="zmdi zmdi-long-arrow-down"></i>10%</span>
                                    </div>
                                </div>
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
                                <i class="zmdi zmdi-home"></i>
                            </div>
                            <div class="text">
                                <h2>Adopted Pets</h2>
                                <div class="crawl-between">
                                    <h2>${list[0].adoptedCount}</h2>
                                    <div class="chart-statis">
<span class="index decre">
<i class="zmdi zmdi-long-arrow-down"></i></span>
                                    </div>
                                </div>
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

        <!-- CRAWLTIME -->
        <div class="row crawl-time">
            <div>
                <h2>LAST CRWALING TIME : ${list[0].crawlDate}</h2>


            </div>
            <div class="nextCrawlTime">
                <h2>NEXT CRWALING TIME : </h2>
            </div>
            <div>
                <button class="au-btn au-btn-load">CHANGE CRAWLING TIME</button>
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
                                    <span class="dot dot--missing"></span>
                                    <span>missing pets</span>
                                </div>
                                <div class="chart-note mr-0">
                                    <span class="dot dot--witnessed"></span>
                                    <span>witnessed pets</span>
                                </div>
                                <div class="chart-note">
                                    <span class="dot dot--rescued"></span>
                                    <span>rescued pets</span>
                                </div>
                                <div class="chart-note">
                                    <span class="dot dot--adopted"></span>
                                    <span>adopted pets</span>
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

            <!-- 퍼센트 카드 -->
            <div class="col-lg-6 ">

                <div class="au-card chart-percent-card ">
                    <div class="au-card-inner">
                        <h3 class="title-2 tm-b-5">char by %</h3>

                        <div class="row no-gutters">
                            <div class="col-xl-6">

                                <div class="chart-note-wrap">
                                    <div class="chart-note mr-0 d-block">
                                        <span class="dot dot--green"></span>
                                        <span class="percentChartNote">dogs</span>

                                        <span class="dot dot--red"></span>
                                        <span class="percentChartNote">cats</span>

                                        <span class="dot dot--blue"></span>
                                        <span class="percentChartNote">etc</span>

                                        <span class="dot dot--gray"></span>
                                        <span class="percentChartNote">unknown</span>

                                    </div>
                                </div>

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
                                    <canvas id="percentChart" height="280" width="408" class="chartjs-render-monitor" style="display: block; width: 408px; height: 280px;"></canvas>
                                </div>


                            </div>
                            <div class="col-xl-6">

                                <!-- 토탈 리스트 -->
                                <div class="top-campaign">
                                    <h3 class="title-3 m-b-30">Total Statistics</h3>
                                    <div class="table-responsive">
                                        <table class="table table-top-campaign">
                                            <tbody>
                                            <tr>
                                                <td>Crawl Try Count</td>
                                                <td>${list[0].crawlCount}</td>
                                            </tr>
                                            <tr>
                                                <td>New Data Count</td>
                                                <td>${list[0].newDataCount}</td>
                                            </tr>
                                            <tr>
                                                <td>Deleted Data Count</td>
                                                <td>${list[0].modDataCount}</td>
                                            </tr>
                                            <tr>
                                                <td>Total Added Data Count</td>
                                                <td>${list[0].newDataCount - list[0].modDataCount}</td>
                                            </tr>
                                            <tr>
                                                <td>Taking Time</td>
                                                <td>${list[0].takingTime}</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>


        <!-- ??? 1 -->


        <!-- ??? -->

    </div>

    <div class="row">
        <div class="col-md-12 crawl-center">
                <button class="btn btn-success btn-lg listButton">Go To Animals List</button>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="copyright">
                <p>Copyright © 2021 Petdians. All rights reserved.</p>
            </div>
        </div>
    </div>
</div>
</div>

<script>

    $(document).ready(function () {

        //======================
        // List로 가기 버튼
        //======================
        document.querySelector(".listButton").addEventListener("click", function(e){
            location.href='http://localhost:8080/petdiansAdmin/crawling/list';
        }, false)

        var list = ${jsonlist};
        var resultList = [];


        //======================//
        // 다음 크롤링 타임 구하기
        //======================//
        function setDigit(time) {
            var timeStr = '';
            // 한자리 수 라면
            if (time < 10) {
                timeStr = '0' + time;
            } else {
                timeStr = time;
            }

            return timeStr;
        }

        function setTimeFormat(time) {

            var result = time.getFullYear() + "/"
            result += setDigit(nextTime.getMonth() + 1) + "/" + setDigit(nextTime.getDate() + 1) + "/" + " 00:00";
            return result;
        }

        var nct = document.querySelector(".nextCrawlTime h2");
        var nextTime = new Date();
        nct.innerHTML += setTimeFormat(nextTime)

        //======================//
        // 경향 퍼센트 구하기
        //======================//
        var incre = '<span class="index incre">' +
            '<i class="zmdi zmdi-long-arrow-down"></i>' + +'</span>'
        var decre = '<span class="index decre">' +
            '<i class="zmdi zmdi-long-arrow-down"></i>' + +'</span>'

        // dom에 들어갈 string
        function makeDomStr(value, ele) {
            var increStr1 = '';
            var increStr2 = '';

            // 양수 음수 체크, 음수면 양수로 변환
            if (0 < value) {
                increStr1 = 'incre';
                increStr2 = 'up';
            } else {
                value *= -1;
                increStr1 = 'decre';
                increStr2 = 'down';
            }

            // DOM 객체 만들기
            var str = '<span class="index ' + increStr1 + '">' +
                '<i class="zmdi zmdi-long-arrow-' + increStr2 + '"></i>' + value + ' %</span>'

            ele.innerHTML = str;
        }

        var mpercent = 0;
        var wpercent = 0;
        var rpercent = 0;
        var apercent = 0;

        // 가져온 정보 객체배열로 만들기
        var length = list.length;
        for (var i = 0; i < length; ++i) {
            resultList.push(JSON.parse(list[length - i - 1]));
        }

        var today = resultList[length - 1];
        var yesterday = resultList[length - 2];

        mpercent = parseInt((today.missingCount - yesterday.missingCount) / today.missingCount * 10000) / 100;
        wpercent = parseInt((today.witnessedCount - yesterday.witnessedCount) / today.witnessedCount * 10000) / 100;
        rpercent = parseInt((today.rescuedCount - yesterday.rescuedCount) / today.rescuedCount * 10000) / 100;
        apercent = parseInt((today.adoptedCount - yesterday.adoptedCount) / today.adoptedCount * 10000) / 100;

        console.info(mpercent)
        console.info(wpercent)
        console.info(rpercent)
        console.info(apercent)

        // DOM에 적용 시키기
        var eles = document.querySelectorAll(".chart-statis");


        var incre = '<span class="index incre">' +
            '<i class="zmdi zmdi-long-arrow-down"></i>' + +'</span>'
        var decre = '<span class="index decre">' +
            '<i class="zmdi zmdi-long-arrow-down"></i>' + +'</span>'

        makeDomStr(mpercent, eles[0]);
        makeDomStr(wpercent, eles[1]);
        makeDomStr(rpercent, eles[2]);
        makeDomStr(apercent, eles[3]);


        //======================//
        // 그래프 차트 그리기
        //======================//
        // 색 정하기
        const color1 = 'rgba(71,94,246,0.8)'
        const color2 = 'rgba(54,234,126,0.8)'
        const color3 = 'rgba(254,98,11,0.8)'
        const color4 = 'rgba(212,225,90,0.8)'

        // 데이터 준비
        var elements = 7

        var data1 = []
        var data2 = []
        var data3 = []
        var data4 = []

        // 날짜 label
        var dateData = []

        // 7일동안의 데이터 넣기
        for (var i = 0; i < 7; ++i) {
            var temp = resultList[i];
            console.log(i + '번째');
            console.log(temp);
            data1.push(temp.missingCount)
            data2.push(temp.witnessedCount)
            data3.push(temp.rescuedCount)
            data4.push(temp.adoptedCount)
            dateData.push(temp.crawlDate.substring(0, 10))
        }

        // 그래프 차트 실제로 그리기
        var ctx = document.getElementById("crawlingChart");
        console.log(ctx);
        if (ctx) {
            ctx.height = 250;
            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: dateData,
                    datasets: [{
                        label: 'Missing Pets',
                        backgroundColor: 'transparent',
                        borderColor: color1,
                        pointHoverBackgroundColor: '#fff',
                        borderWidth: 0,
                        data: data1
                    }, {
                        label: 'Witnessed Pets',
                        backgroundColor: 'transparent',
                        borderColor: color2,
                        pointHoverBackgroundColor: '#fff',
                        borderWidth: 0,
                        data: data2

                    }, {
                        label: 'Rescued Pets',
                        backgroundColor: 'transparent',
                        borderColor: color3,
                        pointHoverBackgroundColor: '#fff',
                        borderWidth: 0,
                        data: data3

                    }, {
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

        //==========================
        // Percent Chart
        //==========================
        var animalInfo = ${animalInfo};

        console.log(animalInfo);

        // NOTE에 정보 추가
        var notes = document.querySelectorAll(".percentChartNote");
        var total = animalInfo.totalCount
        console.log("total : " + total);
        notes[0].innerHTML = 'Dogs ' + (parseInt(animalInfo.dogCount / total * 10000))/100 ;
        notes[1].innerHTML = 'Cats ' + (parseInt(animalInfo.catCount / total * 10000))/100 ;
        notes[2].innerHTML = 'ETC ' + (parseInt(animalInfo.etcCount / total * 10000))/100 ;
        notes[3].innerHTML = 'Unknown ' + (parseInt(animalInfo.unknownCount / total * 10000))/100 ;

        var ctx = document.getElementById("percentChart");
        if (ctx) {
            ctx.height = 280;
            var myChart = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    datasets: [
                        {
                            label: "Dataset",
                            data: [animalInfo.dogCount,
                                animalInfo.catCount,
                                animalInfo.etcCount,
                                animalInfo.unknownCount],
                            backgroundColor: [
                                '#00AD5F', '#fa4251', '#00B5E9', '#BBBBBB'
                            ],
                            hoverBackgroundColor: [
                                '#00AD5F', '#fa4251', '#00B5E9', '#BBBBBB'
                            ],
                            borderWidth: [
                                0, 0, 0, 0
                            ],
                            hoverBorderColor: [
                                'transparent',
                                'transparent',
                                'transparent',
                                'transparent'
                            ]
                        }
                    ],
                    labels: [
                        'Dogs',
                        'Cats',
                        'Etc',
                        'Unknown'
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