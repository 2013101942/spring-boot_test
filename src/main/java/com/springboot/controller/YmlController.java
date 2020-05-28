package com.springboot.controller;

import com.springboot.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author YQ
 * @Data 2020/5/26 16:42
 * @Description
 * @Version 1.0
 */
@Controller
public class YmlController {
    @Autowired
    User user;

    @RequestMapping("/yml")
    @ResponseBody
    public User responseYml(){
        return user;
    }
}
