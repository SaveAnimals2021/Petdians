package org.petdians.animal.service;


import lombok.extern.log4j.Log4j;
import org.petdians.animal.dto.ImageDTO;
import org.petdians.animal.mapper.ImageMapper;
import org.petdians.common.crawling.service.CrawlService;
import org.petdians.common.util.ImageManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

@Log4j
@Service
public class ImageServiceImpl implements ImageService{

    @Autowired
    ImageMapper mapper;

    @Override
    public void register(ImageDTO dto) {
        try {
            mapper.register(toDomain(dto));
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public List<ImageDTO> getImageByAno(Integer ano) throws Exception{
        return toDTOList( mapper.getImageByAno(ano) );
    }

    public List<ImageDTO> getAllImages() throws Exception{
        return toDTOList( mapper.getAllImages() );
    }

    public void downloadAll() throws Exception{
        List<ImageDTO> list = toDTOList( mapper.getAllImages());

        int size = list.size();
        for(int i = 0; i < size; ++i){
            ImageDTO dto = list.get(i);

            // 1. 파일 이름(경로포함)
            String fileFullName = dto.getFileName();
            int lastindex = fileFullName.lastIndexOf(".");
            String last = "";

            // .이 없다 => 확장자가 있다.
            if (-1 == lastindex) {
                last = dto.getUploadPath() + File.separator + fileFullName + "." + dto.getType();
            } else {
                last = dto.getUploadPath() + File.separator + fileFullName.substring(0, lastindex) + "." + dto.getType();
            }

            File imageFile = new File(last);

            // 중복된 파일이 있다면
            if(imageFile.exists()){
                continue;
            }

            log.info("dto : " + dto);
            log.info("url : " + dto.getUrl());

            // URL 연결
            URL urlObj = new URL(dto.getUrl());
            HttpURLConnection urlCon = (HttpURLConnection) urlObj.openConnection();
            urlCon.setRequestProperty("User-Agent", CrawlService.agent);

            try {
                ImageManager.saveFile(urlCon, last);
            } catch(Exception e){
                e.printStackTrace();
                continue;
            }
        }
    }
}
