package com.lee.article.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.bo.BlogSortListRecordBO;
import com.lee.common.entity.BaseQuery;
import com.lee.common.entity.BlogSort;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/24 17:04
 * @Version: 1.0
 */
public interface BlogSortService extends IService<BlogSort> {

    List<BlogSortListRecordBO> getBlogSortList(BaseQuery baseQuery);
}
