package com.lee.common.Request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @Author: liyansong
 * @Date: 2022/12/21 16:34
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BlogRequest extends BaseRequest implements Serializable {

    private static final long serialVersionUID = -3489016658007358257L;

    private String blogSortUid;

    private String tagUid;

    private String levelKeyword;

    private String isPublish;

    private String isOriginal;

    private String type;

}
