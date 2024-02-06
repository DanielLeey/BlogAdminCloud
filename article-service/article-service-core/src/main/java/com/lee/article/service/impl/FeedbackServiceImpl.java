package com.lee.article.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.article.dao.FeedbackMapper;
import com.lee.article.service.FeedbackService;
import com.lee.common.entity.Feedback;
import org.springframework.stereotype.Service;

/**
 * @Author: liyansong
 * @Date: 2024/2/5 17:28
 * @Version: 1.0
 */
@Service("feedbackService")
public class FeedbackServiceImpl extends ServiceImpl<FeedbackMapper, Feedback> implements FeedbackService {
}
