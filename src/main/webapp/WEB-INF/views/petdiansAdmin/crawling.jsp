<%--
  Created by IntelliJ IDEA.
  User: m
  Date: 2021-03-29
  Time: 오후 5:05
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!-- MAIN CONTENT-->
<div class="main-content" style="padding-top: 30px;">
    <!-- STATISTIC-->
    <section class="statistic statistic2" style="padding-top: 0px;">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-lg-3">
                    <div class="statistic__item statistic__item--green">
                        <h2 class="number">10,368</h2>
                        <span class="desc">Number of Crawling</span>
                        <div class="icon">
                            <i class="zmdi zmdi-account-o"></i>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="statistic__item statistic__item--orange">
                        <h2 class="number">388,688</h2>
                        <span class="desc">Number of new Data</span>
                        <div class="icon">
                            <i class="zmdi zmdi-shopping-cart"></i>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="statistic__item statistic__item--blue">
                        <h2 class="number">1,086</h2>
                        <span class="desc">Nuber of modified Data</span>
                        <div class="icon">
                            <i class="zmdi zmdi-calendar-note"></i>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="statistic__item statistic__item--red">
                        <h2 class="number">${pageMaker.total}</h2>
                        <span class="desc">Number of total Data</span>
                        <div class="icon">
                            <i class="zmdi zmdi-money"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END STATISTIC-->
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-9" style="flex: 0 0 100%; max-width: 100%;">

                    <!-- DATA TABLE -->
                    <div class="table-data__tool">
                        <div class="table-data__tool-left">
                            <div class="rs-select2--light rs-select2--md">
                                <select class="js-select2" name="property">
                                    <option value="">All Properties</option>
                                    <option value="t" ${pageDTO.type == 't'?"selected":"" }>TYPE</option>
                                    <option value="r" ${pageDTO.type == 'r'?"selected":"" }>RESCUDATE</option>
                                    <option value="d" ${pageDTO.type == 'd'?"selected":"" }>REGDATE</option>
                                    <option value="s" ${pageDTO.type == 's'?"selected":"" }>RESCUESTATUS</option>
                                </select>
                                <div class="dropDownSelect2"></div>
                            </div>
                            <div class="rs-select2--light rs-select2--sm">
                                <select class="js-select2" name="day">
                                    <option value="">DAY</option>
                                    <option value="0" ${pageDTO.day == '0'?"selected":"" }>Today</option>
                                    <option value="3" ${pageDTO.day == '3'?"selected":"" }>3 Days</option>
                                    <option value="7" ${pageDTO.day == '7'?"selected":"" }>1 Week</option>
                                </select>
                                <div class="dropDownSelect2"></div>
                            </div>
                            <input name="skeyword" <c:out value="" /> placeholder="Enter Keyword">
                            <button class="au-btn-filter">
                                <i class="zmdi zmdi-filter-list"></i>filters</button>
                        </div>
                        <div class="table-data__tool-right">
                            <button class="au-btn au-btn-icon au-btn--green au-btn--small">
                                <i class="zmdi zmdi-plus"></i>add item</button>
                            <div class="rs-select2--dark rs-select2--sm rs-select2--dark2">
                                <select class="js-select2" name="type">
                                    <option selected="selected">Export</option>
                                    <option value="">Option 1</option>
                                    <option value="">Option 2</option>
                                </select>
                                <div class="dropDownSelect2"></div>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive table-responsive-data2">
                        <table class="table table-data2">
                            <thead>
                            <tr>
                                <th>
                                    <label class="au-checkbox">
                                        <input type="checkbox">
                                        <span class="au-checkmark"></span>
                                    </label>
                                </th>
                                <th style="text-align: center;">ANIMAL NUMBER</th>
                                <th class="desc" style="text-align: left;">TYPE</th>
                                <th style="text-align: center;">RESCUEDATE</th>
                                <th style="text-align: center;">REGDATE</th>
                                <th style="text-align: center;">UPDATEDATE</th>
                                <th style="text-align: center;">RESCUESTATUS</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list }" var="animal" >
                            <tr class="tr-shadow">
                                <td>
                                    <label class="au-checkbox">
                                        <input type="checkbox">
                                        <span class="au-checkmark"></span>
                                    </label>
                                </td>
                                <!-- ANIMAL NUMBER -->
                                <td style="text-align: center;">${animal.animalNumber}</td>
                                <td>
                                <!-- TYPE -->
                                    <span class="desc" style="text-align: center;">${animal.type}</span>
                                </td>
                                <!-- RESCUDATE -->
                                <td class="desc" style="text-align: center;">${animal.rescueDate}</td>
                                <!-- REGDATE -->
                                <td style="text-align: center;">${animal.regDate}</td>
                                <!-- UPDATEDATE -->
                                <td style="text-align: center;"><p class="status--process" >${animal.updateDate}</p></td>
                                <!-- RESCUESTATUS -->
                                <td style="text-align: center;">${animal.rescueStatus}</td>
                                <td>
                                    <div class="table-data-feature">
                                        <button class="item" data-toggle="tooltip" data-placement="top" title="Send">
                                            <i class="zmdi zmdi-mail-send"></i>
                                        </button>
                                        <button class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                                            <i class="zmdi zmdi-edit"></i>
                                        </button>
                                        <button class="item" data-toggle="tooltip" data-placement="top" title="Delete">
                                            <i class="zmdi zmdi-delete"></i>
                                        </button>
                                        <button class="item" data-toggle="tooltip" data-placement="top" title="More">
                                            <i class="zmdi zmdi-more"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- END DATA TABLE -->
                    <!-- Pagination -->
                    <div style="align-content: center">
                        <ul class="pagination" style="justify-content: center; padding-top:15px; padding-bottom:10px;">
                            <c:if test="${pageMaker.prev }">
                                <li class="page-item">
                                    <a class="page-link" href="${pageMaker.start - 10}" tabindex="-1">Previous</a>
                                </li>
                            </c:if>
                            <c:forEach begin="${pageMaker.start }" end="${pageMaker.end }" var = "num">
                                <li class="page-item ${num == pageMaker.pageDTO.page?"active":"" }"><a class="page-link" href="${num }">${num }</a></li>
                            </c:forEach>
                            <c:if test="${pageMaker.next }">
                                <li class="page-item">
                                    <a class="page-link" href="${pageMaker.end + 1}">Next</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                    <!-- END Pagination -->

                    <!--                    actionForm                      -->
                    <div class="activity">
                        <form class="actionForm" action="/petdiansAdmin/crawling" method="get">
                            <input type="hidden" name="page" value="${pageDTO.page}">
                            <input type="hidden" name="perSheet" value="${pageDTO.perSheet}">
                            <input type="hidden" name="type" value="${pageDTO.type}">
                            <input type="hidden" name="keyword" value="${pageDTO.keyword}">
                            <input type="hidden" name="day" value="${pageDTO.day}">
                        </form>
                    </div>

                </div>

            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="copyright">
                        <p>Copyright © 2018 Colorlib. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

