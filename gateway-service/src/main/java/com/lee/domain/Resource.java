package com.lee.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("sys_resource")
public class Resource {
    //主键
    @TableId
    private Long id;

    //创建时间
    private Date createTime;

    //资源名称
    private String name;

    // url
    private String url;

    //描述
    private String description;

    // 分类id
    private Integer categoryId;
}
