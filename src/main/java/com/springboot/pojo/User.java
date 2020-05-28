package com.springboot.pojo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.Map;

/**
 * @Author YQ
 * @Data 2020/5/26 16:04
 * @Description
 * @Version 1.0
 */
@PropertySource(value = "classpath:/application.yml")
@Component
@ConfigurationProperties(prefix = "user")
public class User {
    private String username;
    private int age;
    private boolean boss;
    private Date birthday;
    private Map<String,Object> map;
    private String[] lists;
    @Autowired
    private Dog dog;

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

    public boolean isBoss() {
        return boss;
    }

    public void setBoss(boolean boss) {
        this.boss = boss;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }

    public String[] getLists() {
        return lists;
    }

    public void setLists(String[] lists) {
        this.lists = lists;
    }

    public Dog getDog() {
        return dog;
    }

    public void setDog(Dog dog) {
        this.dog = dog;
    }
}

