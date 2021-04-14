package org.petdians.security.service;

import lombok.extern.log4j.Log4j;
import org.petdians.member.domain.MemberVO;
import org.petdians.member.mapper.MemberMapper;
import org.petdians.security.domain.CustomMemberVO;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;


@Service
@Log4j
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private MemberMapper memberMapper;

    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {

        log.info("LOAD USER BY Admin : " + id);

        // username == userid
        MemberVO vo = memberMapper.read(id);

        log.info("queried by MemberMapper : " + vo);

        return vo == null ? null : new CustomMemberVO(vo);
    }
}
