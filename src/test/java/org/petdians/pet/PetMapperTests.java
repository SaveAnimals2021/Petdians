package org.petdians.pet;


import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.common.config.CommonConfig;
import org.petdians.pet.config.PetConfig;
import org.petdians.pet.domain.PetVO;
import org.petdians.pet.mapper.PetMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class, PetConfig.class})
public class PetMapperTests {

    @Autowired
    PetMapper mapper;

    @Test
    public void testRegister(){
        PetVO dto = PetVO.builder()
                .age(5).sex(0).isNeutralized(true).petname("나르").species("푸들").type("강아지")
                .userid("TESTUSER")
                .build();

        mapper.register(dto);
    }
}
