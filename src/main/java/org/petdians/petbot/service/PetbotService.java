package org.petdians.petbot.service;

import com.google.api.gax.rpc.ApiException;
import com.google.cloud.dialogflow.v2beta1.Intent;
import com.google.cloud.dialogflow.v2beta1.QueryResult;
import org.petdians.petbot.dto.PetbotDTO;

import java.io.IOException;
import java.util.List;
import java.util.Map;


public interface PetbotService {

    Map<String, QueryResult> detectIntentTexts(String texts) throws IOException, ApiException;

    List<Intent> listIntents() throws ApiException, IOException ;

    Intent createIntent( String displayName,
                         String projectId,
                         List<String> trainingPhrasesParts,
                         List<String> messageTexts)   throws ApiException, IOException ;

    List<PetbotDTO> getPetbotDTOList() throws Exception;

    Intent createIntentByName(String displayName) throws ApiException, IOException;

    void deleteIntent(String intentId) throws ApiException, IOException;

    Intent addPhrase(String phrase, String id) throws Exception;

    Intent addResponse(String response, String id) throws Exception;

    String queryPetbot(String text)  throws Exception;
}
