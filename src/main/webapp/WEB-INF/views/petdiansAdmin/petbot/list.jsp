<%--
  Created by IntelliJ IDEA.
  User: m
  Date: 2021-03-29
  Time: 오후 5:05
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../../includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<script src="https://use.fontawesome.com/releases/v5.12.0/js/all.js"></script>

<style>

    .top-campaign{

        margin: 5px;
        min-width: 50%;
        max-width: 50%;

    }

    .table-data {
        height: 682px;
        overflow-y: auto;
    }

    .user-data {
        padding-top: 22px;
    }

    .col-lg-6 {
        -ms-flex: 0 0 70%;
        flex: 0 0 80%;
        max-width: 70%;
    }

    .petbotCenter {
        display: flex;
        justify-content: center;
    }

    .petbotRow {
        display: flex;
        flex-direction: row;
    }

    .au-message-list {
        height: 700px;
    }

    .au-chat__content {
        height: 700px;
        display: flex;
        flex-direction: row;
    }

    .table-top-campaign.table tr td:last-child {
        color: #1b1e21;
        text-align: left;
    }

    .statistic-chart-1, .top-campaign, .chart-percent-2 {
        padding-top: 0px;
    }
</style>

<!-- MAIN CONTENT-->
<div class="petbotCenter">
    <div class="col-lg-6">
        <div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
            <div class="au-card-title" style="background-image:url('images/bg-title-02.jpg');">
                <div class="bg-overlay bg-overlay--blue"></div>
                <h3 class="backToList">
                    <i class="zmdi zmdi-comment-text"></i>Dialogflow Intent List</h3>
                <button class="au-btn-plus">
                    <i class="zmdi zmdi-plus"></i>
                </button>
                <button class="au-btn-plus minusButton" style="right: 110px; background-color: red; display:none;">
                    <i class="zmdi zmdi-minus"></i>
                </button>
            </div>

            <div class="au-inbox-wrap js-inbox-wrap">
                <div class="au-message js-list-load">

                    <div class="au-message__noti">
                        <p>You Have
                            <span>${list.size()}</span>
                            intents
                        </p>
                    </div>


                    <div class="au-message-list">
                        <c:forEach items="${list }" var="intent" varStatus="i">
                            <div class="au-message__item unread" data-idx="${i.index}">
                                <div class="au-message__item-inner">
                                    <div class="au-message__item-text">
                                            <%--                                    <div class="avatar-wrap">--%>
                                            <%--                                        <div class="avatar">--%>
                                            <%--                                            <img src="images/icon/avatar-02.jpg" alt="John Smith">--%>
                                            <%--                                        </div>--%>
                                            <%--                                    </div>--%>
                                        <div class="text">
                                            <h5 class="name">${intent.name}</h5>
                                            <p>${intent.phrasesCount} phrases</p>
                                        </div>
                                    </div>
                                    <div class="au-message__item-time">
                                        <span>12 Min ago</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        <div class="au-message__footer">
                            <button class="au-btn au-btn-load js-load-btn">load more</button>
                        </div>
                    </div>


                    <%--                <div class="au-chat">--%>
                    <%--                    <div class="au-chat__title">--%>
                    <%--                        <div class="au-chat-info">--%>
                    <%--                            <div class="avatar-wrap online">--%>
                    <%--                                <div class="avatar avatar--small">--%>
                    <%--                                    <img src="images/icon/avatar-02.jpg" alt="John Smith">--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                            <span class="nick">--%>
                    <%--<a href="#">John Smith</a>--%>
                    <%--</span>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="au-chat__content">--%>
                    <%--                        <div class="recei-mess-wrap">--%>
                    <%--                            <span class="mess-time">12 Min ago</span>--%>
                    <%--                            <div class="recei-mess__inner">--%>
                    <%--                                <div class="avatar avatar--tiny">--%>
                    <%--                                    <img src="images/icon/avatar-02.jpg" alt="John Smith">--%>
                    <%--                                </div>--%>
                    <%--                                <div class="recei-mess-list">--%>
                    <%--                                    <div class="recei-mess">Lorem ipsum dolor sit amet, consectetur adipiscing elit non--%>
                    <%--                                        iaculis--%>
                    <%--                                    </div>--%>
                    <%--                                    <div class="recei-mess">Donec tempor, sapien ac viverra</div>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="send-mess-wrap">--%>
                    <%--                            <span class="mess-time">30 Sec ago</span>--%>
                    <%--                            <div class="send-mess__inner">--%>
                    <%--                                <div class="send-mess-list">--%>
                    <%--                                    <div class="send-mess">Lorem ipsum dolor sit amet, consectetur adipiscing elit non--%>
                    <%--                                        iaculis--%>
                    <%--                                    </div>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="au-chat-textfield">--%>
                    <%--                        <form class="au-form-icon">--%>
                    <%--                            <input class="au-input au-input--full au-input--h65" type="text"--%>
                    <%--                                   placeholder="Type a message">--%>
                    <%--                            <button class="au-input-icon">--%>
                    <%--                                <i class="zmdi zmdi-camera"></i>--%>
                    <%--                            </button>--%>
                    <%--                        </form>--%>
                    <%--                    </div>--%>
                    <%--                </div>--%>
                </div>


                <div class="au-chat">
                    <div class="au-chat__title">
                        <div class="au-chat-info">
                            <span class="nick">Intent Name</span>
                        </div>
                    </div>
                    <div class="au-chat__content">
                        <div class="top-campaign">
                            <div class="table-responsive">
                                <div class="intent phrase"><input name="training-phrase" value="" placeholder="Add Training phrase"
                                                                  style="min-width: 96%; background: gainsboro; padding: 10px;"/>
                                    <button class="phraseBtn"><i class="zmdi zmdi-plus" style="margin-left: 5px;"></i></button></div>
                                <table class="table table-top-campaign">
                                    <tbody class="phrasesBody">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="top-campaign">
                            <div class="table-responsive">
                                <div class="intent response"><input name="response" value="" placeholder="Add response"
                                                                    style="min-width: 96%; background: gainsboro; padding: 10px;"/>
                                    <button class="responseBtn"><i class="zmdi zmdi-plus" style="margin-left: 5px;"></i></button></div>
                                <table class="table table-top-campaign">
                                    <tbody class="responseBody">

                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>

    <%--    Modal  --%>
    <!-- SMALL MODAL -->
    <div class="modal fade" id="smallmodal" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel"
         style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document" style="max-width: 30%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="smallmodalLabel">Intent Register</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form class="form-header" action="" method="POST">
                        <input class="au-input au-input--xl intentInput" type="text" name="search"
                               placeholder="Search for datas &amp; reports..." style="min-width: 88%">
                        <button class="au-btn--submit" type="submit">
                            <i class="zmdi zmdi-search"></i>
                        </button>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary register">Register</button>
                </div>
            </div>
        </div>
    </div>

    <!-- DELETE MODAL -->
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel"
         style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document" style="max-width: 30%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="smallmodalLabel2">Delete Intent</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                   <h5 class="deleteModalBody"></h5>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-danger deleteConfirm">Delete</button>
                </div>
            </div>
        </div>
    </div>

    <br/>

    <!-- ACTION FORM -->
    <form class="actionForm" action="/petdiansAdmin/user/list" method="get">
        <input type="hidden" name="page" value="${pageDTO.page}">
        <input type="hidden" name="perSheet" value="${pageDTO.perSheet}">
        <input type="hidden" name="type" value="${pageDTO.type}">
        <input type="hidden" name="keyword" value="${pageDTO.keyword}">
    </form>
    <script>

        var phrasesBody = document.querySelector(".phrasesBody");
        var intentName = document.querySelector(".nick");
        var responseBody = document.querySelector(".responseBody");

        var csrfTokenValue = "${_csrf.token}";

        function registerIntent(data){
            return fetch("/petdiansAdmin/petbot/register", {
                method : 'post',
                headers : {'Content-Type' : 'application/json',  'X-CSRF-TOKEN': csrfTokenValue},
                body : JSON.stringify(data)
            })
            .then(res=>{
                if(!res.ok){
                    throw new Error(res);
                }
                console.log("==================== FETCH DONE =================")
                return res.text()
            })
            .catch(res=>{
                console.log("=============== CATCH ==================");
                console.log(res);
                return res;
            }).then(window.location = "/petdiansAdmin/petbot/list");
        }

        function deleteIntent(data){
            return fetch("/petdiansAdmin/petbot/delete", {
                method : 'post',
                headers : {'Content-Type' : 'application/json',  'X-CSRF-TOKEN': csrfTokenValue},
                body : JSON.stringify(data)
            })
                .then(res=>{
                    if(!res.ok){
                        throw new Error(res);
                    }
                    console.log("==================== FETCH DONE =================")
                    return res.text()
                })
                .catch(res=>{
                    console.log("=============== CATCH ==================");
                    console.log(res);
                    return res;
                })
        }

        function register(url, data) {

            var str = JSON.stringify(data);
            console.log(str)
            return fetch(url, {
                method : 'post',
                headers : {'Content-Type' : 'application/json',  'X-CSRF-TOKEN': csrfTokenValue},
                body : str
            })
                .then(res=>{
                    if(!res.ok){
                        throw new Error(res);
                    }
                    console.log("==================== FETCH DONE =================")
                    return res.json()
                })
                .catch(res=>{
                    console.log("=============== CATCH ==================");
                    console.dir(res);
                    return res;
                })

        }

        var templist = ${jsonlist};

        //Intent List 클릭
        document.querySelector(".au-message-list").addEventListener("click", function (e) {

            console.log("CLICKED!!!!");
            var templist = ${jsonlist};

            const target = e.target;
            const idx = target.closest(".au-message__item.unread").getAttribute("data-idx");
            var jsonlist = JSON.parse(templist[0][idx]);

            // PHRASES LIST 추가
            var phrases = jsonlist['phrasesList'];

            var inner = '';
            phrases.forEach(p => {
                inner += '<tr><td><p><i class="fa ng-scope fa-quote-right" ></i>&nbsp;&nbsp;&nbsp;&nbsp;' + p + '</p></td></tr>'
            })
            phrasesBody.innerHTML = inner;

            inner = '';
            var messages = jsonlist['messageList'];

            console.log(messages);

            messages.forEach(m => {
                inner += '<tr><td><p><i class="fa ng-scope fa-quote-right" ></i>&nbsp;&nbsp;&nbsp;&nbsp;' + m + '</p></td></tr>'
            })
            responseBody.innerHTML = inner;

            // INTENT NAME 추가
            intentName.innerHTML = jsonlist['name'];

            // Intent 삭제 버튼 추가
            var minusButton =  document.querySelector(".minusButton");
            minusButton.style.display = "block";
            minusButton.setAttribute("data-idx", idx);

            // 삭제 버튼
            minusButton.addEventListener("click", function(e){
                console.log("DELETE BUTTON");
                const modal = $("#deleteModal");

                // 모달창에 내용 추가
                document.querySelector(".deleteModalBody").innerHTML = "Would you like to delete '" + jsonlist['name'] + "'?";

                // 모달창 띄우기
                modal.modal('show');

                // 삭제 확인 버튼(최종)
                document.querySelector(".deleteConfirm").addEventListener("click", function(e) {
                    // AJAX SEND
                    var result = deleteIntent(jsonlist['id']);
                    // 삭제 후 다시 list창으로 돌아가기
                    result.then( window.location = "/petdiansAdmin/petbot/list" )
                }, false)

            })

            //Phrase Register
            document.querySelector(".phraseBtn").addEventListener("click", function (e){
                console.log("phraseBtn");
                const target = e.target;
                const phrase = {id: jsonlist['id'] , phrase : target.closest("div").querySelector("input").value}
                console.log(phrase);
                const url = "/petdiansAdmin/petbot/addPhrase";
                const result = register(url, phrase);

                result.then(res => {
                    console.log(res);

                    if( res['message'] == "success") {
                        console.log(phrase.phrase);
                        const phrasesBody = document.querySelector(".phrasesBody");
                        const innerTemp = phrasesBody.innerHTML
                        let valuePhrase = '<tr><td><p><i class="fa ng-scope fa-quote-right" ></i>&nbsp;&nbsp;&nbsp;&nbsp;' + phrase.phrase + '</p></td></tr>'
                        valuePhrase += innerTemp;
                        phrasesBody.innerHTML = valuePhrase;
                    }

                })

            }, false)

            // Response Message Register
            document.querySelector(".responseBtn").addEventListener("click", function (e){
                e.stopPropagation();
                e.preventDefault();
                console.log("responseBtn");
                const target = e.target;
                console.log(target);
                var id = jsonlist['id'];
                var resp = target.closest("div").querySelector("input").value;
                const response = {id: id , response : resp}
                console.log(response);
                const url = "/petdiansAdmin/petbot/addResponse";
                const result = register(url, response);

                result.then(res => {
                    console.log(res);

                    if( res['message'] == "success") {
                        console.log(response.response);
                        const phrasesBody = document.querySelector(".responseBody");
                        const innerTemp = phrasesBody.innerHTML
                        let valuePhrase = '<tr><td><p><i class="fa ng-scope fa-quote-right" ></i>&nbsp;&nbsp;&nbsp;&nbsp;' + response.response + '</p></td></tr>'
                        valuePhrase += innerTemp;
                        phrasesBody.innerHTML = valuePhrase;
                    }

                })

            }, false)

        // LIST 이동 END
        }, false);

        //list로 Back
        document.querySelector(".backToList").addEventListener("click", function (e) {

            const inbox = document.querySelector(".au-inbox-wrap.js-inbox-wrap.show-chat-box");
            inbox.classList.remove("show-chat-box");

        }, false);

        //Intent Input
        document.querySelector(".au-btn-plus").addEventListener("click", function (e) {

            const modal = $("#smallmodal");
            modal.modal("show");

        }, false);

        //Intent Register
        document.querySelector(".register").addEventListener("click", function (e) {

            const modal = $("#smallmodal");
            modal.modal("hide");
            const data =  modal[0].querySelector(".intentInput").value;

            const result = registerIntent(data);

        }, false)





    </script>

<%@ include file="../../includes/footer.jsp" %>