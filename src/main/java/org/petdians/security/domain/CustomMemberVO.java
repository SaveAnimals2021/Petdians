package org.petdians.security.domain;

import lombok.Getter;
import org.petdians.member.domain.MemberVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;
import java.util.stream.Collectors;


@Getter
public class CustomMemberVO  extends User {

    private MemberVO member;

    public CustomMemberVO(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }

    public CustomMemberVO(MemberVO vo){
        super(vo.getMemberID(), vo.getMemberPW(), vo.getAuthList().stream()
        .map(a->new SimpleGrantedAuthority(a.getAuthority())).collect(Collectors.toList()));

        this.member = vo;
    }
}