</div>

<script>
    //utill
    const selOne = document.querySelector.bind(document);
    const selAll = document.querySelectorAll.bind(document);
    const addEvent = function (param,event,func,cap) {

        const target = document.querySelector(param);

        target.addEventListener(event,func,cap);

        return target;
    }

    //실행문

    addEvent(".pagination", "click", function(e){

        e.preventDefault();
        e.stopPropagation();

        const actionForm = selOne(".actionForm");
        const target = e.target;

        const pageNum = target.getAttribute("href")

        if(pageNum){
            actionForm.querySelector("input[name='page']").value = pageNum;
            actionForm.submit();
        }

    }, false);

    addEvent("select[name='day']", "change", function (e) {

        const actionForm = selOne(".actionForm");
        const day = selOne("select[name='day']");
        actionForm.querySelector("input[name='day']").value = day[day.selectedIndex].value;
        actionForm.submit();

    }, false)

    addEvent(".au-btn-filter", "click", function  (e) {

        e.preventDefault();
        e.stopPropagation();

        const actionForm = selOne(".actionForm");
        //type
        const type = selOne("select[name='property']");
        actionForm.querySelector("input[name='type']").value = type[type.selectedIndex].value;

        //keyword
        const keyword = selOne(".table-data__tool-left input[name='skeyword']").value;
        actionForm.querySelector("input[name='keyword']").value = keyword;

        //day
        const day = selOne("select[name='day']");
        actionForm.querySelector("input[name='day']").value = day[day.selectedIndex].value;

        //init page
        actionForm.querySelector("input[name='page']").value = pageNum = 1;
        actionForm.submit();

    }, false)

</script>
<%@ include file="../includes/footer.jsp"%>