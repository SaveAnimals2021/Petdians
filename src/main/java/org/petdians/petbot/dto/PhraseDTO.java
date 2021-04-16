package org.petdians.petbot.dto;

import lombok.Data;

@Data
public class PhraseDTO {
    String id;
    String response;
    String phrase;
    Integer index;
}
