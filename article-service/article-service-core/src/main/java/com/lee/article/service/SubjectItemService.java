package com.lee.article.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.Request.SubjectItemEditRequest;
import com.lee.common.entity.SubjectItem;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/30 16:31
 * @Version: 1.0
 */
public interface SubjectItemService extends IService<SubjectItem> {

    Boolean editSubject(List<SubjectItemEditRequest> subjectItemRequests);

    Boolean deleteBatch(List<String> uids);
}
