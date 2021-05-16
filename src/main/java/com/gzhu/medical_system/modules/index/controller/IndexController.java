package com.gzhu.medical_system.modules.index.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @ClassName IndexController
 * @author: lucine
 * @Description 主页控制器
 * @date 2021/5/15 6:57
 * @Version 1.0版本
 */
@Controller
public class IndexController {

    @GetMapping({"","/","/index"})
    public String index(){
        return "index";
    }
}