package org.petdians.petbot.service;

import com.google.api.client.util.Lists;
import com.google.api.client.util.Maps;
import com.google.api.gax.rpc.ApiException;
import com.google.cloud.dialogflow.v2beta1.*;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.google.cloud.dialogflow.v2beta1.IntentView.INTENT_VIEW_FULL;


@Log4j
@Service
public class PetbotServiceImpl implements PetbotService {

    private final String locationId = "asia-northeast1";
    private final String endPoint = locationId + "-dialogflow.googleapis.com:443";

    private final String projectID = "focused-elysium-308503";
    private final String sessionID = "12345678";
    private final String lanCode = "ko-KR";


    // Text에 대한 Intent를 찾기
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

    // Intent를 모두 불러오기
    public List<Intent> listIntents() throws ApiException, IOException {


        List<Intent> intents = Lists.newArrayList();

        IntentsSettings intentsSettings = IntentsSettings.newBuilder()
                .setEndpoint(endPoint)
                .build();

        // Instantiates a client
        try (IntentsClient intentsClient = IntentsClient.create(intentsSettings)) {
            // Set the project agent name using the projectID (my-project-id)
            //  .ofProjectLocationSessionName(projectId, locationId, sessionId);
            
            // Project가 지역이 us가 아닐 때 추가적인 설정 필요
            AgentName parent = AgentName.ofProjectLocationAgentName(projectID, locationId);
            log.info("Agent Name : " + parent);

            // INTENT에서 TrainingPhrases도 나올 수 있게 하는 설정
            ListIntentsRequest request = ListIntentsRequest.newBuilder().setIntentView(INTENT_VIEW_FULL)
                    .setParent(parent.toString())
                    .build();

            // intentsClient.listIntents(parent).iterateAll();
            // Performs the list intents request
            for (Intent intent : intentsClient.listIntents(request).iterateAll()) {
                // 인텐트를 출력
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



    /**
     * Create an intent of the given intent type
     *
     * @param displayName The display name of the intent.
     * @param projectId Project/Agent Id.
     * @param trainingPhrasesParts Training phrases.
     * @param messageTexts Message texts for the agent's response when the intent is detected.
     * @return The created Intent.
     */
    public Intent createIntent(
            String displayName,
            String projectId,
            List<String> trainingPhrasesParts,
            List<String> messageTexts)
            throws ApiException, IOException {
        // Instantiates a client
        try (IntentsClient intentsClient = IntentsClient.create()) {
            // Set the project agent name using the projectID (my-project-id)
            AgentName parent = AgentName.of(projectId);

            // Build the trainingPhrases from the trainingPhrasesParts
            List<Intent.TrainingPhrase> trainingPhrases = new ArrayList<>();
            for (String trainingPhrase : trainingPhrasesParts) {
                trainingPhrases.add(
                        Intent.TrainingPhrase.newBuilder()
                                .addParts(Intent.TrainingPhrase.Part.newBuilder().setText(trainingPhrase).build())
                                .build());
            }

            // Build the message texts for the agent's response
            Intent.Message message =
                    Intent.Message.newBuilder().setText(Intent.Message.Text.newBuilder().addAllText(messageTexts).build()).build();

            // Build the intent
            Intent intent =
                    Intent.newBuilder()
                            .setDisplayName(displayName)
                            .addMessages(message)
                            .addAllTrainingPhrases(trainingPhrases)
                            .build();

            // Performs the create intent request
            Intent response = intentsClient.createIntent(parent, intent);
            System.out.format("Intent created: %s\n", response);

            return response;
        }
    }
}