package org.petdians.member;

import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.member.config.MemberConfig;
import org.petdians.member.dto.MemberDTO;
import org.petdians.member.service.MemberService;
import org.petdians.common.config.CommonConfig;
import org.petdians.common.dto.PageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class, MemberConfig.class})
public class MemberVOServiceTests {

    @Autowired
    MemberService service;

    @Test
    public void testInsert() {

        for (int i = 0; i < 10; i++) {

            MemberDTO memberDTO = MemberDTO.builder()
                    .memberID("mw" + i)
                    .memberPW("mw" + i)
                    .memberName("mw" + i)
                    .build();

            service.register(memberDTO);

            log.info(memberDTO);

        }


    }

    @Test
    public void testSelectOne() {

        String id = "mw";
        log.info(service.readOne(id));

    }

    @Test
    public void testSelectAll() {

        PageDTO pageDTO = new PageDTO();
        service.listAll(pageDTO).forEach(admin -> log.info(admin));

    }

    @Test
    public void testUpdate() {

        MemberDTO memberDTO = MemberDTO.builder()
                .memberID("mw")
                .memberPW("mw")
                .memberName("mw")
                .build();

        service.modify(memberDTO);

        log.info(memberDTO);

    }

    @Test
    public void testDelete() {

        String id = "mw";
        service.remove(id);

        log.info(id);

    }

    @Test
    public void testGetToTalCount() {

        log.info(service.getTotalCount());

    }

}
