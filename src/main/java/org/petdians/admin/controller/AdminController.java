package org.petdians.admin.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.petdians.admin.service.AdminService;
import org.petdians.common.dto.PageDTO;
import org.petdians.common.dto.PageMaker;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/petdiansAdmin")
@Log4j
@RequiredArgsConstructor
public class AdminController {

    private final AdminService service;

    @GetMapping("/admin/list")
    public void getList(PageDTO pageDTO, Model model) {

        pageDTO.setPerSheet(6);
        log.info("petdiansAdmin List.......................");
        model.addAttribute("list", service.listAll(pageDTO));
        model.addAttribute("pageMaker", new PageMaker(pageDTO, service.getTotalCount()));

    }

    @GetMapping("/login")
    public void getTest() {

        log.info("login...........................");

    }

}
