<%@ include file="../includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ include file="appKey.js" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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

    .daySelection {

        /*border: none;*/
        /*outline: none;*/
        /*padding-left: 18px;*/
        /*-webkit-border-radius: 3px; !**!*/
        /*-moz-border-radius: 3px;!**!*/
        /*border-radius: 3px;*/
        /*height: 40px;*/
        /*background: #fff;*/
        /*display: -webkit-box;!**!*/
        /*display: -webkit-flex;!**!*/
        /*display: -moz-box;!**!*/
        /*display: -ms-flexbox;!**!*/
        /*display: flex;*/
        /*-webkit-box-align: center;*/
        /*-webkit-align-items: center;!**!*/
        /*-moz-box-align: center;!**!*/
        /*-ms-flex-align: center;!**!*/
        /*align-items: center;*/
        /*-webkit-box-shadow: 0px 10px 20px 0px rgb(0 0 0 / 3%);!**!*/
        /*-moz-box-shadow: 0px 10px 20px 0px rgba(0, 0, 0, 0.03);!**!*/
        /*box-shadow: 0px 10px 20px 0px rgb(0 0 0 / 3%);*/
        /*background-color: #fff;!**!*/
        /*border: 1px solid #aaa;!**!*/
        /*border-radius: 4px;!**!*/
        /*box-sizing: border-box;*/
        /*cursor: pointer;*/
        /*display: block;!**!*/
        /*height: 28px;!**!*/
        /*user-select: none;!**!*/
        /*-webkit-user-select: none;*/

        color: #808080;
        font-size: 14px;
        line-height: 28px;
        display: block;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;

    }

</style>


<button class="testButton">LIST TEST</button>

<div class="container">
    <div class="firstBody">

        <div class="mapDiv">
            <div class="animalMap"></div>
        </div>

        <div class="viewDiv">


        </div>
    </div>

    <div class="table-responsive table-responsive-data2" style="margin-top: 1em">
        <div class="table-data__tool-left">
            <div class="rs-select2--light rs-select2--sm">
                <select class="js-select2" name="day" onchange="change()">
                    <option value="">DAY</option>
                    <option value="0" ${pageDTO.day == '0'?"selected":"" }>Today</option>
                    <option value="3" ${pageDTO.day == '3'?"selected":"" }>3 Days</option>
                    <option value="7" ${pageDTO.day == '7'?"selected":"" }>1 Week</option>
                </select>
                <div class="dropDownSelect2"></div>
            </div>
            <input name="skeyword" <c:out value="" /> placeholder="Enter Keyword">
            <button class="au-btn-filter">
                <i class="zmdi zmdi-filter-list"></i>filters</button>
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

    function change () {

        console.log("change...................");

        const actionForm = document.querySelector(".actionForm");

        //day
        const day = document.querySelector("select[name='day']");
        actionForm.querySelector("input[name='day']").value = day[day.selectedIndex].value;
        console.log(day);
        actionForm.submit();

    }

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
        var markerList = [];
        var i = 0;

        <c:forEach items = '${list}' var="item">
        var obj = {
            animalNumber: '${item.animalNumber}',
            missingLocation: '${item.missingLocation}',
            type: '${item.type}'
        }
        dtoList.push(obj);
        </c:forEach>
        console.log(dtoList);

        // 결과 생성...
        function makeResult(missingLocation, count) {
            var maxCount = 10;
            var result = getMapByUrl(missingLocation);
            var arr = [];

            return result.then(res => {
                console.log(2);
                var val = res.documents;

                //Marker 생성성
               if (typeof (val[0]) != "undefined") {
                    // console.log("coords............................................................................")
                    // console.log(val[0])

                    var coords = new kakao.maps.LatLng(val[0].y, val[0].x);
                    console.log("coords............................................................................")
                    console.log(coords);
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });
                    map.setCenter(coords);

                    resultList.push(val[0])
                    markerList.push(marker);
                    return val[0];

                }

                if (0 == val.length) {

                    var index = missingLocation.lastIndexOf(" ");
                    if (-1 == index) {
                        console.log("결과 없음... 검색 완료");
                    }

                    missingLocation = missingLocation.substring(0, index);

                    if (count >= maxCount) {
                        console.log("결과 없음... 검색 완료");
                        return;
                    }

                    ++count;
                    console.log("결과 없음... 재검색 시작 =>" + missingLocation);
                    makeResult(missingLocation, count)
                    return;
                }

                for (var i = 0; i < val.length; ++i) {
                    if (i > 2) {
                        break;
                    }
                    arr[i] = val[i];
                }

                console.log("arr=================================")
                console.log(arr[0])
                console.log("=================================")
                return arr[0];

            })
            // 결과 생성 END
        }

        // 키워드 검색 MapAPI
        function getMapByUrl(missingLocation) {
            return fetch("https://dapi.kakao.com/v2/local/search/keyword.json?query='" + missingLocation + "'",
                {
                    method: 'get',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                        Authorization: 'KakaoAK 5898bb0d55f55b7be28aa94cce26efb0'
                    },
                })
                .then(res => {

                    if (!res.ok) {
                        console.log("=========== throws ==========")
                        throw new Error(res);
                    }
                    console.log("=========== fetch ==========")

                    console.log("res====================================================================")
                    // var obj = res.json();
                    // console.log(obj);
                    console.log(1);
                    return res.json();

                }).catch(res => {
                    console.log("============ catch ===============");
                    return res;
                })
        }  // 키워드 검색 MapAPI END

        var resultList = [];


        // MAP MARKER 만들기 실행
        for (var dto of dtoList) {
            var result = makeResult(dto.missingLocation, 0);

            result.then(res => {
                console.log(3);
            })
            //     .then(
            //
            // );
        }


        // ============= End Map ==========

        // ============= INFO WINDOW START ============ //
        // 1. 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
        // var iwContent = '<div style="padding:5px;">Hello World!</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        // var iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
        //
        // // 1. 인포 윈도우를 생성합니다.
        // var infowindow = new kakao.maps.InfoWindow({
        //     content: iwContent,
        //     removable: iwRemoveable
        // });
        //
        // // 1. 마커에 클릭이벤트를 등록합니다
        // kakao.maps.event.addListener(marker, 'click', function () {
        //     // 마커 위에 인포윈도우를 표시합니다
        //     infowindow.open(map, marker);
        // });

        document.querySelector(".testButton").addEventListener("click", function(){
            console.log("================= resultList ===============");

            console.log(resultList);
            console.log(markerList);

            // testBUTTON end
        }, false)
        // ============= INFO WINDOW END ============ //

        document.querySelector(".au-btn-filter").addEventListener("click", function  (e) {

            e.preventDefault();
            e.stopPropagation();

            const actionForm = document.querySelector(".actionForm");
            //type
            const type = document.querySelector("select[name='property']");
            actionForm.querySelector("input[name='type']").value = type[type.selectedIndex].value;

            //keyword
            const keyword = document.querySelector(".table-data__tool-left input[name='skeyword']").value;
            actionForm.querySelector("input[name='keyword']").value = keyword;

            //init page
            actionForm.querySelector("input[name='page']").value = pageNum = 1;
            actionForm.submit();

        }, false)

        //실행문
        // $(".btn").addEventListener("click", function (e){
        //
        //
        //
        // }, false)

    })

        // }) // kakao.maps.load END
</script>


<%@ include file="../includes/footer.jsp" %>