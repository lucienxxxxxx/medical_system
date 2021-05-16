package com.gzhu.medical_system.modules.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName SystemController
 * @author: lucine
 * @Description TODO
 * @date 2021/5/15 7:10
 * @Version 1.0版本
 */
@Controller
@RequestMapping("/system/")
public class SystemController {
    @GetMapping("index")
    public String index(){
        return "system/index";
    }
}
