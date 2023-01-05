package com.lee.common.Request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @Author: liyansong
 * @Date: 2023/1/3 21:12
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SubjectItemDeleteRequest implements Serializable {
    private static final long serialVersionUID = 8309782908293367956L;

    private String uid;
}
