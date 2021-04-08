<%@ include file="../includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ include file="appKey.js" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
        src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous">
</script>

<style>

    .container {
        margin-top: 1em;
    }

    .firstBody {
        width: 100%;
        height: 60vh;

        display: flex;
        flex-direction: row;
    }

    .secondBody {
        width: 100%;
        height: 60vh;
        background-color: gray;
        margin-top: 1em;
        margin-bottom: 2em;
    }

    .mapDiv {
        width: 100%;
        height: 100%;
        background-color: gray;
        margin-right: 1em;
    }

    .viewDiv {
        width: 100%;
        height: 100%;
        background-color: gray;

    }

    .animalMap {
        width: 100%;
        height: 100%;
    }
</style>


<div class="container">
    <div class="firstBody">

        <div class="mapDiv">
            <div class="animalMap"></div>
        </div>

        <div class="viewDiv">


        </div>
    </div>

    <div class="table-responsive table-responsive-data2" style="margin-top: 1em">
        <div class="rs-select2--light rs-select2--sm">
            <select class="daySelection js-select2" name="day">
                <option value="">DAY</option>
                <option value="0" ${pageDTO.day == '0'?"selected":"" }>Today</option>
                <option value="3" ${pageDTO.day == '3'?"selected":"" }>3 Days</option>
                <option value="7" ${pageDTO.day == '7'?"selected":"" }>1 Week</option>
            </select>
            <div class="dropDownSelect2">    <button class="btn">Apply</button>
            </div>

        </div>
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
                <th style="text-align: center;">MISSINGDATE</th>
                <th style="text-align: center;">REGDATE</th>
                <th style="text-align: center;">UPDATEDATE</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list }" var="animal">
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
                    <!-- MISSINGDATE -->
                    <td class="desc" style="text-align: center;">${animal.missingDate}</td>
                    <!-- REGDATE -->
                    <td style="text-align: center;">${animal.regDate}</td>
                    <!-- UPDATEDATE -->
                    <td style="text-align: center;"><p class="status--process">${animal.updateDate}</p></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <!--                    actionForm                      -->
    <div class="activity">
        <form class="actionForm" action="/petdiansAdmin/petMap" method="get">
            <input type="hidden" name="day" value="${pageDTO.day}">
        </form>
    </div>

</div>


<script>
    $(document).ready(function () {
        //      kakao.maps.load(function () {
        // 지도 생성하기
        var mapContainer = document.querySelector('.animalMap'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 5 // 지도의 확대 레벨
            };

        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();
        var dtoList = [];
        var i = 0;

        <c:forEach items = '${list}' var="item">
        var obj = {
            animalNumber : '${item.animalNumber}',
            missingLocation : '${item.missingLocation}',
            type : '${item.type}'
        }
        dtoList.push(obj);
        </c:forEach>
        console.log(dtoList);


        // 주소로 좌표를 검색합니다
        function placeToMarker(location) {
            return new Promise(function () {

                return geocoder.addressSearch(location, function (result, status) {

                    // 정상적으로 검색이 완료됐으면
                    if (status === kakao.maps.services.Status.OK) {

                        // var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                        //
                        // // 결과값으로 받은 위치를 마커로 표시합니다
                        // var marker = new kakao.maps.Marker({
                        //     map: map,
                        //     position: coords
                        // });
                    }
                    return result;
                });

            });
        };

        const maxCount = 10;

        for (const dto of dtoList) {

            let count = 0;

            let missingLocation = dto.missingLocation;

            while (maxCount > count){

                console.log(missingLocation);

                let result = placeToMarker(missingLocation);

                result.then(res => console.log("프로미스............" + res));

                if(result.length == 0) {

                    let index = missingLocation.lastIndexOf(" ");
                    if(-1 == index) {

                        console.log("결과 없음...검색 완료");

                    }//end if

                    missingLocation = missingLocation.substring(0, index);
                    console.log("결과 없음...재검색 시작 =>" + missingLocation)

                    //end if
                } else{
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 결과값으로 받은 위치를 마커로 표시합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });
                    break;
                }

                ++count;

            }//end while

            if(count > maxCount) {

                console.log("결과 없음...검색 완료");

            }//end if

        }//end for

        // ============= End Map ==========

        //실행문
        // $(".btn").addEventListener("click", function (e){
        //
        //
        //
        // }, false)

        document.querySelector(".btn").addEventListener("click", function (e) {

            console.log("change...................");

            const actionForm = document.querySelector(".actionForm");

            //day
            const day = document.querySelector("select[name='day']");
            actionForm.querySelector("input[name='day']").value = day[day.selectedIndex].value;
            console.log(day);
            actionForm.submit();

        }, false)

        // }) // kakao.maps.load END
    }) // doc.ready END
</script>

<script>

</script>

<%@ include file="../includes/footer.jsp" %>