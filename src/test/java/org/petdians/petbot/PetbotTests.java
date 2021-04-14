package org.petdians.petbot;


import com.google.cloud.dialogflow.v2beta1.Intent;
import com.google.cloud.dialogflow.v2beta1.QueryResult;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.animal.config.AnimalConfig;
import org.petdians.common.config.CommonConfig;
import org.petdians.petbot.config.PetbotConfig;
import org.petdians.petbot.dto.PetbotDTO;
import org.petdians.petbot.service.PetbotService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class, AnimalConfig.class, PetbotConfig.class})
public class PetbotTests {

    @Autowired
    PetbotService service;


    @Test
    public void testIntentList() {
        try {
            List<Intent> list = service.listIntents();


            list.forEach(e->{
                log.info(e);

            });

            log.info(list.size());

        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testTrainingPhraseList() throws Exception{
        try {
            List<Intent> list = service.listIntents();
            List<PetbotDTO> dtoList = new ArrayList<>();

            int length = list.size();
            List<String> resultList = new ArrayList<>();

            for(int i =0; i<length; ++i){
                Intent intent = list.get(i);
                List<Intent.TrainingPhrase> tList = intent.getTrainingPhrasesList();

                for(int j = 0; j < tList.size(); ++j){
                    List<Intent.TrainingPhrase.Part> pList = tList.get(j).getPartsList();
                    String result ="";

                    for(int k = 0; k < pList.size(); ++k){
                        result += pList.get(k).getText();
                    }

                    resultList.add(result);

                }

                PetbotDTO dto = new PetbotDTO();

                dto.setPhrasesList(resultList);
                dto.setName(intent.getDisplayName());
                dto.setPhrasesCount(intent.getTrainingPhrasesCount());
                dtoList.add(dto);
            }

            log.info(dtoList);

        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testMessageList() throws Exception{
        try {
            List<Intent> list = service.listIntents();

            int length = list.size();

            for(int i =0; i<length; ++i){
                Intent intent = list.get(i);
                List<Intent.Message> messages = intent.getMessagesList();

                for(int j = 0; j < messages.size(); ++j){
                    Intent.Message.Text text = messages.get(j).getText();
                    String temp = text.getTextList().toString();
                    log.info(temp);
                }
            }


        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testDetect() {
        try {
            log.info("========= Fulfillment Text 1 ========= : " );

            List<String> texts = new ArrayList<String>();
            String question = "사냥터 추천";
            texts.add(question);

            Map<String, QueryResult> map = service.detectIntentTexts(question);
            texts.remove(0);

            QueryResult result1 = map.get(question);
            log.info(result1.getFulfillmentText());
//
//            log.info("========= Fulfillment Text 2 ========= : " );
//            question = "10";
//            texts.add(question);
//
////            map = service.detectIntentTexts(projectID, texts, sessionID, lanCode);
////            texts.remove(0);

//            QueryResult result2 = map.get(question);
//            log.info(result2.getFulfillmentText());
//
//            log.info("========= Fulfillment Text 3 ========= : " );
//            question = "정던";
//            texts.add(question);
//
//            map = DetectIntentTexts.detectIntentTexts(projectID, texts, sessionID, lanCode);
//            texts.remove(0);
//
//            QueryResult result3 = map.get(question);
//            log.info(result3.getFulfillmentText());
//            log.info("result3 : " + result3);
//
//            log.info("========= Fulfillment Text DONE ========= : ");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
