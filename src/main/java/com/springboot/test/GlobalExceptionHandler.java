package com.springboot.test;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author YQ
 * @Data 2020/5/26 15:36
 * @Description
 * @Version 1.0
 */
@ControllerAdvice
@ResponseBody
public class GlobalExceptionHandler {
    @ExceptionHandler(ArithmeticException.class)
    public Map<String,Object> handleArithmeticException(ArithmeticException e){
        Map<String,Object> map = new HashMap<String,Object>();
        e.printStackTrace();    //在控制台打印
        map.put("errorCode",201);
        map.put("errorMsg","算术异常");
        return map;
    }

    @ExceptionHandler(Exception.class)
    public Map<String,Object> handleException(Exception e){
        Map<String, Object> map = new HashMap<String,Object>();
        e.printStackTrace();
        map.put("errorCode",202);
        map.put("errorMsg","异常");
        return map;
    }
}
