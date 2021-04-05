package org.petdians.common;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.petdians.common.dto.PageDTO;

@Log4j
public class GsonTests {


    @Test
    public void testGson(){
        PageDTO dto1 = new PageDTO();
        dto1.setDay("3");
        dto1.setType("s");
        dto1.setKeyword("0");
        dto1.setPerSheet(1000);

        PageDTO dto2 = new PageDTO();
        dto2.setDay("2");
        dto2.setType("s");
        dto2.setKeyword("3");
        dto2.setPerSheet(10);

        Gson gson = new Gson();
        String json1 = gson.toJson(dto1);
        String json2 = gson.toJson(dto2);
        JsonArray jsonArray = new JsonArray();
        jsonArray.add(json1);
        jsonArray.add(json2);

        log.info(jsonArray);
    }
}
