package org.petdians.animal.controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.petdians.animal.dto.AnimalInfoDTO;
import org.petdians.animal.dto.MissingAnimalDTO;
import org.petdians.animal.service.AnimalService;
import org.petdians.animal.service.ImageService;
import org.petdians.common.crawling.dto.CrawlResultDTO;
import org.petdians.common.crawling.service.CrawlService;
import org.petdians.common.dto.PageDTO;
import org.petdians.common.dto.PageMaker;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/petdiansAdmin/crawling")
@Log4j
@RequiredArgsConstructor
public class CrawlingController {

    private final AnimalService service;
    private final CrawlService crawlService;
    private final ImageService imageService;

    @GetMapping("/statistics")
    public void getStastics(Integer day, Model model) {

        log.info("crawling Stastics...............");

        List<CrawlResultDTO> list = null;

        // 기본 7일
        if (null == day) {
            day = 7;
        }

        try {
            list = crawlService.getListByDay(day);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // JSON으로...
        JsonArray jsonArray = new JsonArray();

        if (null != list) {
            list.forEach(c -> {
                Gson gson = new Gson();
                String json = gson.toJson(c);
                jsonArray.add(json);
            });
        }

        Integer catCount = service.getWeekCatCount();
        Integer dogCount = service.getWeekDogCount();
        Integer etcCount = service.getWeekEtcCount();
        Integer unCount = service.getWeekUnknownCount();

        Integer total = catCount + dogCount + etcCount + unCount;

        AnimalInfoDTO animalInfo = AnimalInfoDTO.builder()
                .catCount(catCount).dogCount(dogCount)
                .etcCount(etcCount).unknownCount(unCount)
                .totalCount(total)
                .build();

        Gson gson = new Gson();
        String json = gson.toJson(animalInfo);


        // JSON으로...
        model.addAttribute("list", list);
        model.addAttribute("jsonlist", jsonArray);
        model.addAttribute("animalInfo", json);

    }

    @GetMapping("/list")
    public void getList(PageDTO pageDTO, Model model) {

        pageDTO.setPerSheet(5);
        log.info("crawling List...............");

        String day = pageDTO.getDay();
        String type = pageDTO.getDay();
        String keyword = pageDTO.getDay();

        if (null != day && day.isEmpty()) {
            pageDTO.setDay(null);
        }
        if (null != type && type.isEmpty()) {
            pageDTO.setType(null);
        }
        if (null != keyword && keyword.isEmpty()) {
            pageDTO.setKeyword(null);
        }

        log.info(pageDTO);
        List<MissingAnimalDTO> list = service.getPagedList(pageDTO);
        log.info(list);

        // 간단 통계 정보
        AnimalInfoDTO animalInfo = AnimalInfoDTO.builder()
                .catCount(service.getAllCatCount()).dogCount(service.getAllDogCount())
                .etcCount(service.getAllEtcCount()).totalCount(service.getAllCount())
                .build();


        model.addAttribute("list", list);
        model.addAttribute("pageMaker", new PageMaker(pageDTO, service.getTotalCount(pageDTO)));
        model.addAttribute("animalInfo", animalInfo);

    }

}
