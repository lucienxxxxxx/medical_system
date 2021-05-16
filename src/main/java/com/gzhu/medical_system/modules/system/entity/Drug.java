package com.gzhu.medical_system.modules.system.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @ClassName Drug
 * @author: lucine
 * @Description TODO
 * @date 2021/5/15 19:48
 * @Version 1.0版本
 */
@Data
@TableName(value = "drugs")
public class Drug {
    private Long id;
    private String mname;
    private Integer pid;
    private String pdate;
    private String vdate;
    private String useMethod;
    private String pcompany;
    private String dsize;
    private String function;
    private String introduce;
}
