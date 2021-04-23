package org.petdians.firebase;

import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.Message;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.common.config.CommonConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class})

public class FirebaseTests {
    @Autowired
    FirebaseOptions options;

    @Test
    public void testFirebaseOptions() {
        log.info(options);
    }

    @Test
    public void testSend() {
        // The topic name can be optionally prefixed with "/topics/".
        String topic = "highScores";

        // See documentation on defining a message payload.
        Message message = Message.builder()
                .putData("score", "850")
                .putData("time", "2:45")
                .setTopic(topic)
                .build();

        String response = "";
        try {
            // Send a message to the devices subscribed to the provided topic.
            response = FirebaseMessaging.getInstance().send(message);
        } catch(Exception e){
            e.printStackTrace();
        }

        // Response is a message ID string.
        System.out.println("Successfully sent message: " + response);
    }

}
