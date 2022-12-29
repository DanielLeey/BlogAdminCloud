package com.lee.article.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lee.common.entity.BlogSort;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/24 17:06
 * @Version: 1.0
 */
public interface BlogSortMapper extends BaseMapper<BlogSort> {

    int stick(@Param("uid") String uid);

    int deleteBatch(@Param("uids") List<String> uids);

    int updateSortByClickCount();
}
