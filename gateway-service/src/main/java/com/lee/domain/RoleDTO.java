package com.lee.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RoleDTO {

    private Long uid;

    //创建时间
    private Date createTime;
    //启用状态：0->禁用；1->启用
    private Integer status;
    //名称
    private String roleName;
    //修改时间
    private Date updateTime;
    //描述
    private String summary;

    //用户资源
    private List<String> categoryMenuUids;
}
