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


    .top-campaign {

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

    .petbotColumn {
        display: flex;
        flex-direction: column;
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

    .send-mess-wrap {
        width: 100%;
    }

    .leftMessage {
        display: flex;
        justify-content: left;
    }

    .rightMessage {
        display: flex;
        justify-content: right;
    }
</style>

<!-- MAIN CONTENT-->
<div class="petbotCenter">
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
            <div class="au-inbox-wrap js-inbox-wrap show-chat-box">
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
                        <div class="send-mess-wrap petbotColumn">
                            <span class="mess-time">30 Sec ago</span>

                            <div class="send-mess__inner ">
                                <div class="send-mess-list rightMessage">
                                    <div class="send-mess">Lorem ipsum dolor sit amet, consectetur
                                        adipiscing elit non
                                        iaculis
                                    </div>
                                </div>
                            </div>

                            <div class="send-mess__inner ">
                                <div class="recei-mess-list leftMessage">
                                    <div class="recei-mess">Lorem ipsum dolor sit amet, consectetur adipiscing elit non
                                        iaculis
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="au-chat-textfield">
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
            headers: {'Content-Type': 'text/plain', 'X-CSRF-TOKEN': csrfTokenValue},
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
            addPetbotChat(r['response']);
        })




        chatInput.value = '';



    }, false);
    // 채팅 ㄱㄱ


</script>

<%@ include file="../../includes/footer.jsp" %>