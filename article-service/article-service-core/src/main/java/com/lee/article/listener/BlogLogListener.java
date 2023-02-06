package com.lee.article.listener;

import com.lee.common.message.PlacePayEvent;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**
 * @Author: liyansong
 * @Date: 2023/1/31 21:17
 * @Version: 1.0
 */
@Slf4j
@Service
public class BlogLogListener {

    @EventListener
    @Async("asyncExecutor")
    public void orderLog(PlacePayEvent event) {
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        log.info("[afterPlacePay] log.");
    }
}
