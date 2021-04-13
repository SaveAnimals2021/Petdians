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
public class KaraCrawlManager extends CrawlManager {

    private static String baseUrl = "https://www.ekara.org";
    private static String url = "https://www.ekara.org/kams/adopt?species=&sex=&weight=&birth=&activity=&page=";
    private static String serviceName = "동물권행동 카라";

    @Override
    public void doCrawl(Integer period) throws Exception {
        this.period = period;

        log.info(serviceName + "가 시작됩니다...");

        for(int i = 1; ; i++) {
            String pageurl = url + i;

            // DOM
            Document doc = Jsoup.connect(pageurl)
                    .userAgent(agent)
                    .get();

            // 마지막 페이지 체크
            if(i > getLastPage(".pagination li:nth-last-child(2) a", doc)){
                log.info(serviceName+" 마지막 페이지입니다.");
                return;
            }

            List<String> hrefList = getATagList(".font-weight-bold a", doc);

            crawlView(hrefList, baseUrl);
        }
    }

    public void crawlView(List<String> aURL, String baseUrl) throws Exception {
        // css selector로 얻어올 수 있다.
        // class="wt_viewer" 아래에 있는 img 태그들을 긁어오자
        //Elements imageEles = doc.select(".card-img-top");
        //Elements textEles = doc.select(".card-body");

        // loop를 돌아서 img들의 src를 가져오자.
        // 내부적으로 arrayList이다.
        int size = aURL.size();

        for (int i = 0; i < size; ++i) {
            ++crawlNumber;
            Document doc = getDocument(baseUrl + aURL.get(i));

            // ========== 날짜
            Elements temp = doc.select(".media-body");

            // 날짜가 없으면 추가 X
            if(5 >= temp.size()){
                log.info("날짜가 존재하지 않습니다.");
                continue;
            }

            String date = doc.select(".media-body").get(5).select(" .pull-right").html();
            date = date.replace(".", "/");
            date = date.substring(0, date.lastIndexOf("/"));

            if (false == checkPeriod(date)) {
                --crawlNumber;
                continue;
            }

            // ========== 이름
            String name = doc.select(".h3.g-color-primary.font-weight-bold.mt-4").html();
            name = name.substring(0, name.indexOf(" "));

            // ========== 이미지
            Elements images = doc.select("#carouselCus2 img");

            List<String> imageList = new ArrayList<>();
            int imageSize = images.size();
            for(int j = 0; j < imageSize; ++j){
                String imageString  = images.get(j).attr("src");

                if(true == imageString.contains("youtube")){
                    continue;
                }

                imageList.add(imageString);
            }

            // ========== 기타 정보
            Elements eles = doc.select(".list-unstyled.mb-0 h3");

            String[] types = eles.get(0).html().split(" / ");
            String type = types[0];
            String species = types[1];

            String[] neus = eles.get(1).html().split(" / ");
            String sex = neus[0];
            String isNeu = neus[1];

            String age = eles.get(2).html();
            String weight =  eles.get(3).html();
            String color = eles.get(4).html();

            MissingAnimalDTO info = MissingAnimalDTO.builder().age(age).type(type).species(species)
                    .sex(sex).color(color).regDate(date).rescueStatus(3).originURL(baseUrl)
                    .name(name).imageUrlList(imageList).imageType("jpg").serviceName(serviceName)
                    .build();

            setAnimalCode(info);

            animalList.add(info);
            AnimalInfoDAO.add(info);
        }
    }

}
