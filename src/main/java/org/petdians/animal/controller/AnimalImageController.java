package org.petdians.animal.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/images")
@Log4j
public class AnimalImageController {

    @GetMapping("/list")
    public void getList() {

        log.info("images list...............");

    }


}
