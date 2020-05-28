package com.springboot.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author YQ
 * @Data 2020/5/26 14:23
 * @Description
 * @Version 1.0
 */
@SpringBootApplication
@RestController
public class Demo1 {
    @RequestMapping("/hello")
    public String hello(){
        String str = null;
//        str.charAt(1);
        int i  = 1/0;
        return "hello spring boot !";
    }

    /**
     * 等同于重启服务器
     * @param args
     */
    public static void main(String[] args){
        SpringApplication.run(Demo1.class,args);
    }
}
