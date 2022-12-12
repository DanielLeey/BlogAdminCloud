package com.lee.common.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ArticleDTO {

    private Long id;
    /**
     * 标题
     * es:可根据ik分词器查找
     */
    private String title;
}
