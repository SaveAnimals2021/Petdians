package org.petdians.firebase.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/petdiansAdmin/firebase")
@Log4j
@RequiredArgsConstructor
public class FirebaseController {




    @GetMapping({"/test", "/"})
    public void getTest() {

        log.info("Firebase home...............");

    }

    @GetMapping({"/sendtest", "/"})
    public void getSendTest() {

        log.info("Firebase send test...............");

    }
}
