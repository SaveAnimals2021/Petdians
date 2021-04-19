package org.petdians.pet.service;

import lombok.extern.log4j.Log4j;
import org.petdians.pet.domain.PetVO;
import org.petdians.pet.mapper.PetMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Log4j
public class PetServiceImpl implements PetService{

    @Autowired
    private PetMapper mapper;

    public PetVO readOne(Integer pno) {

        return mapper.selectOne(pno);

    }

}
