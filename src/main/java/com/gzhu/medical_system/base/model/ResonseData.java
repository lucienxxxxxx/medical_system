package com.gzhu.medical_system.base.model;

import lombok.Data;
import org.springframework.web.bind.annotation.ResponseBody;


@Data
@ResponseBody
public class ResonseData {
    private String msg;
    private int code;
}