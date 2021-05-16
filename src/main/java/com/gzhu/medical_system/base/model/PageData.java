package com.gzhu.medical_system.base.model;

import lombok.Data;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Data
@ResponseBody
public class PageData<T> {
    private int code;
    private long count;
    private List<T> data;
    private String message;
}