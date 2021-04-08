package org.petdians.animal.controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
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
        if(null == day){
            day = 7;
        }

        try {
            list = crawlService.getListByDay(day);
        }catch(Exception e){
            e.printStackTrace();
        }

        // JSON으로...
        JsonArray jsonArray = new JsonArray();

        if(null != list){
            list.forEach(c->{
                Gson gson = new Gson();
                String json = gson.toJson(c);
                jsonArray.add(json);
            });
        }

        // JSON으로...
        model.addAttribute("list", list);
        model.addAttribute("jsonlist", jsonArray);

    }

    @GetMapping("/list")
    public void getList(PageDTO pageDTO, Model model) {

        log.info("crawling List...............");
        log.info(pageDTO);

        model.addAttribute("list", service.getPagedList(pageDTO));
        model.addAttribute("pageMaker", new PageMaker(pageDTO, service.getTotalCount(pageDTO)));

    }

}
