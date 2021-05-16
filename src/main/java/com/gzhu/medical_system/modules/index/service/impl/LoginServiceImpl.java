package com.gzhu.medical_system.modules.index.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gzhu.medical_system.modules.index.service.ILoginService;
import com.gzhu.medical_system.modules.system.entity.User;
import com.gzhu.medical_system.modules.system.mapper.UserMapper;
import com.gzhu.medical_system.modules.system.service.IUserService;
import org.springframework.stereotype.Service;

/**
 * @ClassName LoginServiceImpl
 * @author: lucine
 * @Description TODO
 * @date 2021/5/15 17:19
 * @Version 1.0版本
 */
@Service
public class LoginServiceImpl extends ServiceImpl<UserMapper, User> implements ILoginService {
    @Override
    public void checkLogin(User user){

    }
}
