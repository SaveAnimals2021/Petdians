package org.petdians.user;


import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.common.config.CommonConfig;
import org.petdians.common.dto.PageDTO;
import org.petdians.user.config.UserConfig;
import org.petdians.user.domain.UserVO;
import org.petdians.user.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class, UserConfig.class})
public class UserMapperTests {

    @Autowired
    UserMapper mapper;

    @Test
    public void testRegister(){

        for(int i = 0; i < 10; ++i) {
            UserVO vo = UserVO.builder()
                    .userid("TESTUSER" + i).userpw("TESTPW" + i).username("TESTNAME" + i)
                    .build();

            mapper.register(vo);
        }
    }

    @Test
    public void testList(){
        PageDTO pageDTO = new PageDTO();

        pageDTO.setPage(1);
        pageDTO.setPerSheet(5);

        List<UserVO> list = mapper.getPagedList(pageDTO.getSkip(), pageDTO.getPerSheet());
        list.forEach(v->log.info(v));
    }


}
