package org.petdians.user;


import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.animal.config.AnimalConfig;
import org.petdians.common.config.CommonConfig;
import org.petdians.common.dto.PageDTO;
import org.petdians.user.config.UserConfig;
import org.petdians.user.dto.UserDTO;
import org.petdians.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class, AnimalConfig.class, UserConfig.class})
public class UserServiceTests {

    @Autowired
    UserService service;

    @Test
    public void testRegister(){

        for(int i = 10; i < 20; ++i) {
            UserDTO dto = UserDTO.builder()
                    .userid("TESTUSER" + i).userpw("TESTPW" + i).username("TESTNAME" + i)
                    .build();

            service.register(dto);
        }
    }

    @Test
    public void testList(){
        PageDTO pageDTO = new PageDTO();

        pageDTO.setPage(2);
        pageDTO.setPerSheet(5);

        List<UserDTO> list = service.getPagedList(pageDTO);
        list.forEach(v->log.info(v));
    }

    @Test
    public void testModify(){
        UserDTO dto = UserDTO.builder()
                .userid("TESTUSER9").userphone("01012345678").useremail("12345678@gmail.com").username("TESTNAME9")
                .build();

        service.modify(dto);
    }
}
