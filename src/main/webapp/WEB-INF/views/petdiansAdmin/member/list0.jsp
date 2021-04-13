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

<script src="https://use.fontawesome.com/releases/v5.12.0/js/all.js"></script>

<style>

    .table-data {
        height: 682px;
        overflow-y: auto;
    }

    .user-data {
        padding-top: 22px;
    }
</style>

<!-- MAIN CONTENT-->

<div class="user-data ">
    <h3 class="title-3 m-b-30">
        <i class="zmdi zmdi-account-calendar"></i>ADMIN DATA</h3>

    <div class="table-responsive table-data">
        <table class="table">
            <thead>
            <tr>
                <td>
                    <label class="au-checkbox">
                        <input type="checkbox">
                        <span class="au-checkmark"></span>
                    </label>
                </td>
                <td>NAME</td>
                <td>ADMIN ID</td>
                <td>REGISTER DATE</td>
                <td>UPDATE DATE</td>
                <td></td>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${list}" var="memberVO">
                <tr>
                    <td>
                        <label class="au-checkbox">
                            <input type="checkbox">
                            <span class="au-checkmark"></span>
                        </label>
                    </td>
                    <td><h5>${memberVO.memberName}</h5></td>
                    <td><h5>${memberVO.memberID}</h5></td>
                    <td><h5>${memberVO.memberID}</h5></td>
                    <td><h5>${memberVO.memberID}</h5></td>
                    <td><h5>${memberVO.regdate}</h5></td>
                    <td><h5>${memberVO.updateDate}</h5></td>
                    <td>
                        <button class="btn btn-warning">Modify</button>
                        <button class="btn btn-secondary">Delete</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


</div>
<br/>
<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">

        <c:if test="${pageMaker.prev}">
            <li class="page-item">
                <a class="page-link" href="${pageMaker.start-1}" tabindex="-1">Previous</a>
            </li>
        </c:if>

        <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">
            <li class="page-item ${pageMaker.pageDTO.page == num ? 'active' : '' }">
                <a class="page-link" href="${num}">${num}</a></li>
        </c:forEach>

        <c:if test="${pageMaker.next}">
            <li class="page-item">
                <a class="page-link" href="${pageMaker.end+1}">Next</a>
            </li>
        </c:if>
    </ul>
</nav>

<!-- ACTION FORM -->
<form class="actionForm" action="/petdiansAdmin/member/list" method="get">
    <input type="hidden" name="page" value="${pageDTO.page}">
    <input type="hidden" name="perSheet" value="${pageDTO.perSheet}">
</form>

<script>

    //======================
    // 페이지
    //======================
    document.querySelector(".pagination").addEventListener("click", function (e) {

        e.preventDefault();
        e.stopPropagation();

        const actionForm = document.querySelector(".actionForm");
        const target = e.target;

        const pageNum = target.getAttribute("href")

        if (pageNum) {
            actionForm.querySelector("input[name='page']").value = pageNum;
            actionForm.submit();
        }

    }, false);

</script>
<%@ include file="../../includes/footer.jsp" %>