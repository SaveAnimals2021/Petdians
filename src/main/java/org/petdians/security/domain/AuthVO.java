package org.petdians.security.domain;

import lombok.*;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Setter
@ToString
public class AuthVO {

    private String id;
    private String authority;

}
