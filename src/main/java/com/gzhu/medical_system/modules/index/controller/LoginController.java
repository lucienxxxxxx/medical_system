package com.gzhu.medical_system.modules.index.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.gzhu.medical_system.base.model.ResonseData;
import com.gzhu.medical_system.modules.index.service.ILoginService;
import com.gzhu.medical_system.modules.system.entity.User;
import com.gzhu.medical_system.modules.system.mapper.UserMapper;
import com.gzhu.medical_system.modules.system.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @ClassName LoginController
 * @author: lucine
 * @Description 登录控制器
 * @date 2021/5/15 6:57
 * @Version 1.0版本
 */
@Controller
public class LoginController {
    @Autowired
    public UserMapper userMapper;
    @Autowired
    public IUserService userService;

    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @PostMapping("/login/check")
    @ResponseBody
    public ResonseData check(User user){
        System.out.println("进入登录判断");
        System.out.println(user.toString());
        ResonseData data = new ResonseData();
        try{
            QueryWrapper<User> queryWrapper=new QueryWrapper<User>();
            queryWrapper.eq("username", user.getUsername());
            User myUser=this.userMapper.selectOne(queryWrapper);
            if(myUser!=null&&myUser.getPassword().equals(user.getPassword())){
                data.setMsg("登录成功！");
                data.setCode(200);
            }else{
                data.setMsg("密码或者账号错误，请重试");
                data.setCode(0);
            }
        }catch (Exception e){
            e.printStackTrace();
            data.setMsg("登录失败");
            data.setCode(0);
        }
        return data;
    }
}