package com.javaweb.utils;

import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class DateUtils {
    public String parseDateFormat(Date date, String fomat){
        SimpleDateFormat sdf = new SimpleDateFormat(fomat);
        return sdf.format(date);
    }
}
