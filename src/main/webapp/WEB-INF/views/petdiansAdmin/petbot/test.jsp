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
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<script src="https://use.fontawesome.com/releases/v5.12.0/js/all.js"></script>

<style>

    .au-chat-textfield{
        padding:2em;
        padding-top:1em;
        padding-bottom:1em;
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
        padding-top:2em;
    }

    .petbotCenter {
        display: flex;
        justify-content: center;
        height: 100%;
    }

    .petbotRow {
        display: flex;
        flex-direction: row;
    }

    .petbotColumn {
        display: flex;
        flex-direction: column;
        height: 100%;
    }

    .au-message-list {
        height: 700px;
    }

    .au-chat__content {
        height: 600px;
        display: flex;
        flex-direction: row;

    }

    .table-top-campaign.table tr td:last-child {
        color: #1b1e21;
        text-align: left;
    }

    .send-mess-wrap {
        margin-top : 0px;
        width: 100%;
    }
    .recei-mess-list {
        /* width: -webkit-calc(100% - 42px); */
        width: -moz-calc(100%);
        width: calc(100%);
    }
    .leftMessage {
        display: flex;
        justify-content: left;
    }

    .rightMessage {
        display: flex;
        justify-content: right;
    }

    .bg-overlay--purple {

        background: rgba(125, 102, 239, 0.9);
    }
</style>

<!-- MAIN CONTENT-->
<div class="petbotCenter" style="background-color: #CCCCCC">
    <div class="col-lg-6" style="max-width: 50%;">
        <div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
            <div class="au-card-title" style="background-image:url('/resources/images/animal.jpg');">
                <div class="bg-overlay bg-overlay--purple"></div>
                <h3>
                    <i class="zmdi zmdi-comment-text"></i>Petbot Chatting!</h3>

            </div>
            <div class="au-inbox-wrap js-inbox-wrap show-chat-box">
                <div class="au-message js-list-load">
                    <div class="au-message__noti">
                        <p>You Have
                            <span>2</span>

                            new messages
                        </p>
                    </div>
                </div>

                <div class="au-chat">
                    <div class="au-chat__title">

                    </div>
                    <div class="au-chat__content">
                        <div class="send-mess-wrap petbotColumn">
<%--                            <span class="mess-time">30 Sec ago</span>--%>

                            <div class="send-mess__inner ">
                                <div class="send-mess-list rightMessage">
                                    <div class="send-mess">안녕하세요? 펫봇입니다. 무엇을 도와드릴까요?
                                    </div>
                                </div>
                            </div>



                        </div>
                    </div>
                    <div class="au-chat-textfield" style="background-color: #7D66EF">
                        <form class="au-form-icon chatForm">
                            <input class="au-input au-input--full au-input--h65 chatInput" type="text"
                                   placeholder="Type a message">
                            <button class="au-input-icon chatButton">
                                <i class="zmdi zmdi-arrow-right"></i>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    var csrfTokenValue = "${_csrf.token}";
    var chatForm = document.querySelector(".chatForm");
    var chatInput = document.querySelector(".chatInput");
    var chatList = document.querySelector(".send-mess-wrap");
    var chatContent = document.querySelector(".au-chat__content");

    function getPetbotMessage(text) {
        return fetch("/petdiansAdmin/petbot/test", {
            method: 'post',
            headers: {'Content-Type': 'application/json', 'X-CSRF-TOKEN': csrfTokenValue},
            body: text
        })
            .then(res => {
                if (!res.ok) {
                    throw new Error(res);
                }
                console.log("==================== FETCH DONE =================")
                return res.json()
            })
            .catch(res => {
                console.log("=============== CATCH ==================");
                console.dir(res);
                return res;
            })

    }

    function addChat(text) {
        chatList.innerHTML += '  <div class="send-mess__inner "><div class="recei-mess-list leftMessage">' +
            '<div class="recei-mess">' +
            text +
            '</div></div></div>';

        chatContent.scrollTop = chatContent.scrollHeight;
    }

    function addPetbotChat(text) {
        chatList.innerHTML += '  <div class="send-mess__inner "><div class="send-mess-list rightMessage">' +
            '<div class="send-mess">' +
            text +
            '</div></div></div>';

        chatContent.scrollTop = chatContent.scrollHeight;
    }

    document.querySelector(".chatButton").addEventListener("click", function (e) {
        e.preventDefault();
        console.log("CHAT ENTER");

        var userText = chatInput.value;
        addChat(userText, 'left');
        console.log(userText);
        var result = getPetbotMessage(userText);

        result.then(r=>{
            var petbotTest = r['response'];
            console.log(petbotTest);
            addPetbotChat(petbotTest);
        })

        chatInput.value = '';

    }, false);
    // 채팅 ㄱㄱ


</script>

<%@ include file="../../includes/footer.jsp" %>