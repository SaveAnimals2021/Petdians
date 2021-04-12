package org.petdians.user.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.petdians.common.dto.PageDTO;
import org.petdians.common.dto.PageMaker;
import org.petdians.user.dto.UserDTO;
import org.petdians.user.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/petdiansAdmin/user")
@Log4j
@RequiredArgsConstructor
public class UserController {

    private final UserService service;

    @GetMapping("/list")
    public void getPetMap(PageDTO dto, Model model) {

        log.info(dto);

        if(null != dto){
            dto.setPerSheet(6);
        }

        List<UserDTO> list = service.getPagedList(dto);

        log.info(list);

        PageMaker pageMaker = new PageMaker(dto, service.getTotalCount());

        model.addAttribute("list", list);
        model.addAttribute("pageMaker", pageMaker);


    }
}
