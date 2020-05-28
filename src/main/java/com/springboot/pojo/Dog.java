package com.springboot.pojo;

import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * @Author YQ
 * @Data 2020/5/26 16:08
 * @Description
 * @Version 1.0
 */
@PropertySource(value = "classpath:/application.yml")
@Component
public class Dog {
    private String username;
    private int age;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
