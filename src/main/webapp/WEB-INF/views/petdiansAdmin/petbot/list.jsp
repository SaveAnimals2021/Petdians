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

    .phrase, .response{

        display: flex;
        flex-direction: row;

    }

    .phrase-text, .response-text{

        min-width: 97%;
        max-width: 97%;

    }



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
        padding-top: 0;
        height: 700px;
        display: flex;
        flex-direction: row;
    }

    .table-top-campaign.table tr td:last-child {
        color: #1b1e21;
        text-align: left;
    }

    .statistic-chart-1, .top-campaign, .chart-percent-2 {
        padding-top: 3vh;
    }
</style>

<!-- MAIN CONTENT-->
<div class="petbotCenter">
    <div class="col-lg-6">
        <div class="au-card au-card--no-shadow au-card--no-pad m-b-40" style="margin-top: 3vh;">
            <div class="au-card-title">
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
                            <span class="nick" style="font-weight: bolder">Intent Name</span>
                        </div>
                    </div>
                    <div class="au-chat__content">
                        <div class="top-campaign">
                            <div class="table-responsive">
                                <div class="intent phrase"><input name="training-phrase" value="" placeholder="Add Training phrase"
                                                                  style="min-width: 95%; background: gainsboro; padding: 10px;"/>
                                    <button class="pCreateBtn" style="margin-left: 1vh;"><i class="zmdi zmdi-plus" style="color: blue"></i></button></div>
                                <table class="table table-top-campaign">
                                    <tbody class="phrasesBody">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="top-campaign">
                            <div class="table-responsive">
                                <div class="intent response"><input name="response" value="" placeholder="Add response"
                                                                    style="min-width: 95%; background: gainsboro; padding: 10px;"/>
                                    <button class="rCreateBtn" style="margin-left: 1vh;"><i class="zmdi zmdi-plus" style="color: blue"></i></button></div>
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

        const body = document.body;
        const phrasesBody = document.querySelector(".phrasesBody");
        const intentName = document.querySelector(".nick");
        const responseBody = document.querySelector(".responseBody");

        const csrfTokenValue = "${_csrf.token}";

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
            var index = 0;
            phrases.forEach(p => {
                inner = '<tr><td class="phrase"><p class="phrase-text" data-idx="' + index +'"><i class="fa ng-scope fa-quote-right" ></i>&nbsp;&nbsp;&nbsp;&nbsp;' + p + '</p>' +
                    '<button class="pDeleteBtn"><i class="zmdi zmdi-minus" style="margin-left: 5px; color: #ff0000"></i></button></td></tr>' + inner;
                index++;
            })
            phrasesBody.innerHTML = inner;

            inner = '';
            index = 0;
            var messages = jsonlist['messageList'];

            console.log(messages);
            messages.forEach(m => {
                inner = '<tr><td class="response"><p class="response-text" data-idx="' + index +'"><i class="fa ng-scope fa-quote-right" ></i>&nbsp;&nbsp;&nbsp;&nbsp;' + m + '</p>' +
                    '<button class="rDeleteBtn"><i class="zmdi zmdi-minus" style="margin-left: 5px; color: red""></i></button></td></tr>' + inner;
                index++;
            })
            responseBody.innerHTML = inner;

            // INTENT NAME 추가
            intentName.innerHTML = jsonlist['name'];

            // Intent 삭제 버튼 추가
            const minusButton =  document.querySelector(".minusButton");
            minusButton.style.display = "block";
            minusButton.setAttribute("data-idx", idx);

            // 삭제 버튼
            minusButton.addEventListener("click", function(e){
                console.log("DELETE BUTTON");
                const modal = document.querySelector("#deleteModal");

                // 모달창에 내용 추가
                document.querySelector(".deleteModalBody").innerHTML = "Would you like to delete '" + jsonlist['name'] + "'?";

                // 모달창 띄우기
                showModal(modal);

                document.querySelector(".modal-footer").addEventListener("click", function (e) {

                    const target = e.target;
                    if(target.className != "btn.btn-primary.register" || target.className != "btn.btn-secondary") {
                        return;
                    }

                    hideModal(modal);

            }, false)

                // 삭제 확인 버튼(최종)
                document.querySelector(".deleteConfirm").addEventListener("click", function(e) {
                    // AJAX SEND
                    var result = deleteIntent(jsonlist['id']);
                    // 삭제 후 다시 list창으로 돌아가기
                    result.then( window.location = "/petdiansAdmin/petbot/list" )
                }, false)

            })

            //Phrase Register
            document.querySelector(".pCreateBtn").addEventListener("click", function (e){

                console.log("pCreateBtn");
                const target = e.target;
                const phraseInput = target.closest("div").querySelector("input");
                const id = jsonlist['id'];
                const phrase = {id: id , phrase : phraseInput.value}
                const url = "/petdiansAdmin/petbot/addPhrase";
                const result = register(url, phrase);
                phraseInput.value = "";

                result.then(res => {
                    console.log(res);

                    if( res['message'] == "success") {
                        console.log(phrase.phrase);
                        //const phrasesBody = document.querySelector(".phrasesBody");
                        const innerTemp = phrasesBody.innerHTML
                        const index = phrasesBody.childElementCount;
                        let valuePhrase = '<tr><td class="phrase"><p class="phrase-text" data-idx="' + index +'">' +
                            '<i class="fa ng-scope fa-quote-right" ></i>&nbsp;&nbsp;&nbsp;&nbsp;' + phrase.phrase + '</p>' +
                            '<button class="phraseBtn"><i class="zmdi zmdi-minus" style="margin-left: 5px; color: red"></i></button></td></tr>';
                        valuePhrase += innerTemp;
                        phrasesBody.innerHTML = valuePhrase;
                    }

                })

            }, false)

            //Phrase Delete
            document.querySelector(".pDeleteBtn").addEventListener("click", function (e){

                if(e.target.className != "pDeleteBtn") {

                    console.log("Not pDeleteBtn");
                    return;

                }
                console.log("pDeleteBtn");
                const target = e.target;
                const index = target.closest("p").getAttribute("data-idx");
                const phrase = {id: id , index:index}
                const url = "/petdiansAdmin/petbot/removePhrase";
                const result = register(url, phrase);

                result.then(res => {
                    console.log(res);

                    if( res['message'] == "success") {

                        //중간값을 지울 경우가 있기 때문에 for 문 돌려야한다
                        console.log(phrase.phrase);
                        //const phrasesBody = document.querySelector(".phrasesBody");
                        const innerTemp = phrasesBody.innerHTML
                        const index = phrasesBody.childElementCount;
                        let valuePhrase = '<tr><td class="phrase"><p class="phrase-text" data-idx="' + index +'">' +
                            '<i class="fa ng-scope fa-quote-right" ></i>&nbsp;&nbsp;&nbsp;&nbsp;' + phrase.phrase + '</p>' +
                            '<button class="phraseBtn"><i class="zmdi zmdi-minus" style="margin-left: 5px; color: red"></i></button></td></tr>';
                        valuePhrase += innerTemp;
                        phrasesBody.innerHTML = valuePhrase;
                    }

                })

            }, false)

            // Response Message Register
            document.querySelector(".rCreateBtn").addEventListener("click", function (e){

                console.log("rCreateBtn");
                const target = e.target;
                const responseInput = target.closest("div").querySelector("input");
                const id = jsonlist['id'];
                const response = {id: id , response : responseInput.value}
                const url = "/petdiansAdmin/petbot/addResponse";
                const result = register(url, response);
                responseInput.value = "";

                result.then(res => {
                    console.log(res);

                    if( res['message'] == "success") {
                        console.log(response.response);
                        const responseBody = document.querySelector(".responseBody");
                        const innerTemp = responseBody.innerHTML
                        const index = responseBody.childElementCount;
                        let valueResponse = '<tr><td class="response"><p class="response-text" data-idx="' + index +'">' +
                            '<i class="fa ng-scope fa-quote-right" ></i>&nbsp;&nbsp;&nbsp;&nbsp;' + response.response + '</p>' +
                            '<button class="responseBtn"><i class="zmdi zmdi-minus" style="margin-left: 5px; color: red""></i></button></td></tr>';
                        valueResponse += innerTemp;
                        responseBody.innerHTML = valueResponse;
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

            const modal = document.querySelector("#smallmodal");
            // 모달창 띄우기
            showModal(modal);

        }, false);

        //모달창 띄우기
        function showModal(modal) {

            modal.classList.add("show");
            modal.style.display="block";
            body.insertAdjacentHTML("beforeend", "<div class='modal-backdrop fade show'/>");

        }

        //모달창 닫기
        document.querySelectorAll(".btn.btn-secondary").forEach(value => {

            value.addEventListener("click", function (e) {

                const modal = e.target.closest(".modal.fade");
                hideModal(modal);

            }, false)

        });

        function hideModal(modal) {

            modal.classList.remove("show");
            modal.style.display="none";
            body.removeChild(body.lastChild);

        }

        //Intent Register
        document.querySelector(".register").addEventListener("click", function (e) {

            const modal = document.querySelector("#smallmodal");
            hideModal(modal);
            const data =  modal[0].querySelector(".intentInput").value;

            const result = registerIntent(data);

        }, false)



        //============== GEOLOCATION TEST ================//
        //============== GEOLOCATION TEST ================//
        //============== GEOLOCATION TEST ================//

        if('geolocation' in navigator) {
            /* 위치정보 사용 가능 */
            console.log("GEOLOCATION ON!!!!!!!!!!!")

        } else {
            /* 위치정보 사용 불가능 */
            console.log("GEOLOCATION OFF..............")
        }

        navigator.geolocation.getCurrentPosition((position) => {
            console.log(position.coords.latitude, position.coords.longitude);
        });

    </script>

<%@ include file="../../includes/footer.jsp" %>