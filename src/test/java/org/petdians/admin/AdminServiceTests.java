package org.petdians.admin;

import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.admin.config.AdminConfig;
import org.petdians.admin.domain.Admin;
import org.petdians.admin.dto.AdminDTO;
import org.petdians.admin.mapper.AdminMapper;
import org.petdians.admin.service.AdminService;
import org.petdians.common.config.CommonConfig;
import org.petdians.common.dto.PageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class, AdminConfig.class})
public class AdminServiceTests {

    @Autowired
    AdminService service;

    @Test
    public void testInsert() {

        for (int i = 0; i < 10; i++) {

            AdminDTO adminDTO = AdminDTO.builder()
                    .adminID("mw" + i)
                    .adminPW("mw" + i)
                    .adminName("mw" + i)
                    .build();

            service.register(adminDTO);

            log.info(adminDTO);

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

        AdminDTO adminDTO = AdminDTO.builder()
                .adminID("mw")
                .adminPW("mw")
                .adminName("mw")
                .build();

        service.modify(adminDTO);

        log.info(adminDTO);

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
