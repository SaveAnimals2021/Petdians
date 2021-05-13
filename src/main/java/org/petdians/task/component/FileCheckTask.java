package org.petdians.task.component;

import lombok.extern.log4j.Log4j;
import org.petdians.animal.domain.ImageVO;
import org.petdians.task.mapper.TaskMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Log4j
@Component
public class FileCheckTask {

    @Autowired
    private TaskMapper taskMapper;

    private String getFolderYesterDay() {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Calendar cal = Calendar.getInstance();

        cal.add(Calendar.DATE, -1);

        String str = sdf.format(cal.getTime());

        return str.replace("-", File.separator);

    }

    @Scheduled(cron = "0 0 2 * * *")
    public void checkFiles() throws Exception{

        log.warn("File Check Task run..................");
        log.warn(new Date());

        //file list in database
        List<ImageVO> fileList = taskMapper.getOldFiles();

        //ready for check file in directory with database file list
        List<Path> fileListPaths = fileList.stream()
                .map(vo -> Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName()))
                .collect(Collectors.toList());

        //image file has thumnail file
        fileList.stream()
                .map(vo -> Paths.get("C:\\upload", vo.getUploadPath(), "s_" + vo.getUuid() + "_" + vo.getFileName()))
                .forEach(p -> fileListPaths.add(p));

        log.warn("========================================");

        //files in yesterday directory
        File targetDir = Paths.get("C:\\upload", getFolderYesterDay()).toFile();

        File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);

        log.warn("-----------------------------------------");
        for (File file: removeFiles) {

            log.warn(file.getAbsolutePath());
            file.delete();

        }//end for

    }//end CheckFile

}
