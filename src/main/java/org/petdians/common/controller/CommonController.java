package org.petdians.common.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
@Log4j
public class CommonController {

    @GetMapping("/home")
    public void getHome() {

        log.info("home...............");

    }

}
