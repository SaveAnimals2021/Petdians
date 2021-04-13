package org.petdians.security.domain;

import lombok.*;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class AuthVO {

    private String memberID;
    private String authority;

}
