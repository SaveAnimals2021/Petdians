package org.petdians.member.controller;

import com.google.gson.JsonArray;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.petdians.common.dto.PageDTO;
import org.petdians.common.dto.PageMaker;
import org.petdians.common.util.JsonManager;
import org.petdians.member.dto.MemberDTO;
import org.petdians.member.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/petdiansAdmin/member")
@Log4j
@RequiredArgsConstructor
public class MemberController {

    private final MemberService service;

    @GetMapping("/list")
    public void getList(PageDTO pageDTO, Model model) {

        pageDTO.setPerSheet(6);
        log.info("petdiansAdmin Member List.......................");

        List<MemberDTO> list = service.readAll(pageDTO);
        JsonArray jsonList = JsonManager.makeJsonArray(list);

        model.addAttribute("list", service.readAll(pageDTO));
        model.addAttribute("jsonList", jsonList);
        model.addAttribute("pageMaker", new PageMaker(pageDTO, service.getTotalCount()));

    }


}
