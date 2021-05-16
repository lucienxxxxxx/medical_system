package com.gzhu.medical_system.modules.index.controller;

import com.gzhu.medical_system.base.model.ResonseData;
import com.gzhu.medical_system.modules.system.entity.User;
import com.gzhu.medical_system.modules.system.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @ClassName Register
 * @author: lucine
 * @Description TODO
 * @date 2021/5/15 7:43
 * @Version 1.0版本
 */
@Controller
public class RegisterController {

    @Autowired
    private IUserService userService;

    @GetMapping("/register")
    public String register(){
        return "register";
    }

    @PostMapping("/register/add")
    @ResponseBody
    public ResonseData addRegister(User user){
        System.out.println("正在进行注册"+user.toString());
        ResonseData data = new ResonseData();
        try {
            System.out.println("--进行保存");
            int result=this.userService.saveOrUpdateUser(user);
            System.out.println("进入注册反馈,result为"+result);
            if(result==1){
                data.setCode(200);
                data.setMsg("注册成功！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            data.setMsg("注册失败");
            data.setCode(0);
        }
        System.out.println("data数据："+data);
        return data;
    }
}
