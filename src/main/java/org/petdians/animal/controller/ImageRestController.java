package org.petdians.animal.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.petdians.animal.service.ImageService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.net.URLDecoder;
import java.nio.file.Files;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/petdians/image")
@RequiredArgsConstructor
@Log4j
public class ImageRestController {

    private final ImageService service;


    @GetMapping(value="/get")
    public ResponseEntity<byte[]> getImage(String file) {
        log.info("REST -> get Image......");
        ResponseEntity<byte[]> res = null;

        try {
            String deStr = URLDecoder.decode(file, "UTF-8").replace("#", ".");
            log.info(deStr);

            File targetFile = new File("C:\\upload\\" + deStr);

            // header 메시지 필요
            // MIME TYPE
            String mimeType = Files.probeContentType(targetFile.toPath());

            HttpHeaders header = new HttpHeaders();
            header.add("Content-Type", mimeType);

            res = new ResponseEntity<byte[]>(
                    FileCopyUtils.copyToByteArray(targetFile), header, HttpStatus.OK
            );

        } catch(Exception e) {
            e.printStackTrace();
        }

        return res;


    }
}
