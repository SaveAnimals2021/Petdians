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

    .au-chat-textfield {
        padding: 2em;
        padding-top: 1em;
        padding-bottom: 1em;
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
        padding-top: 2em;
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
        margin-top: 0px;
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
        position: relative;
    }

    .rightMessage {
        display: flex;
        justify-content: right;
        position: relative;
    }

    .bg-overlay--purple {

        background: rgba(125, 102, 239, 0.9);
    }

    .petbotAvatar {
        margin-left: 0.5em;
    }

    .userAvatar {
        margin-right: 0.5em;
    }

    .chatTime {
        position: absolute;

        bottom: 0px;
        left: -6.5em;

    }

    .userChatTime {

        position: absolute;
        margin-right: 0.3em;
        bottom: 0px;
    }

    .avatar::after {
        background-color: #63C76A;
    }

    .inChatButton {
        margin-top: 0.5em;
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
                            <div class="send-mess__inner ">
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

    // AJAX
    function getPetImage() {
        return fetch("http://localhost:8080/petdiansAdmin/pet/read?pno=2", {

            method: "get",
            headers: {'X-CSRF-TOKEN': csrfTokenValue}

        }).then(res => {

            return res.json();

        });
    }

    function getDateFormat(date) {
        var year = date.getFullYear() + '';
        year = year.substring(2, 4);
        var month = date.getMonth() + 1;
        month = month >= 10 ? month : '0' + month
        var day = date.getDate();
        day = day >= 10 ? day : '0' + day
        var hour = date.getHours();
        var minutes = date.getMinutes();
        minutes = minutes >= 10 ? minutes : '0' + minutes

        var result = year + '/' + month + '/' + day + '   ' + hour + ':' + minutes;
        return result;
    }


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
        console.log("ADD CHAT");

        text = text.replaceAll("\n", "</br>")

        chatList.innerHTML +=
            '<div class="send-mess__inner "><div class="recei-mess-list leftMessage">' +
            '<div class="avatar--small userAvatar"><img src="../../resources/images/petbot.jpg" alt="John Smith"></div>' +
            '<div class="recei-mess">' + text +
            '</div>' + '<span class="mess-time userChatTime">' + getDateFormat(new Date()) + '</span>' + '</div>' +
            '</div>';


        var messes = document.querySelectorAll(".recei-mess");

        console.log(messes);
        var length = messes.length;
        var mess = messes[length - 1];
        var width = mess.offsetWidth;
        mess.nextSibling.style.left = width + 60 + 'px';
        console.log(mess.nextSibling.style.left)

        chatContent.scrollTop = chatContent.scrollHeight;
        // console.log("chatContent.scrollTop");
        // console.log(chatContent.scrollTop);
    }

    //https://resize.indiatvnews.com/en/resize/newbucket/1200_-/2020/05/pjimage-14-1589363766.jpg
    function addPhoto(text, src) {
        console.log("ADD PHOTO");

        text = text.replaceAll("\n", "</br>")

        //var temp = encodeURIComponent(src.substring(10));
        var temp = src.substring(10).replaceAll("\\", "/")
        chatList.innerHTML +=
            '<div class="send-mess__inner "><div class="recei-mess-list leftMessage">' +
            '<div class="avatar--small userAvatar"><img src="../../resources/images/petbot.jpg" alt="John Smith"></div>' +
            '<div class="recei-mess">' + '<img src="/petdiansAdmin/image/get?file=' + temp + '">' +
            text +
            '</div>' + '<span class="mess-time userChatTime">' + getDateFormat(new Date()) + '</span></div></div>';
        //
        // chatList.innerHTML +=
        //     '<div class="send-mess__inner "><div class="recei-mess-list leftMessage">' +
        //     '<div class="avatar--small userAvatar"><img src="../../resources/images/petbot.jpg" alt="John Smith"></div>' +
        //     '<div class="recei-mess">' + '<img src="http://image.dongascience.com/Photo/2020/03/5bddba7b6574b95d37b6079c199d7101.jpg">' +
        //     text +
        //     '</div>' + '<span class="mess-time userChatTime">' + getDateFormat(new Date()) + '</span></div></div>';


        var messes = document.querySelectorAll(".recei-mess");

        console.log(messes);
        var length = messes.length;
        var mess = messes[length - 1];
        var width = mess.offsetWidth;
        mess.nextSibling.style.left = 450 + 'px';
        console.log(mess.nextSibling.style.left)
        //
        chatContent.scrollTop = chatContent.scrollHeight;
        console.log("chatContent.scrollTop");
        console.log(chatContent.scrollTop);
        console.log(chatContent.scrollHeight);
    }


    addChat("안녕하세요? 펫봇입니다. 무엇을 도와드릴까요? <button class='au-btn inChatButton' style='background-color: #7D66EF'>1. 내 반려동물 정보</button>" +
        "<button class='au-btn inChatButton' style='background-color: #7D66EF'>2. 일반 반려동물 정보</button>" +
        "<button class='au-btn inChatButton' style='background-color: #7D66EF'>3. 주변 동물병원 검색</button>");

    // addChat("안녕하세요? 펫봇입니다. 무엇을 도와드릴까요?");

    // addPhoto("내 반려동물 정보");

    function addPetbotChat(text) {
        chatList.innerHTML += '  <div class="send-mess__inner "><div class="send-mess-list rightMessage">' +
            '<span class="mess-time chatTime">' + getDateFormat(new Date()) + '</span>' +
            '<div class="send-mess">' +
            text +
            '</div><div class="avatar avatar--small petbotAvatar"><img src="../../resources/images/profile.png" alt="John Smith">' +
            '</div></div></div>';

        chatContent.scrollTop = chatContent.scrollHeight;
        // console.log("chatContent.scrollTop");
        // console.log(chatContent.scrollTop);
    }


    // 1. 내 반려동물 조회
    document.querySelectorAll(".inChatButton")[0].addEventListener("click", function (e) {
        e.preventDefault();
        console.log("===== IN CHAT BUTTON ON =====")
        getPetImage().then(res => {

                console.log("===== GET IMAGE =====");

                var temp = "이름 : " + res['petname'] + "(나이 : " + res['age'] + ")</br>종류 : " + res['type'] + "(성별 : " + res['sex'] + "</br>종 : " + res['species']
                var fullPath = res['fullPath'];
                console.log(fullPath);

               addPhoto(temp, fullPath);
            }
        )
    }, false)


    document.querySelector(".chatButton").addEventListener("click", function (e) {
        e.preventDefault();
        console.log("CHAT ENTER");

        var userText = chatInput.value;
        addPetbotChat(userText, 'left');
        console.log(userText);
        var result = getPetbotMessage(userText);

        result.then(r => {
            var petbotTest = r['response'];
            console.log(petbotTest);
            addChat(petbotTest);
        })

        chatInput.value = '';

    }, false);
    // 채팅 ㄱㄱ


</script>

<%@ include file="../../includes/footer.jsp" %>