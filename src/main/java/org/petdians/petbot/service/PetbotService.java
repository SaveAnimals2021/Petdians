package org.petdians.petbot.service;

import com.google.api.gax.rpc.ApiException;
import com.google.cloud.dialogflow.v2beta1.Intent;
import com.google.cloud.dialogflow.v2beta1.QueryResult;

import java.io.IOException;
import java.util.List;
import java.util.Map;


public interface PetbotService {

    Map<String, QueryResult> detectIntentTexts(String texts) throws IOException, ApiException;
    List<Intent> listIntents() throws ApiException, IOException ;


}
