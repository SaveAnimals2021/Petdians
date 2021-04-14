package org.petdians.petbot.controller;


import com.google.gson.Gson;
import com.google.gson.JsonArray;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;import org.petdians.common.dto.PageDTO;
import org.petdians.petbot.dto.PetbotDTO;
import org.petdians.petbot.service.PetbotService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/petdiansAdmin/petbot")
@Log4j
@RequiredArgsConstructor
public class PetbotController {

    private final PetbotService service;

    @GetMapping("/list")
    public void getPetbotList(PageDTO dto, Model model) {

        dto.setPerSheet(5);
        log.info("crawling List...............");


        JsonArray jsonlist = new JsonArray();

        try {
            List<PetbotDTO> list = service.getPetbotDTOList();


            list.forEach(intent -> {
                Gson gson = new Gson();
                String json = gson.toJson(intent);
                jsonlist.add(json);
            });

            model.addAttribute("list", list);
            model.addAttribute("jsonlist", jsonlist);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @PostMapping("/register")
    public ResponseEntity<String> registerIntent(@RequestBody String intentName){

        log.info("=================== REGISTER INTENT =================");
        log.info(intentName);
        try {

            intentName = intentName.replaceAll("\"","");

            service.createIntentByName(intentName);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("success", HttpStatus.INTERNAL_SERVER_ERROR);

        }

        return new ResponseEntity<String>("success", HttpStatus.OK);

    }

}
