package com.lee.common.Request;

import com.lee.common.bo.WebNavbarBO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2023/1/19 16:55
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class WebNavbarEditRequest {

    private String uid;

    private String name;

    private Integer navbarLevel;

    private String summary;

    private String parentUid;

    private String url;

    private String icon;

    private Integer isShow;

    private Integer isJumpExternalUrl;

    private Integer sort;

    private Integer status;

    private Date createTime;

    private Date updateTime;

    private List<WebNavbarBO> childWebNavbar;
}
