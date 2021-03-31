package org.petdians.animal.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/petdiansAdmin")
@Log4j
public class AnimalController {

    @GetMapping("/home")
    public void getHome() {

        log.info("petdians home...............");

    }

    @GetMapping("/crawling")
    public void getStatic() {

        log.info("crawling...............");

    }

}
