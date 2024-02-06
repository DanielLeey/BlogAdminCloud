package com.lee.article.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.lee.article.service.FeedbackService;
import com.lee.common.ThreadHolder.UserThreadHolder;
import com.lee.common.api.CommonResult;
import com.lee.common.dto.FeedbackDTO;
import com.lee.common.entity.Feedback;
import com.lee.common.entity.User;
import com.lee.common.vo.FeedbackVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2024/2/5 17:13
 * @Version: 1.0
 */
@RestController
@RequestMapping("/feedback")
public class FeedbackController {

    @Autowired
    private FeedbackService feedbackService;

    @GetMapping("getFeedbackList")
    public CommonResult getFeedbackList() {
        final User user = UserThreadHolder.get();
        if (ObjectUtil.isEmpty(user)) {
            return CommonResult.unauthorized("您还未登录，请先登录！");
        }
        LambdaQueryWrapper<Feedback> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Feedback::getUserUid, user.getUid());
        final List<Feedback> list = feedbackService.list(wrapper);
        final List<FeedbackDTO> feedbackDTOList = BeanUtil.copyToList(list, FeedbackDTO.class);
        return CommonResult.success(FeedbackVO.builder().feedbackDTOList(feedbackDTOList).build());
    }
}
