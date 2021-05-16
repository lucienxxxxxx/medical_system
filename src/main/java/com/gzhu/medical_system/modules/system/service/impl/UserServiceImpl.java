package com.gzhu.medical_system.modules.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gzhu.medical_system.base.model.PageData;
import com.gzhu.medical_system.modules.system.entity.User;
import com.gzhu.medical_system.modules.system.mapper.UserMapper;
import com.gzhu.medical_system.modules.system.service.IUserService;
import org.springframework.stereotype.Service;
/**
 * @ClassName UserService
 * @author: lucine
 * @Description TODO
 * @date 2021/5/15 6:59
 * @Version 1.0版本
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Override
    public int saveOrUpdateUser(User user) {
        this.save(user);
        return 1;//成功
    }

    @Override
    public PageData<User> getPage(int page, int limit, User user) {
        PageData<User> userPage =new PageData<User>();
        Page pageInfo =new Page(page,limit);
        QueryWrapper<User> queryWrapper =new QueryWrapper<>();
        if (user.getUsername()!=null&&user.getUsername().length()>0){
            queryWrapper.like("username",user.getUsername());
        }
        if (user.getRealName()!=null&&user.getRealName().length()>0){
            queryWrapper.like("real_name",user.getRealName());
        }
        if (user.getGender()!=null&&user.getGender().length()>0){
            queryWrapper.like("gender",user.getGender());
        }
        IPage iPage=this.page(pageInfo,queryWrapper);
        userPage.setCount(iPage.getTotal());
        userPage.setData(iPage.getRecords());
        userPage.setCode(0);
        userPage.setMessage("");
        return userPage;
    }

    @Override
    public void resetPassword(User user, String password) {
        user.setPassword(password);
        this.updateById(user);
    }
}
