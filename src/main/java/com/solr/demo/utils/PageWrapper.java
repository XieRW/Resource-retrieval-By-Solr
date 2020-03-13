package com.solr.demo.utils;
import org.springframework.data.domain.Page;

import java.util.List;

/**
 * 分页
 * @author xrw
 * @date 2019/3/26
 * @param  * @param null
 * @return
 */
public class PageWrapper<T> {

    private Page<T> page;

    public PageWrapper(Page<T> page) {
        this.page = page;
    }

    public int getTotalPages() {
        return page.getTotalPages();
    }

    public long getTotalElements() {
        return page.getTotalElements();
    }

    public List<T> getData() {
        return page.getContent();
    }

}
