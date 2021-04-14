package org.petdians.member;

import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.common.config.CommonConfig;
import org.petdians.common.dto.PageDTO;
import org.petdians.member.config.MemberConfig;
import org.petdians.member.domain.MemberVO;
import org.petdians.member.mapper.MemberMapper;
import org.petdians.security.config.SecurityConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class, MemberConfig.class, SecurityConfig.class})
public class MemberVOMapperTests {

    @Autowired
    MemberMapper mapper;

    @Autowired
    private PasswordEncoder pwEncoder;

    @Test
    public void testInsert() {


        MemberVO memberVO = MemberVO.builder()
                .memberID("mk")
                .memberPW("mk")
                .memberName("Mingyu Sang")
                .build();

        mapper.insert(memberVO);

        log.info(memberVO);


    }

    @Test
    public void testSelectOne() {

        String id = "mw";
        MemberVO temp = mapper.selectOne(id);
        // log.info(mapper.read(id));
        String pw = pwEncoder.encode("mw");
        temp.changePW(pw);
        mapper.update(temp);
    }

    @Test
    public void testSelectAll() {

        PageDTO pageDTO = new PageDTO();
        List<MemberVO> list = mapper.selectAll(pageDTO.getSkip(), 100);

        for (int i = 0; i < list.size(); ++i) {
            MemberVO temp = list.get(i);
            String pw = pwEncoder.encode(temp.getMemberPW());
            temp.changePW(pw);
            log.info(pw);
            mapper.update(temp);
        }

    }

    @Test
    public void testUpdate() {


        MemberVO memberVO = MemberVO.builder()
                .memberID("mw")
                .memberPW("mw")
                .memberName("mw")
                .build();

        mapper.update(memberVO);

        log.info(memberVO);

    }

    @Test
    public void testDelete() {

        String id = "mw";
        mapper.delete(id);

        log.info(id);

    }

    @Test
    public void testGetToTalCount() {

        log.info(mapper.getTotalCount());

    }

    @Test
    public void testRead() {

        log.info(mapper.read("mw"));

    }

}
