package org.petdians.common.util;


import java.io.*;

public class FileManager {


    public static void saveFile(byte[] data, String fileName) throws Exception {
        File newFile = new File(fileName);
        OutputStream fos = new FileOutputStream(newFile, true);

        fos.write(data);

        fos.close();
    }

}
