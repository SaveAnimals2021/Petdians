package org.petdians.animal.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.petdians.animal.dto.ImageDTO;
import org.petdians.animal.dto.MissingAnimalDTO;
import org.petdians.animal.service.AnimalService;
import org.petdians.animal.service.ImageService;
import org.petdians.common.dto.PageDTO;
import org.petdians.common.dto.PageMaker;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/petdiansAdmin")
@Log4j
@RequiredArgsConstructor
public class AnimalController {

    private final AnimalService service;
    private final ImageService imageService;

    @GetMapping("/petMap")
    public void getPetMap(PageDTO dto, Model model) {

        log.info("petdians petMap...............");

//        PageDTO dto = new PageDTO();
//        dto.setDay("7");
        dto.setPerSheet(1000);

        // animalDTO에 파일 이름들을 list로 담는다.
        // ${list.getFileList.
        List<MissingAnimalDTO> list =  service.getMissingList(dto);


        list.forEach(d->{
            int ano = d.getAnimalNumber();
            try {
                List<ImageDTO> imageList = imageService.getImageByAno(ano);

                List<String> urlList = new ArrayList<>();

                imageList.forEach(i->{
                    urlList.add(i.getFullURL());
                });

                log.info(urlList);

                d.setImageUrlList(urlList);

            } catch(Exception e){
                e.printStackTrace();
            }
        });


        model.addAttribute("list", list);
        model.addAttribute("pageMaker", new PageMaker(dto, service.getTotalCount(dto)));

        log.info(" PAGE : " + dto);
        log.info(" SIZE : " + list.size());
    }

    @GetMapping("/home")
    public void getHome() {

        log.info("petdians home...............");

    }

    @GetMapping("/crawling")
    public void getStatic(PageDTO pageDTO, Model model) {

        log.info("crawling...............");
        log.info(pageDTO);

        model.addAttribute("list", service.getPagedList(pageDTO));
        model.addAttribute("pageMaker", new PageMaker(pageDTO, service.getTotalCount(pageDTO)));

    }

}
