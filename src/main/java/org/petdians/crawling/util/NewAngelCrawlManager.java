package org.petdians.crawling.util;


import lombok.extern.log4j.Log4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.petdians.animal.dto.MissingAnimalDTO;
import org.petdians.common.dao.AnimalInfoDAO;

import java.util.ArrayList;
import java.util.List;


@Log4j
public class NewAngelCrawlManager extends CrawlManager {


    private static String baseUrl = "http://www.angel.or.kr/";
    private static String url = "http://www.angel.or.kr/index.php?";
    private static String serviceName = "동물보호센터";
    private static Integer extraCount = 0;
    @Override
    public void doCrawl(Integer period) throws Exception {
        this.period = period;

        log.info(serviceName + "가 시작됩니다...");

        String type = "개";
        String typeURL = "code=dog";
        extraCount = 0;
        crawlType(type, typeURL);
        type = "고양이";
        typeURL = "code=cat";
        crawlType(type, typeURL);
        extraCount = 0;
        type = "기타";
        typeURL = "code=other";
        crawlType(type, typeURL);
        extraCount = 0;

    }

    public void crawlType(String type, String typeURL) throws Exception {
        int count = 0;

        for (int i = 1; ; i++) {
            String pageurl = url + typeURL + "&page=" + i;

            // DOM
            Document doc = Jsoup.connect(pageurl)
                    .userAgent(agent)
                    .get();

            log.info("현재 페이지 : " + i);

            List<String> hrefList = getATagList(".gallery a", doc);
            log.info("현재 hrefList : " + hrefList);
            count = crawlView(hrefList, baseUrl, type, count);

            // 마지막 페이지 체크
            if(10 < count || 10 < extraCount){
                log.info(serviceName + "가 끝났습니다...");
                return;
            }
        }
    }

