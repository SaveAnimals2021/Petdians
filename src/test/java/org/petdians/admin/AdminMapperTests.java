package org.petdians.admin;

import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.admin.config.AdminConfig;
import org.petdians.admin.domain.Admin;
import org.petdians.admin.mapper.AdminMapper;
import org.petdians.animal.config.AnimalConfig;
import org.petdians.common.config.CommonConfig;
import org.petdians.common.dto.PageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes={CommonConfig.class, AdminConfig.class})
public class AdminMapperTests {

    @Autowired
    AdminMapper mapper;

    @Test
    public void testInsert() {

        for (int i = 0; i < 10; i++) {

            Admin admin = Admin.builder()
                    .adminID("mw" + i)
                    .adminPW("mw" + i)
                    .adminName("mw" + i)
                    .build();

            mapper.insert(admin);

            log.info(admin);

        }


    }

    @Test
    public void testSelectOne() {

        String id = "mw";
        log.info(mapper.selectOne(id));

    }

    @Test
    public void testSelectAll() {

        PageDTO pageDTO = new PageDTO();
        mapper.selectAll(pageDTO.getSkip(), pageDTO.getPerSheet()).forEach(admin -> log.info(admin));

    }

    @Test
    public void testUpdate() {

        Admin admin = Admin.builder()
                .adminID("mw")
                .adminPW("mw")
                .adminName("mw")
                .build();

        mapper.update(admin);

        log.info(admin);

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

}
