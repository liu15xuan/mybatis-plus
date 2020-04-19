package com.carsys.mybatisplus.api.controller;


import com.carsys.mybatisplus.utils.Utils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;

@RestController
@RequestMapping("/file")
public class FileUpload {


    @PostMapping(value = {"/upload"})
    @ResponseBody
    public String GenerateImage(@RequestParam("file") MultipartFile multipartFile) throws 
    IOException {
        if (multipartFile.isEmpty() || StringUtils.isBlank(multipartFile.getOriginalFilename())) {
            return "0";
        }
        String path = FileUpload.saveImg(multipartFile, "src/main/webapp/static/upload");
        System.out.println(path);
        return path;
    }

    private static String saveImg(MultipartFile multipartFile, String path) throws IOException {
        File file = new File(path);
        if (!file.exists()) {
            file.mkdirs();
        }
        String rootFileName = multipartFile.getOriginalFilename();
        assert rootFileName != null;
        String sname = rootFileName.substring(rootFileName.lastIndexOf("."));
        FileInputStream fileInputStream = (FileInputStream) multipartFile.getInputStream();
        String fileName = Utils.createUUID() + sname;
        BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(path + 
        File.separator + fileName));
        byte[] bs = new byte[1024];
        int len;
        while ((len = fileInputStream.read(bs)) != -1) {
            bos.write(bs, 0, len);
        }
        bos.flush();
        bos.close();
        return "/static/upload/" + fileName;
    }

}
