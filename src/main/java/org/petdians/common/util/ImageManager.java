package org.petdians.common.util;

import lombok.extern.log4j.Log4j;
import org.petdians.animal.dto.ImageDTO;
import org.petdians.animal.dto.MissingAnimalDTO;
import org.petdians.common.crawling.service.CrawlService;

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

    // MissingAnimalDTO의 정로를 통해 생성한다.
    public static List<ImageDTO> saveImage(MissingAnimalDTO dto) throws Exception {
        List<String> urlList = dto.getImageUrlList();
        int size = urlList.size();
        if (0 == size) {
            return null;
        }

        List<ImageDTO> resultImages = new ArrayList<ImageDTO>();

        for (int i = 0; i < size; ++i) {
            String url = dto.getOriginURL() + urlList.get(i);
            URL urlObj = new URL(url);

            HttpURLConnection urlCon = (HttpURLConnection) urlObj.openConnection();
            urlCon.setRequestProperty("User-Agent", CrawlService.agent);

            // 이미지 저장하기 위해 inputStream 생성
            InputStream in = urlCon.getInputStream();

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
            if(-1 == lastindex){
                last = uploadPath + File.separator + fileFullName + "." + dto.getImageType();
            } else {
                last = uploadPath + File.separator + fileFullName.substring(0, lastindex) + "." + dto.getImageType();
            }
            FileOutputStream fos = new FileOutputStream(last);

            byte[] buffer = new byte[1024 * 8];

            while (true) {
                int count = in.read(buffer);

                if (-1 == count) {
                    break;
                }

                fos.write(buffer, 0, count);
            }

            fos.close();

            // ImageDTO에 저장
            ImageDTO imageDTO = ImageDTO.builder()
                    .animalNumber(dto.getAnimalNumber()).regDate(dto.getRegDate()).url(url).fileName(fileFullName)
                    .uploadPath(uploadPath.getPath()).uuid(uuid).type(dto.getImageType())
                    .build();

            resultImages.add(imageDTO);
        }

        return resultImages;
    }


        // 폴더 생성, 경로 반환
        private static String getFolder () {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String result = sdf.format(new Date()); // 시스템 시간
            return result.replace("-", File.separator);
        }

        // 이미지 저장
        private static void saveImageFile (String url, String type, String name, String uuid) throws Exception {
            URL urlObj = new URL(url);
            HttpURLConnection urlCon = (HttpURLConnection) urlObj.openConnection();
            urlCon.setRequestProperty("User-Agent", CrawlService.agent);

            // 이미지 저장하기 위해 inputStream 생성
            InputStream in = urlCon.getInputStream();

            // 파일 이름 뽑기
            String fileName = url.substring(url.lastIndexOf("/") + 1);
            String fileFullName = uuid + "_" + fileName;

            String folderPath = getFolder(); // 2021/03/17
            // 파일 저장 경로
            String uploadFolder = "C:\\upload";
            File uploadPath = new File(uploadFolder, folderPath); // 경로를 설정... (부모 경로), (자식 경로) C:\\upload\\2021\\03\\17

            // 있으면 null이 아니다. 없으면 null이다.
            if (false == uploadPath.exists()) {
                // 실제 폴더를 생성
                uploadPath.mkdirs();
            }

            // 실제 저장할 파일 이름
            File saveFile = new File(uploadPath, name);

            // 이미지를 파일로 저장하기 위해
            FileOutputStream fos = new FileOutputStream("C:\\upload\\" + fileName + "." + type);

            byte[] buffer = new byte[1024 * 8];

            while (true) {
                int count = in.read(buffer);

                if (-1 == count) {
                    break;
                }

                fos.write(buffer, 0, count);
            }

            fos.close();

            // ImageDTO에 저장

        }
    }
