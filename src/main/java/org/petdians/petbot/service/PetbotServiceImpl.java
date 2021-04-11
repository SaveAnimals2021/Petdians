package org.petdians.petbot.service;

import com.google.api.client.util.Lists;
import com.google.api.client.util.Maps;
import com.google.api.gax.rpc.ApiException;
import com.google.cloud.dialogflow.v2beta1.*;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;
import java.util.Map;


@Log4j
@Service
public class PetbotServiceImpl implements PetbotService {

    private final String locationId = "asia-northeast1";
    private final String endPoint = locationId + "-dialogflow.googleapis.com:443";

    private final String projectID = "focused-elysium-308503";
    private final String sessionID = "12345678";
    private final String lanCode = "ko-KR";



    // DialogFlow API Detect Intent sample with text inputs.
    public Map<String, QueryResult> detectIntentTexts(String text)
            throws IOException, ApiException {

        SessionsSettings sessionsSettings = SessionsSettings.newBuilder()
                .setEndpoint(endPoint).build();

        Map<String, QueryResult> queryResults = Maps.newHashMap();
        // Instantiates a client
        try (SessionsClient sessionsClient = SessionsClient.create(sessionsSettings)) {
            // Set the session name using the sessionId (UUID) and projectID (my-project-id)
            SessionName session = SessionName
                    .ofProjectLocationSessionName(projectID, locationId, sessionID);


            System.out.println("Session Path: " + session.toString());

            // Detect intents for each text input

                // Set the text (hello) and language code (en-US) for the query
                TextInput.Builder textInput =
                        TextInput.newBuilder().setText(text).setLanguageCode(lanCode);

                // Build the query with the TextInput
                QueryInput queryInput = QueryInput.newBuilder().setText(textInput).build();

                // Performs the detect intent request
                DetectIntentResponse response = sessionsClient.detectIntent(session, queryInput);

                // Display the query result
                QueryResult queryResult = response.getQueryResult();

                System.out.println("====================");
                System.out.format("Query Text: '%s'\n", queryResult.getQueryText());
                System.out.format(
                        "Detected Intent: %s (confidence: %f)\n",
                        queryResult.getIntent().getDisplayName(), queryResult.getIntentDetectionConfidence());
                System.out.format("Fulfillment Text: '%s'\n", queryResult.getFulfillmentText());

                queryResults.put(text, queryResult);

        }
        return queryResults;
    }


    public List<Intent> listIntents() throws ApiException, IOException {


        List<Intent> intents = Lists.newArrayList();

        IntentsSettings intentsSettings = IntentsSettings.newBuilder().setEndpoint(endPoint).build();


        // Instantiates a client
        try (IntentsClient intentsClient = IntentsClient.create(intentsSettings)) {
            // Set the project agent name using the projectID (my-project-id)
            //  .ofProjectLocationSessionName(projectId, locationId, sessionId);
            AgentName parent = AgentName.ofProjectLocationAgentName(projectID, locationId);
            log.info("Agent Name : " + parent);
            // Performs the list intents request
            for (Intent intent : intentsClient.listIntents(parent).iterateAll()) {
                System.out.println("====================");
                System.out.format("Intent name: '%s'\n", intent.getName());
                System.out.format("Intent display name: '%s'\n", intent.getDisplayName());
                System.out.format("Action: '%s'\n", intent.getAction());
                System.out.format("Root followup intent: '%s'\n", intent.getRootFollowupIntentName());
                System.out.format("Parent followup intent: '%s'\n", intent.getParentFollowupIntentName());

                System.out.format("Input contexts:\n");
                for (String inputContextName : intent.getInputContextNamesList()) {
                    System.out.format("\tName: %s\n", inputContextName);
                }
                System.out.format("Output contexts:\n");
                for (Context outputContext : intent.getOutputContextsList()) {
                    System.out.format("\tName: %s\n", outputContext.getName());
                }

                intents.add(intent);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return intents;
    }

}
