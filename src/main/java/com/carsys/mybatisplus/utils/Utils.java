package com.carsys.mybatisplus.utils;


import org.springframework.util.DigestUtils;

import java.nio.charset.Charset;
import java.util.UUID;

public class Utils {


    static public String calMd5(String s) {
        return DigestUtils.md5DigestAsHex(s.getBytes(Charset.forName("UTF-8")));
    }

    static public String createUUID() {
        String uuid = UUID.randomUUID().toString();
        uuid = uuid.replace("-", "");
        return uuid;
    }


    public static void main(String[] args) {
        System.out.println(Utils.calMd5("12"));
        System.out.println(Utils.createUUID());
    }
}