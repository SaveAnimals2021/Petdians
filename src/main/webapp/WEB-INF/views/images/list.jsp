<%--
  Created by IntelliJ IDEA.
  User: m
  Date: 2021-03-30
  Time: 오후 5:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>


<div class="col-lg-9">

        <h1>List</h1>
        <!-- LIST TABLE -->
        <div class="table-responsive table--no-card m-b-30">
            <table class="table table-borderless table-striped table-earning">
                <thead>
                <tr>
                    <th>RegDate</th>
                    <th>AnimalNumber</th>
                    <th>name</th>
                    <th class="text-right">price</th>
                    <th class="text-right">quantity</th>
                    <th class="text-right">total</th>
                </tr>
                </thead>
                <tbody>

                <tr>
                    <td>2018-09-29 05:57</td>
                    <td>100398</td>
                    <td>iPhone X 64Gb Grey</td>
                    <td class="text-right">$999.00</td>
                    <td class="text-right">1</td>
                    <td class="text-right">$999.00</td>
                </tr>

                </tbody>
            </table>
        </div>

        <!-- PAGINATION -->
        <div style="align-content: center">
            <ul class="pagination" style="justify-content: center; padding-top:10px; padding-bottom:10px;">
                <c:if test="${pageMaker.prev }">
                    <li class="page-item">
                        <a class="page-link" href="${pageMaker.start - 10}" tabindex="-1">Previous</a>
                    </li>
                </c:if>
                <!-- begin=${pageMaker.start } / end=${pageMaker.end } 수정 필요 -->
                <c:forEach begin="1" end="10" var="num">
                    <li class="page-item ${num == pageMaker.pageDTO.page?"active":"" }"><a class="page-link"
                                                                                           href="${num }">${num }</a>
                    </li>
                </c:forEach>
                <c:if test="${pageMaker.next }">
                    <li class="page-item">
                        <a class="page-link" href="${pageMaker.end + 1}">Next</a>
                    </li>
                </c:if>
            </ul>
        </div>

</div>


<%@ include file="../includes/footer.jsp" %>
