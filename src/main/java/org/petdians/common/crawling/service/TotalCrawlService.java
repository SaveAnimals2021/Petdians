package org.petdians.common.crawling.service;


import lombok.extern.log4j.Log4j;
import org.petdians.animal.dto.AnimalInfoDTO;
import org.petdians.animal.dto.MissingAnimalDTO;
import org.petdians.animal.service.AnimalService;
import org.petdians.common.dao.AnimalInfoDAO;
import org.petdians.common.dto.CrawlResultDTO;
import org.petdians.common.util.DateFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Log4j
@Service
public class TotalCrawlService {

    @Autowired
    AnimalService service;

    List<CrawlService> sites;

    private Integer crawlNumber = 0; // 시도 회수
    private Integer newDataNumber; // 새로운 데이터 개수
    private Integer modDataNumber; // 수정된 개수
    private Integer totalDataNumber; // 전체 몇개가 있는지
    private Date crawlDate;

    private Integer period = 90; // 기본 30일

    public TotalCrawlService() {
        KaraCrawlService karaservice = new KaraCrawlService();
        SaacCrawlService saacCrawlService = new SaacCrawlService();
        KarmaCrawlService karmaCrawlService = new KarmaCrawlService();
        IJoaCrawlService iJoaCrawlService = new IJoaCrawlService();

        AngelCrawlService angelCrawlService = new AngelCrawlService();
        APMSCrawlService apmsCrawlService = new APMSCrawlService();

        sites = new ArrayList<>();
//        sites.add(karaservice);
//        sites.add(saacCrawlService);
//        sites.add(karmaCrawlService);
//        sites.add(iJoaCrawlService);
        sites.add(angelCrawlService);
        sites.add(apmsCrawlService);
    }

    public void setPeriod(Integer period) {
        this.period = period;
    }

    public CrawlResultDTO crawlAll() {
        // 2. DB를 모두 가져온다.
        // 3. 비교한다.
        // 4. 없으면 넣고 있으면 무시

        AnimalInfoDAO.clear();

        // 1. 모두 crawl한다.
        crawlDate = new Date();
        sites.forEach(site -> {
            try {
                site.doCrawl(period);
                crawlNumber += site.getCrawlNumber();
                log.info("CRAWL NUMBER : " + crawlNumber);
            } catch (Exception e) {
                e.printStackTrace();
            }
        });

        // 2. DB를 모두 가져온다.
        List<MissingAnimalDTO> crawlList = AnimalInfoDAO.getList();
        List<MissingAnimalDTO> dbList = service.getUncompletedList();


        int total = 0;
        // 3. 비교한다.
        for (int i = 0; i < crawlList.size(); ++i) {
            ++total;
            MissingAnimalDTO cdto = crawlList.get(i);
            AnimalInfoDTO temp = null;

            for (int j = 0; j < dbList.size(); ++j) {
                MissingAnimalDTO ddto = dbList.get(j);

                if (cdto.getAnimalCode().equals(ddto.getAnimalCode())) {
                    // 중복인 상황
                    crawlList.remove(i);
                    dbList.remove(j);
                    --j;
                    --i;
                    break;
                }
            }
            // 끝나서 왔는지... => 중복이 없는 상황
            // for i ends
        }

        int csize = crawlList.size();
        // 새로운 데이터 수!!!
        newDataNumber = csize;

        for (int i = 0; i < csize; ++i) {
            // 2번상황 = insert한다.
            service.register(crawlList.get(i));

        }

        int dsize = dbList.size();
        // 수정한 데이터 수!!!
        modDataNumber = dsize;

        for (int i = 0; i < dsize; ++i) {
            // 1번상황 = modify해서 상태를 isAdopted = true; 로 바꾼다.
            dbList.get(i).setRescueStatus(4);
            service.setIsAdopted(dbList.get(i));
        }

        log.info("crawledList : " + crawlList);
        log.info("dbList : " + dbList);

        Date finishedTime = new Date();

        String timeDif = DateFormatter.calcTimeDiff(crawlDate, finishedTime);

        CrawlResultDTO result = CrawlResultDTO.builder()
                .crawlDate(crawlDate).newDataNumber(newDataNumber).modDataNumber(modDataNumber).totalDataNumber(total)
                .takingTime(timeDif).crawlNumber(crawlNumber)
                .build();

        return result;
    }
}


