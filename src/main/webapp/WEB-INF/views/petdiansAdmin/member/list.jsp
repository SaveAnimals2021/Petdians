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
        padding-top:22px;
    }
</style>

<!-- MAIN CONTENT-->

<div class="user-data ">
    <h3 class="title-3 m-b-30">
        <i class="zmdi zmdi-account-calendar"></i>member data</h3>

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
                <td>name</td>
                <td>user ID</td>
                <td>phone Number</td>
                <td>register date</td>
                <td>modified date</td>
                <td>role</td>
                <td></td>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${list}" var="user">

            <tr>
                <td>
                    <label class="au-checkbox">
                        <input type="checkbox">
                        <span class="au-checkmark"></span>
                    </label>
                </td>
                <td>
                    <div class="table-data__info">
                        <h5>${user.memberName}</h5>
                        <span>
<a href="#">${user.memberEmail}</a>
</span>
                    </div>
                </td>
                <td> <h5>${user.memberID}</h5></td>
                <td> <h5>${user.memberPhone}</h5></td>
                <td> <h5>${user.regDate}</td>
                <td> <h5>${user.updateDate}  </td>
                <td> <span class="role admin"></span>      </td>
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
            <li class="page-item ${pageMaker.pageDTO.page == num ? 'active' : '' }"><a class="page-link"
                                                                                       href="${num}">${num}</a></li>
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
    <input type="hidden" name="type" value="${pageDTO.type}">
    <input type="hidden" name="keyword" value="${pageDTO.keyword}">
</form>

<button class="testBtn">Test</button>
<script>

    //======================
    // ROLE
    //======================
    var roleList = ${jsonList};
    var eles = document.querySelectorAll(".role");

    for(var i = 0; i < roleList.length; ++i){

        var member = JSON.parse(roleList[i]);
        console.log(member);
        var auth = member.authList[0].authority;
        auth = auth.substring(auth.lastIndexOf("_") + 1);

        console.log(auth);

        eles[i].innerHTML = auth;

        if(auth == "ADMIN"){
            eles[i].setAttribute("class", "role admin");
        } else{
            eles[i].setAttribute("class", "role user");
        }


    }


    // var list0 = JSON.parse(roleList[0]);
    // console.log(list0);

    var eles = document.querySelectorAll(".role");

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

    // document.querySelector("select[name='day']").addEventListener("change", function (e) {
    //
    //     const actionForm = document.querySelector(".actionForm");
    //     const day = document.querySelector("select[name='day']");
    //     actionForm.querySelector("input[name='day']").value = day[day.selectedIndex].value;
    //     actionForm.submit();
    //
    // }, false)

    // document.querySelector(".applyButton").addEventListener("click", function (e) {
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
    //     console.log(type);
    //     console.log(keyword);
    //
    //     //init page
    //     actionForm.querySelector("input[name='page']").value = pageNum = 1;
    //     actionForm.submit();
    //
    // }, false)

    //day
    function change() {

        const day = document.querySelector("select[name='day']");
        const actionForm = document.querySelector(".actionForm");
        actionForm.querySelector("input[name='day']").value = day[day.selectedIndex].value;
        actionForm.querySelector("input[name='page']").value = pageNum = 1;
        actionForm.submit();

    }

    document.querySelector(".testBtn").addEventListener("click", function (e) {

        test().then(res => console.log(res));

    }, false)

    const csrfToeknValue = "${_csrf.token}";

    function test() {
        return fetch("http://localhost:8080/petdiansAdmin/pet/read?pno=2",{

            method:"get",
            headers : {'X-CSRF-TOKEN':csrfToeknValue}

        }).then(res => {

            return res.json();

        });
    }

</script>
<%@ include file="../../includes/footer.jsp" %>