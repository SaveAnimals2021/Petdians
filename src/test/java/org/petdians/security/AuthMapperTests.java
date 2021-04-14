package org.petdians.security;


import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.member.config.MemberConfig;
import org.petdians.common.config.CommonConfig;
import org.petdians.security.config.SecurityConfig;
import org.petdians.security.domain.AuthVO;
import org.petdians.security.mapper.AuthMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes={CommonConfig.class, SecurityConfig.class, MemberConfig.class})
public class AuthMapperTests {

    @Autowired
    AuthMapper mapper;


    @Test
    public void testReg(){
        log.info(mapper);


            AuthVO vo = AuthVO.builder()
                    .id("mk").authority("ROLE_USER")
                    .build();

            mapper.register(vo);



    }
}