    public int crawlView(List<String> aURL, String baseUrl, String type, int count) throws Exception {

        int size = aURL.size();

        log.info("size : " + size);

        main : for (int i = 0; i < size; ++i) {
            ++crawlNumber;
            Document doc = getDocument(baseUrl + aURL.get(i));

            // ========== 실종 장소
            String missingLocation = doc.select(".about-header .style").get(0).html();
            missingLocation =  missingLocation.substring(missingLocation.lastIndexOf(")") + 1);


            Elements infoElements = doc.select(".about-info .para");
            String[] splitInfo = infoElements.html().split("<em>|</em>");
            // log.info("splitInfo : " + Arrays.toString(splitInfo));

            String guardianName = splitInfo[0].replace("님", ""); // .replace("님", "")
            String temp = splitInfo[4];
            // log.info("temp : " + temp);

            String regDate = "";
            String situation = "";
            // 상황 있음
            if(temp.contains("<br>")){
                String[] splitInfo2 = temp.split("<br>");
                regDate = splitInfo2[0].replace(" ", "");
                situation = splitInfo2[1];
            } else{
                // 상황 없음
                regDate = temp.replace(" ", "");
            }

            Elements tableElements = doc.select(".table-hover td");
            String tableString = tableElements.get(1).html();
            String[] splitTable = tableString.replace("<br>", "/").replace(" ", "").split("/");
            Integer length = splitTable.length;

            String missingDate = "";
            String witnessDate = "";
            String name = "";
            String age = "";
            String sex = "";
            String species = "";
            String rescueDate= "";
            String[] dates;
            String rescueLocation = "";
            int status = 0;

            if(tableString.contains("실종")) {
                try {
                    missingDate = splitTable[length - 1].replace("실종날짜(", "").replace(")", "");
                    name = splitTable[length - 2].replace("이름(", "").replace(")", "");
                    age = splitTable[length - 3];
                    sex = splitTable[length - 4];
                    species = splitTable[length - 5];
                } catch(Exception e){
                    e.printStackTrace();
                }

                dates = missingDate.split("-");
                // log.info(Arrays.toString(dates));
                missingDate = dates[0]  + "/";
                temp = dates[1];
                missingDate += temp.length() < 2 ? "0" + temp : temp;
                missingDate += "/";
                temp = dates[2];
                missingDate += temp.length() < 2 ? "0" + temp : temp;
                status = 0;
            }else if(tableString.contains("구조")){
                rescueDate = splitTable[length - 1].replace("구조날짜(", "").replace(")", "");
                age = splitTable[length - 2].replace("이름(", "").replace(")", "");
                sex = splitTable[length - 3];
                species = splitTable[length - 4];

                dates = rescueDate.split("-");
                // log.info(Arrays.toString(dates));
                rescueDate = dates[0]  + "/";
                temp = dates[1];
                rescueDate += temp.length() < 2 ? "0" + temp : temp;
                rescueDate += "/";
                temp = dates[2];
                rescueDate += temp.length() < 2 ? "0" + temp : temp;
                status = 2;
                rescueLocation = missingLocation;
                missingLocation = "";

            }else if(tableString.contains("목격")) {
                witnessDate = splitTable[length - 1].replace("목격날짜(", "").replace(")", "");
                age = splitTable[length - 2].replace("이름(", "").replace(")", "");
                sex = splitTable[length - 3];
                species = splitTable[length - 4];

                dates = witnessDate.split("-");
                // log.info(Arrays.toString(dates));
                witnessDate = dates[0]  + "/";
                temp = dates[1];
                witnessDate += temp.length() < 2 ? "0" + temp : temp;
                witnessDate += "/";
                temp = dates[2];
                witnessDate += temp.length() < 2 ? "0" + temp : temp;
                status = 1;
        }



            String date = regDate;
            date = date.replace("년", "/").replace("월", "/").replace("일", " ");


            if(false == checkPeriod(date)){
                --crawlNumber;
                log.info("날짜 초과.....................................");
                return ++count;
            }


            String special = tableElements.get(3).html();


            // 이미지
            Elements images = doc.select(".gallery");

            List<String> imageList = new ArrayList<>();
            for(int j = 0; j < images.size(); ++j){
                String image = images.get(j).select("img").attr("src");

                if(image.contains("http")){

                    imageList.add(image.substring(image.lastIndexOf(baseUrl) + baseUrl.length()));
                }
            }


//            log.info("name : " + name);
//            log.info("missingLocation : " + missingLocation);
//            log.info("missingDate : " + missingDate);
//            log.info("rescueDate : " + missingDate);
//            log.info("witnessDate : " + witnessDate);
//            log.info("regDate : " + date);
//            log.info("age : " + age);
//            log.info("sex : " + sex);
//            log.info("species : " + species);
//            log.info("status : " + status);
//            log.info("guardianName : " + guardianName);
//            log.info("regDate : " + regDate);
//            log.info("situation : " + situation);
//            log.info("special : " + special);
//            log.info("images : " + images);
//            log.info("========================================================");

            special = special.replaceAll("<br>", " ");

            MissingAnimalDTO info = MissingAnimalDTO.builder().age(age).type(type).species(species)
                    .sex(sex).missingDate(missingDate).missingLocation(missingLocation).guardianName(guardianName)
                    .name(name).serviceName(serviceName).originURL(baseUrl).special(special)
                    .imageUrlList(imageList).situation(situation).rescueStatus(status).regDate(date).rescueLocation(rescueLocation)
                    .rescueDate(rescueDate)
                    .build();

            setAnimalCode(info);
            String code = info.getAnimalCode();

            for(int j = 0; j < animalList.size(); ++j){
                // 중복이라면 continue
                String tempCode = animalList.get(j).getAnimalCode();
                if(tempCode.equals(code) || tempCode.contains(code)){
                    continue main;
                }
            }

            animalList.add(info);
            AnimalInfoDAO.add(info);
        }


        return 0;
    }
}

