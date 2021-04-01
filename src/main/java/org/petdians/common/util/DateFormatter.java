package org.petdians.common.util;

import lombok.extern.log4j.Log4j;

import java.text.SimpleDateFormat;
import java.util.Date;

@Log4j
public class DateFormatter {
    static SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd hh:mm");
    // static SimpleDateFormat simpleFormatter = new SimpleDateFormat("yyyy/MM/dd");

    public static String parseToWords(Date date) {

        // Date resultDate = new Date(result);

        String resultStr = "";
        Date now = new Date();
        Date utilDate = new Date(date.getTime() - 9 * 1000 * 60 * 60);
        Long result = now.getTime() - utilDate.getTime();

        // 분 확인 => 방금
        if (1 > (result / 1000 / 60)) {
            resultStr = "just now";
            // 시간 확인
        } else if (1 > (result/1000/60/60)) {
            resultStr = result / 1000 / 60 + " minute(s) ago";
            // 날 확인
        } else if(1 > (result/1000/60/60/24)){
            resultStr = result / 1000 / 60 /60 + " hour(s) ago";
            // 주 확인
        } else if (1 > (result / 1000 / 60 / 60 / 24 / 7)){
            resultStr = result/1000/60/60/24 + " day(s) ago";
        } else {
            resultStr = formatter.format(utilDate);
        }


        log.info("==============================");
        log.info("결과 : " + resultStr);
        log.info("시간차이 : " + result / 1000 / 60 + "분");
        log.info("현재시간 : " + now);
        log.info("등록시간 : " + utilDate);

        // 월 확인
        // 일 확인
        // 시간 확인
        // 분 확인
        // 방금

        return resultStr;
    }

    public static String fromDateToString(Date date) {
        if(null == date){
            return "Unknown";
        }
        return  formatter.format(new Date(date.getTime() - 9 * 1000 * 60 * 60));
    }


    public static Date fromStringToDate(String str) throws Exception {
        return null == str || str.length() == 0 ? null : formatter.parse(str);
    }

    public static Boolean checkInThreeMonths(Date date){

        Boolean isInThree = false;
        // 현재 시간
        Date now = new Date();
        // 등록 시간
        Date utilDate = new Date(date.getTime() - 9 * 1000 * 60 * 60);
        // 시간 차이
        Long result = now.getTime() - utilDate.getTime();

        // 90일 차이 확인
        if (1 > (result / 1000 / 60 / 60 / 24 / 90)){
            isInThree = true;
        }

        return isInThree;
    }
}
