package org.petdians.petbot.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class PetbotDTO {

    private String name;
    private Integer phrasesCount;
    private List<String> phrasesList;

    public void addPhrasesList(List<String> list){
        this.phrasesList = list;
    }
}
