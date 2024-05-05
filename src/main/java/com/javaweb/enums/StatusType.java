package com.javaweb.enums;

import java.util.HashMap;
import java.util.Map;

public enum StatusType {
    DANG_XU_LY ("Đang xử lý"),
    DA_XU_LY("Đã xử lý"),
    CHUA_XU_LY("Chưa xử lý");

    private final String name;

    StatusType(String name) {
        this.name = name;
    }

    public String getCode() {
        return name;
    }

    public static Map<String,String> type(){
        Map<String,String> listType = new HashMap<>();
        for(StatusType item : StatusType.values()){
            listType.put(item.toString() , item.name);
        }
        return listType;
    }
}
