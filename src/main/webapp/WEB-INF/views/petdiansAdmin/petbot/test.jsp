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
<%@ include file="../appKey.js" %>
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
        background-color: #e8e8e8;
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

    .map{
        width:350px;
        height:350px;
    }

</style>

<!-- MAIN CONTENT-->
<div class="petbotCenter">
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

<button class="testBtn">Test</button>

<script>

    var csrfTokenValue = "${_csrf.token}";
    var chatForm = document.querySelector(".chatForm");
    var chatInput = document.querySelector(".chatInput");
    var chatList = document.querySelector(".send-mess-wrap");
    var chatContent = document.querySelector(".au-chat__content");
    var petbotColumn = document.querySelector(".send-mess-wrap.petbotColumn");

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

    function moveScroll() {

        chatContent.scrollTop = chatContent.scrollHeight;
        console.log("1: " + chatContent.scrollTop);
        console.log("1: " + chatContent.scrollHeight);

    }

    function addChat(text) {
        console.log("ADD CHAT");

        text = text.replaceAll("\n", "</br>")

        var textTag = '<div class="send-mess__inner "><div class="recei-mess-list leftMessage">' +
            '<div class="avatar--small userAvatar"><img src="../../resources/images/petbot.jpg" alt="John Smith"></div>' +
            '<div class="recei-mess">' + text +
            '</div>' + '<span class="mess-time userChatTime">' + getDateFormat(new Date()) + '</span>' + '</div>' +
            '</div>';

        petbotColumn.insertAdjacentHTML("beforeend", textTag);


        var messes = document.querySelectorAll(".recei-mess");

        console.log(messes);
        var length = messes.length;
        var mess = messes[length - 1];
        var width = mess.offsetWidth;

        if (null != mess.nextSibling) {
            mess.nextSibling.style.left = width + 60 + 'px';
            console.log(mess.nextSibling.style.left)
        }

        console.log("Add Chat Scroll");
        chatContent.scrollTop = chatContent.scrollHeight;
        console.log(chatContent.scrollTop);
        console.log(chatContent.scrollHeight);

    }

    //https://resize.indiatvnews.com/en/resize/newbucket/1200_-/2020/05/pjimage-14-1589363766.jpg
    function addPhoto(text, src) {
        console.log("ADD PHOTO");

        text = text.replaceAll("\n", "</br>")

        //var temp = encodeURIComponent(src.substring(10));
        var temp = src.substring(10).replaceAll("\\", "/")
        var imgTag = '<div class="send-mess__inner "><div class="recei-mess-list leftMessage">' +
            '<div class="avatar--small userAvatar"><img src="../../resources/images/petbot.jpg" alt="John Smith"></div>' +
            '<div class="recei-mess">' + '<div>mw님의 반려동물 : <img class="petImg" src="/petdiansAdmin/image/get?file=' + temp + '"></div>' +
            text +
            '<div><button class="au-btn inChatButton" style="background-color: #6FD92A">내 반려동물 정보 수정하기</button></div></div>'
        + '<span class="mess-time userChatTime">' + getDateFormat(new Date()) + '</span></div></div>'
        petbotColumn.insertAdjacentHTML("beforeend", imgTag);

        var messes = document.querySelectorAll(".recei-mess");

        console.log(messes);
        var length = messes.length;
        var mess = messes[length - 1];
        var width = mess.offsetWidth;
        mess.nextSibling.style.left = 450 + 'px';
        //console.log(mess.nextSibling.style.left)
        //console.log(chatContent.scrollHeight);

        console.log("Add Photo Scroll");

        controlScroll()
    }

    addChat("안녕하세요? 펫봇입니다. 무엇을 도와드릴까요? <button class='au-btn inChatButton' style='background-color: #7D66EF'>1. 내 반려동물 정보</button>" +
        "<button class='au-btn inChatButton' style='background-color: #7D66EF'>2. 일반 반려동물 정보</button>" +
        "<button class='au-btn inChatButton' style='background-color: #7D66EF'>3. 주변 동물병원 검색</button>");

    // addPetbotChat("내 반려동물 조회");
    // addChat("mw님의 반려동물이 없습니다. </br>지금 등록하시겠습니까?<div><button class='au-btn inChatButton' style='background-color: #F2BD80'>반려동물 등록하러 가기</button></div>")

    // addChat("안녕하세요? 펫봇입니다. 무엇을 도와드릴까요?");

    // addPhoto("내 반려동물 정보");

    function addPetbotChat(text) {

        var textTag = '  <div class="send-mess__inner "><div class="send-mess-list rightMessage">' +
            '<span class="mess-time chatTime">' + getDateFormat(new Date()) + '</span>' +
            '<div class="send-mess">' +
            text +
            '</div><div class="avatar avatar--small petbotAvatar"><img src="../../resources/images/profile.png" alt="John Smith">' +
            '</div></div></div>';
        // chatList.innerHTML += '  <div class="send-mess__inner "><div class="send-mess-list rightMessage">' +
        //     '<span class="mess-time chatTime">' + getDateFormat(new Date()) + '</span>' +
        //     '<div class="send-mess">' +
        //     text +
        //     '</div><div class="avatar avatar--small petbotAvatar"><img src="../../resources/images/profile.png" alt="John Smith">' +
        //     '</div></div></div>';

        petbotColumn.insertAdjacentHTML("beforeend", textTag);

        console.log("Add PetBotChat Scroll");
        chatContent.scrollTop = chatContent.scrollHeight;
        console.log(chatContent.scrollTop);
        console.log(chatContent.scrollHeight);

    }

    var inChatButtons = document.querySelectorAll(".inChatButton");

    // 1. 내 반려동물 조회
    inChatButtons[0].addEventListener("click", function (e) {
        e.preventDefault();
        console.log("===== IN CHAT BUTTON ON =====")
        getPetImage().then(res => {

                console.log("===== GET IMAGE =====");

                var sex = res['sex'] == 0 ? '암컷' : '수컷';

                var temp = "이름 : " + res['petname'] + "(나이 : " + res['age'] + "살)</br>종류 : " + res['type'] + "(성별 : " + sex+ ")</br>종 : " + res['species']
                var fullPath = res['fullPath'];
                console.log(fullPath);

                addPetbotChat("내 반려동물 정보 조회하기")
                addPhoto(temp, fullPath);

            }
        )
    }, false)




    document.querySelector(".chatButton").addEventListener("click", function (e) {
        e.preventDefault();
        e.stopPropagation()
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

    // document.querySelector(".testBtn").addEventListener("click", function (e) {
    //
    //     console.log(chatContent.scrollTop);
    //     console.log(chatContent.scrollHeight);
    //     chatContent.scrollTop = chatContent.scrollHeight
    //
    // })

    function controlScroll(){
        return new Promise(((resolve, reject) => {
            setTimeout(()=>{
                chatContent.scrollTop = chatContent.scrollHeight;
            }, 30)
        }))

    }


    // 주변 지도 검색 버튼
    inChatButtons[2].addEventListener("click", function(e){
        var currentLocation;
        var search = "동물병원"

        addChat("주변 동물병원 검색 결과 : <div id='map' class='map'></div><div id='menu_wrap'><ul id='placesList'></ul></div>")

        makeMap();

    }, false)


    //====================================================
    // 카카오 지도
    //====================================================
    var markers = [];
    var map;
    var ps;
    var infowindow;
    // 마커를 담을 배열입니다
    function makeMap() {

        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                level: 7 // 지도의 확대 레벨
            };

        // 지도를 생성합니다
        map = new kakao.maps.Map(mapContainer, mapOption);

        // 장소 검색 객체를 생성합니다
        ps = new kakao.maps.services.Places();

        // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
        infowindow = new kakao.maps.InfoWindow({zIndex: 1});

        // 키워드로 장소를 검색합니다
        searchPlaces(ps, "동물 병원");
    }

    // 키워드 검색을 요청하는 함수입니다
    function searchPlaces(ps, keyword) {

        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
        }

        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        ps.keywordSearch( keyword, placesSearchCB, {radius : 10000, useMapCenter : true , location : map.getCenter()});
    }

    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            // 정상적으로 검색이 완료됐으면
            // 검색 목록과 마커를 표출합니다
            displayPlaces(data);

            // 페이지 번호를 표출합니다
            // displayPagination(pagination);

        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

            alert('검색 결과가 존재하지 않습니다.');
            return;

        } else if (status === kakao.maps.services.Status.ERROR) {

            alert('검색 결과 중 오류가 발생했습니다.');
            return;

        }
    }

    // 검색 결과 목록과 마커를 표출하는 함수입니다
    function displayPlaces(places) {

        var listEl = document.getElementById('placesList'),
            menuEl = document.getElementById('menu_wrap'),
            fragment = document.createDocumentFragment(),
            bounds = new kakao.maps.LatLngBounds(),
            listStr = '';

        console.log("listEL : " +listEl);

        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);

        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();

        addMyMarker();

        for ( var i=0; i<6; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i),
                itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다



            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);

            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            (function(marker, title) {
                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    displayInfowindow(marker, title);
                });

                kakao.maps.event.addListener(marker, 'mouseout', function() {
                    infowindow.close();
                });

                itemEl.onmouseover =  function () {
                    displayInfowindow(marker, title);
                };

                itemEl.onmouseout =  function () {
                    infowindow.close();
                };
            })(marker, places[i].place_name);



            fragment.appendChild(itemEl);
        }

        // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    }

    // 검색결과 항목을 Element로 반환하는 함수입니다
    function getListItem(index, places) {

        var el = document.createElement('li'),
            itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

        if (places.road_address_name) {
            itemStr += '   <span class="jibun gray">주소 : ' + places.address_name  + '</span>';
        } else {
            itemStr += '    <span>' +  places.address_name  + '</span>';
        }

        itemStr += '  <span class="tel">' + '</br>전화번호 : ' + places.phone  + '</span>' +
            '</div>';

        el.innerHTML = itemStr;
        el.className = 'item';

        return el;
    }


    // // 현재 위치 마커
    function addMyMarker(){
        var markerImage = new kakao.maps.MarkerImage("../../resources/images/map-marker.png", new kakao.maps.Size(36, 37), imgOptions =  {
            spriteSize : new kakao.maps.Size(512*0.06, 512*0.06), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, 0), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(512*0.06*0.5, 512*0.06) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        })

        var tempmarker = new kakao.maps.Marker({
            position: map.getCenter(), // 마커의 위치
            image: markerImage
        });
        tempmarker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(tempmarker);  // 배열에 생성된 마커를 추가합니다
    }


    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    function addMarker(position, idx, title) {
        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
            imgOptions =  {
                spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage
            });


        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker);  // 배열에 생성된 마커를 추가합니다

        return marker;
    }

    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
    function removeMarker() {
        for ( var i = 0; i < markers.length; i++ ) {
            markers[i].setMap(null);
        }
        markers = [];
    }

    // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
    function displayPagination(pagination) {
        var paginationEl = document.getElementById('pagination'),
            fragment = document.createDocumentFragment(),
            i;

        // 기존에 추가된 페이지번호를 삭제합니다
        while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild (paginationEl.lastChild);
        }

        for (i=1; i<=pagination.last; i++) {
            var el = document.createElement('a');
            el.href = "#";
            el.innerHTML = i;

            if (i===pagination.current) {
                el.className = 'on';
            } else {
                el.onclick = (function(i) {
                    return function() {
                        pagination.gotoPage(i);
                    }
                })(i);
            }

            fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
    }

    // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
    // 인포윈도우에 장소명을 표시합니다
    function displayInfowindow(marker, title) {
        var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

        infowindow.setContent(content);
        infowindow.open(map, marker);
    }

    // 검색결과 목록의 자식 Element를 제거하는 함수입니다
    function removeAllChildNods(el) {
        while (el.hasChildNodes()) {
            el.removeChild (el.lastChild);
        }
    }



</script>

<%@ include file="../../includes/footer.jsp" %>