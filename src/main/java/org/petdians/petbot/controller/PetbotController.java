package org.petdians.petbot.controller;


import com.google.cloud.dialogflow.v2beta1.Intent;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.petdians.common.dto.PageDTO;
import org.petdians.petbot.dto.PetbotDTO;
import org.petdians.petbot.dto.PhraseDTO;
import org.petdians.petbot.service.PetbotService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/petdiansAdmin/petbot")
@Log4j
@RequiredArgsConstructor
public class PetbotController {

    private final PetbotService service;

    @GetMapping("/test")
    public void getPetbotTest(){

    }

    @PostMapping(value = "/test", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<Map<String, Object>> postPetbotTest(@RequestBody String text){
        Map<String, Object> messageMap = new HashMap();

        log.info("REQUEST : "+ text);

        try{
            String result = service.queryPetbot(text);

            messageMap.put("message", "success");
            log.info("RESULT : "+ result);
            messageMap.put("response", result);
            return new ResponseEntity(messageMap, HttpStatus.OK);
        } catch(Exception e){
            e.printStackTrace();
            messageMap.put("message", "fail");
            return new ResponseEntity(messageMap, HttpStatus.INTERNAL_SERVER_ERROR);
        }


    }

    @GetMapping("/list")
    public void getPetbotList(PageDTO dto, Model model) {

        dto.setPerSheet(5);
        log.info("crawling List...............");

        JsonArray jsonlist = new JsonArray();

        try {
            List<PetbotDTO> list = service.getPetbotDTOList();
            JsonArray tempJsonlist = new JsonArray();

            list.forEach(intent -> {
                Gson gson = new Gson();
                String json = gson.toJson(intent);
                tempJsonlist.add(json);
            });
            jsonlist.add(tempJsonlist);

            model.addAttribute("list", list);
            model.addAttribute("jsonlist", jsonlist);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @PostMapping("/register")
    @ResponseBody
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

    @PostMapping("/delete")
    @ResponseBody
    public ResponseEntity<String> deleteIntent(@RequestBody String intentName){

        log.info("=================== DELETE INTENT =================");
        log.info(intentName);
        try {

            intentName = intentName.replaceAll("\"","");

            service.deleteIntent(intentName);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("success", HttpStatus.INTERNAL_SERVER_ERROR);

        }

        return new ResponseEntity<String>("success", HttpStatus.OK);

    }

    @PostMapping(value = "/addPhrase",  produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<Map<String, Object>> addPhrase(@RequestBody PhraseDTO dto) {

        Map<String, Object> messageMap = new HashMap();

        log.info(dto.getId());
        log.info(dto.getPhrase());

        try {
            Intent temp = service.addPhrase(dto.getPhrase(), dto.getId());
            messageMap.put("message", "success");
            messageMap.put("intent", temp.getTrainingPhrasesList());
            return new ResponseEntity(messageMap, HttpStatus.OK);

        } catch(Exception e){
            e.printStackTrace();
            messageMap.put("message", "fail");
            return new ResponseEntity(messageMap, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping(value = "/removePhrase",  produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<Map<String, Object>> removePhrase(@RequestBody PhraseDTO dto) {

        Map<String, Object> messageMap = new HashMap();

        log.info(dto.getId());
        log.info(dto.getIndex());

        try {
            Intent temp = service.removePhrase(dto.getIndex(), dto.getId());
            messageMap.put("message", "success");
            messageMap.put("intent", temp.getTrainingPhrasesList());
            return new ResponseEntity(messageMap, HttpStatus.OK);

        } catch(Exception e){
            e.printStackTrace();
            messageMap.put("message", "fail");
            return new ResponseEntity(messageMap, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(value = "/addResponse",  produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<Map<String, Object>> addResponse(@RequestBody PhraseDTO dto) {

        Map<String, Object> messageMap = new HashMap();
        log.info("=========== ADD RESPONSE ===============");
        log.info(dto);

        try {
            Intent temp = service.addResponse(dto.getResponse(), dto.getId());
            List<String> testList = new ArrayList<>();
            messageMap.put("message", "success");
            messageMap.put("intent", testList);
            log.info( "success" );
            return new ResponseEntity(messageMap, HttpStatus.OK);

        } catch(Exception e){
            e.printStackTrace();
            messageMap.put("message", "fail");
            log.info("============ CATCH ERROR ============");
            return new ResponseEntity(messageMap, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
