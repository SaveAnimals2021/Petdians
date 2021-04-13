package org.petdians.common.util;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import java.util.Collection;

public class JsonManager {

    public static JsonArray makeJsonArray(Collection src){
        JsonArray jsonArray = new JsonArray();

        if (null != src) {
            src.forEach(c -> {
                Gson gson = new Gson();
                String json = gson.toJson(c);
                jsonArray.add(json);
            });
        }

        return jsonArray;
    }

}
