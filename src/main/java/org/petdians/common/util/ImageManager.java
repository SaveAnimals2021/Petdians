package org.petdians.common.util;

import lombok.extern.log4j.Log4j;
import org.petdians.animal.dto.ImageDTO;
import org.petdians.animal.dto.MissingAnimalDTO;
import org.petdians.crawling.util.CrawlManager;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Log4j
public class ImageManager {

    private static final String uploadFolder = "C:\\upload";

    // MissingAnimalDTO의 경로를 통해 생성한다.
    public static List<ImageDTO> saveImage(MissingAnimalDTO dto) throws Exception {
        List<String> urlList = dto.getImageUrlList();
        int size = urlList.size();
        if (0 == size) {
            return null;
        }

        List<ImageDTO> resultImages = new ArrayList<ImageDTO>();

        for (int i = 0; i < size; ++i) {
            String url = dto.getOriginURL() + urlList.get(i);

            // 1. 폴더 만들기
            // 파일 이름 뽑기
            String fileName = url.substring(url.lastIndexOf("/") + 1);
            String uuid = UUID.randomUUID().toString();

            String fileFullName = uuid + "_" + fileName;

            String folderPath = dto.getRegDate().replace("-", File.separator); // 2021/03/17

            // 최종 폴더 생성
            File uploadPath = new File(uploadFolder, folderPath); // 경로를 설정... (부모 경로), (자식 경로) C:\\upload\\2021\\03\\17

            // 있으면 null이 아니다. 없으면 null이다.
            if (false == uploadPath.exists()) {
                // 실제 폴더를 생성
                uploadPath.mkdirs();
            }

            // 2. 파일 만들기
            // 실제 저장할 파일 이름
            // 이미지를 파일로 저장하기 위해
            // 경로 + 파일이름 + 확장자
            int lastindex = fileFullName.lastIndexOf(".");
            String last = "";
            // .이 없다 = 확장자가 있다.
            if (-1 == lastindex) {
                last = uploadPath + File.separator + fileFullName + "." + dto.getImageType();
            } else {
                last = uploadPath + File.separator + fileFullName.substring(0, lastindex) + "." + dto.getImageType();
            }

            File checkPath = new File(last); // 경로를 설정... (부모 경로), (자식 경로) C:\\upload\\2021\\03\\17
            if (true == checkPath.exists()) {
                // 실제 폴더를 생성
                log.info("중복된 파일입니다.");
                continue;
            }

            // CRAWL, SAVE
            URL urlObj = new URL(url);
            HttpURLConnection urlCon = (HttpURLConnection) urlObj.openConnection();
            urlCon.setRequestProperty("User-Agent", CrawlManager.agent);
            // 파일 저장
            saveFile(urlCon, last);

            // ImageDTO에 저장
            ImageDTO imageDTO = ImageDTO.builder()
                    .animalNumber(dto.getAnimalNumber()).regDate(dto.getRegDate()).url(url).fileName(fileFullName)
                    .uploadPath(uploadPath.getPath()).uuid(uuid).type(dto.getImageType())
                    .build();

            resultImages.add(imageDTO);
        }

        return resultImages;
    }

    public static void saveImageDTO(ImageDTO dto) throws Exception {
        String url = dto.getUrl();
        URL urlObj = new URL(url);

        if(10715 == dto.getAnimalNumber()){
            int a = 0;
        }

        // 1. 폴더 만들기
        // 파일 이름 뽑기
        String fileName = url.substring(url.lastIndexOf("/") + 1);
        String uuid = dto.getUuid();

        String fileFullName = uuid + "_" + fileName;

        String folderPath = dto.getUploadPath();  // 2021/03/17

//        File testPath = new File(folderPath + File.separator + fileFullName); // 경로를 설정... (부모 경로), (자식 경로) C:\\upload\\2021\\03\\17
//
//        if (true == testPath.exists()) {
//            // 실제 폴더를 생성
//            log.info("중복된 파일입니다. " + testPath.getPath());
//            return;
//        }

        // 최종 폴더 생성
        File uploadPath = new File(folderPath); // 경로를 설정... (부모 경로), (자식 경로) C:\\upload\\2021\\03\\17

        // 있으면 null이 아니다. 없으면 null이다.
        if (false == uploadPath.exists()) {
            // 실제 폴더를 생성
            uploadPath.mkdirs();
        }

        // 2. 파일 만들기
        // 실제 저장할 파일 이름
        // 이미지를 파일로 저장하기 위해
        // 경로 + 파일이름 + 확장자
        int lastindex = fileFullName.lastIndexOf(".");
        String last = "";
        // .이 없다 = 확장자가 있다.
        if (-1 == lastindex) {
            last = folderPath + File.separator + fileFullName + "." + dto.getType();
        } else {
            last = folderPath + File.separator + fileFullName.substring(0, lastindex) + "." + dto.getType();
        }

        File lastFile = new File(last);

        if(lastFile.exists()){
            log.info("중복된 파일입니다.");
            return;
        }

        HttpURLConnection urlCon = (HttpURLConnection) urlObj.openConnection();
        urlCon.setRequestProperty("User-Agent", CrawlManager.agent);

        // 파일 저장
        saveFile(urlCon, last);
    }


    public static Boolean saveFile(HttpURLConnection con, String path) {
        FileOutputStream fos = null;
        try {
            // 이미지 저장하기 위해 inputStream 생성
            InputStream in = con.getInputStream();

            if (null == in) {
                return false;
            }

            fos = new FileOutputStream(path);

            byte[] buffer = new byte[1024 * 8];

            while (true) {
                int count = in.read(buffer);

                if (-1 == count) {
                    break;
                }

                fos.write(buffer, 0, count);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != fos) {
                    fos.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return true;
    }


    // 폴더 생성, 경로 반환
    private static String getFolder() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String result = sdf.format(new Date()); // 시스템 시간
        return result.replace("-", File.separator);
    }


}