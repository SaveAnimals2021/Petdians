<%@ include file="../includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ include file="appKey.js" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>

    .container {
        margin-top: 1em;
        display: flex;
        flex-direction: row;
    }

    .firstBody {
        width: 100%;
        height: 85vh;

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
        display: flex;
        flex-direction: row;

        margin-top: 1em;
    }

    .animalMap {
        width: 100%;
        height: 100%;
    }

    .imageDiv {
        padding: 20px;
        width: 50%;
        background-color: #00a2e3;

    }

</style>


<div class="container" style="max-width: 90%;">
    <div class="firstBody">

        <div class="mapDiv">
            <div class="animalMap"></div>
        </div>

        <%-- ======================= View Div ============================ --%>
        <%--

    --%>
        <%--        </div>--%>
        <%-- ======================= End View Div ============================ --%>

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
            <input name="skeyword"
            <c:out value=""/> placeholder="Enter Keyword">
            <button class="au-btn-filter">
                <i class="zmdi zmdi-filter-list"></i>filters
            </button>
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
            <tbody class="animalTable">
            <c:forEach items="${list }" var="animal" varStatus="i">
                <tr class="tr-shadow" data-number="${animal.animalNumber}" data-idx="${i.index}">
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

    <!-- LARGE MODAL -->
    <div class="modal fade" id="largeModal" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel"
         style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="largeModalLabel">Large Modal</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="viewDiv">
                        <div class="imageDiv" style="max-width:45%;">
                            <div class="image1">

                            </div>
                        </div>
                        <%--            <div class="col-lg-6">--%>
                        <div class="card" style="width: 55%; margin-bottom: 0px">
                            <div class="cardName card-header">
                                <strong>Name</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class=" form-control-label">Type</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="text-type" name="text-input" disabled="Disabled"
                                               class="form-control">
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="text-species" class=" form-control-label">Species</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="text-species" name="text-input" disabled="Disabled"
                                               class="form-control">
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="text-sex" class=" form-control-label">Sex</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="text-sex" name="email-input"  disabled="Disabled"
                                               class="form-control">
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="text-guardian" class=" form-control-label">Guardian</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="text-guardian" name="password-input"
                                               disabled="Disabled" class="form-control">
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="text-date" class=" form-control-label">Date</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="text-date" name="disabled-input" placeholder="Disabled"
                                               disabled="Disabled" class="form-control">
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="text-location" class=" form-control-label">Location</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <textarea type="text" id="text-location" name="disabled-input" rows="2"
                                               placeholder="Disabled" disabled="" class="form-control"></textarea>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="text-situation" class=" form-control-label">Situation</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <textarea name="textarea-input" id="text-situation" rows="5"
                                                  placeholder="Disabled" class="form-control"
                                                  style="height: 90%;"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- MODAL BODY END -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary">Confirm</button>
                </div>
            </div>
        </div>
    </div>

</div>


<script>

    function change() {

        console.log("change...................");

        const actionForm = document.querySelector(".actionForm");

        //day
        const day = document.querySelector("select[name='day']");
        actionForm.querySelector("input[name='day']").value = day[day.selectedIndex].value;
        console.log(day);
        actionForm.submit();

    }

    $(document).ready(function () {
        var urlMap = new Map();




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
        var animalMap = new Map();

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
        function makeResult(missingLocation, count, animalNumber) {
            var maxCount = 10;
            var result = getMapByUrl(missingLocation);
            var arr = [];

            return result.then(res => {
                var val = res.documents;

                //Marker 생성성
                if (typeof (val[0]) != "undefined") {
                    // console.log("coords............................................................................")
                    // console.log(val[0])

                    var coords = new kakao.maps.LatLng(val[0].y, val[0].x);

                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords,
                        // animal number
                        title: animalNumber

                    });

                    resultList.push(val[0])
                    markerList.push(marker);

                    // 1. animal number가 키를 가지는 map에 넣는다. value는 marker
                    animalMap.set(animalNumber, marker);

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
                    makeResult(missingLocation, count, animalNumber)
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
            var result = makeResult(dto.missingLocation, 0, dto.animalNumber);

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

        // ============= INFO WINDOW END ============ //

        document.querySelector(".au-btn-filter").addEventListener("click", function (e) {

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

        var largeModal = $("#largeModal");
        var myList = ${jsonList};

        // LIST 누르기 => 지도에서 해당 위치로 이동 + View 창에 띄우기
        document.querySelector(".animalTable").addEventListener("click", function (e) {
            e.preventDefault();
            e.stopPropagation();
            var tr = e.target.closest("tr");
            var index = tr.getAttribute("data-idx");

            var animalInfo = JSON.parse(myList[index]);

            showModal(animalInfo);
        }, false)

        // 모달창...
        function showModal(animalInfo) {

            largeModal.modal('show');

            document.querySelector("#text-type").value = animalInfo.type;
            document.querySelector("#text-species").value = animalInfo.species;
            document.querySelector("#text-sex").value = animalInfo.sex;
            document.querySelector("#text-guardian").value = animalInfo.guardianName;
            document.querySelector("#text-date").value = animalInfo.missingDate;
            document.querySelector("#text-location").value = animalInfo.missingLocation;
            document.querySelector("#text-situation").value = animalInfo.situation;
            document.querySelector(".cardName strong").innerHTML = animalInfo.name;
        }

        // DOC.ready END
    })

    // }) // kakao.maps.load END
</script>


<%@ include file="../includes/footer.jsp" %>