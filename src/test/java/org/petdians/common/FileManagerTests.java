package org.petdians.common;

import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.petdians.common.util.FileManager;

import java.nio.charset.StandardCharsets;

@Log4j
public class FileManagerTests {

    @Test
    public void testSaveString(){
        String test = "AAAAAAAAAAAAAAAAAAAAAAAAAAA";
        String fileName = "C:\\upload\\test.txt";

        try {
            FileManager.saveFile(test.getBytes(StandardCharsets.UTF_8), fileName);
            log.info("SAVE DONE......");
        }catch(Exception e){
            e.printStackTrace();
            log.info("EXCEPTION OCCURED......");
        }
    }

}
