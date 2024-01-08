package com.lee.article.config;

import feign.RequestInterceptor;
import feign.RequestTemplate;
import io.seata.core.context.RootContext;

public class MultipartSupportConfig implements RequestInterceptor {

    /**
     * 解决服务直接调用请求头不传递的问题
     *
     * @param template
     */
    @Override
    public void apply(RequestTemplate template) {
        // 解决seata的xid未传递
        String xid = RootContext.getXID();
        template.header(RootContext.KEY_XID, xid);
    }
}
