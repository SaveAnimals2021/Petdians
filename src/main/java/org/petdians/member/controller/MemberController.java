package org.petdians.member.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.petdians.common.dto.PageDTO;
import org.petdians.common.dto.PageMaker;
import org.petdians.member.service.MemberService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/petdiansAdmin")
@Log4j
@RequiredArgsConstructor
public class MemberController {

    private final MemberService service;

    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping("/member/list")
    public void getList(PageDTO pageDTO, Model model) {

        pageDTO.setPerSheet(6);
        log.info("petdiansAdmin List.......................");
        model.addAttribute("list", service.listAll(pageDTO));
        model.addAttribute("pageMaker", new PageMaker(pageDTO, service.getTotalCount()));

    }


}
