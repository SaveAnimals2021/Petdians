package org.petdians.security.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j
@Controller
@RequestMapping("/petdiansAdmin")
public class SecurityController {

    @GetMapping("/adminLogin")
    public void loginInput(String error, String logout, Model model){

        log.info("Login Page");
        log.info("Error : " + error);
        log.info("Logout : " + logout);

//        if(null != error){
//            model.addAttribute("error", "Login Error... Please check your ID");
//        }
//
//        if(null != logout){
//            model.addAttribute("logout", "Logout...");
//        }
    }

    @GetMapping("/accessError")
    public void accessDenied(Authentication auth, Model model){
        log.info("access Denied : " + auth);
        model.addAttribute("message", "Access Denied");
    }

}
