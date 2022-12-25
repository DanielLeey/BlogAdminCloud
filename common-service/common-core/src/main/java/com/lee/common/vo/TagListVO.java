package com.lee.common.vo;

import com.lee.common.bo.TagListRecordBO;
import lombok.*;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/25 17:17
 * @Version: 1.0
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TagListVO extends BaseVO {

    private List<TagListRecordBO> records;
}
