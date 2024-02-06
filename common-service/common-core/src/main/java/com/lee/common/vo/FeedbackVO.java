package com.lee.common.vo;

import com.lee.common.dto.FeedbackDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2024/2/5 17:23
 * @Version: 1.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FeedbackVO {

    private List<FeedbackDTO> feedbackDTOList;

}
