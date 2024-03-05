package com.javaweb.converter;

import org.springframework.stereotype.Component;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class DistrictConverter {
    String toDistrict(String districtCode){
        String result = "Quận ";
        Pattern pattern = Pattern.compile("\\d+");
        Matcher matcher = pattern.matcher(districtCode);
        if (matcher.find()) {
            result += matcher.group();
        } else {
            result += "Không xác định";
        }
        return result;
    }
}
