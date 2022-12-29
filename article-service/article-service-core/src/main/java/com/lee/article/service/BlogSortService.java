package com.lee.article.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.Request.BlogSortRequest;
import com.lee.common.bo.BlogSortListRecordBO;
import com.lee.common.Request.BaseRequest;
import com.lee.common.entity.BlogSort;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/24 17:04
 * @Version: 1.0
 */
public interface BlogSortService extends IService<BlogSort> {

    List<BlogSortListRecordBO> getBlogSortList(BaseRequest baseRequest);

    Boolean stick(String uid);

    Boolean editBLogSort(BlogSortRequest blogSortRequest);

    Boolean deleteBatch(List<String> uids);

    Boolean blogSortByClickCount();

    Boolean addBlogSortList(BlogSortRequest blogSortRequest);
}
