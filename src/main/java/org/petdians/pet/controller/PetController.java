package org.petdians.pet.controller;

import lombok.extern.log4j.Log4j;
import org.petdians.pet.domain.PetVO;
import org.petdians.pet.dto.PetDTO;
import org.petdians.pet.service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/petdiansAdmin/pet")
@Log4j
public class PetController {

    @Autowired
    private PetService service;

    @RequestMapping(value = "/read", produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<PetDTO> read(Integer pno) {

        log.info("read.................................");

        PetVO vo = service.readOne(pno);

        if (vo.equals(null)) {

            return new ResponseEntity(null, HttpStatus.INTERNAL_SERVER_ERROR);

        }

        return new ResponseEntity(vo, HttpStatus.OK);
    }
}
