package com.gzhu.medical_system.modules.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @ClassName User
 * @author: lucine
 * @Description TODO
 * @date 2021/5/15 8:35
 * @Version 1.0版本
 */
@Data
@TableName("users")
public class User {
    @TableId(value = "id",type = IdType.AUTO)
    private Integer id;
    private String username;
    private String password;
    private String location;
    private int age;
    private String realName;
    private String gender;
    private String phone;

}
