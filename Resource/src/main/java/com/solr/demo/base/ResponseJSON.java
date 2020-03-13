package com.solr.demo.base;

import com.alibaba.fastjson.JSONObject;
import com.solr.demo.utils.PageWrapper;
import org.springframework.data.domain.Page;

/**
 * @author xrw
 * @create 2019/11/01
 * @description 定义返回数据的标准格式
 */
public class ResponseJSON extends JSONObject {
    private static final long serialVersionUID = -4919743721058849685L;

    public ResponseJSON(){
        super.put("errorCode", 0);
        super.put("msg","success");
    }

    public ResponseJSON(String errorCode, String msg) {
        super.put("errorCode", errorCode);
        super.put("msg", msg);
    }

    public ResponseJSON(AppError appError){
        super.put("errorCode",appError.errorCode);
        super.put("msg",appError.msg);
    }

    public ResponseJSON(AppError appError, Object data) {
        super.put("errorCode", appError.errorCode);
        super.put("msg", appError.msg);
        super.put("data", data);
    }

    public ResponseJSON(Object data) {
        super.put("errorCode", 0);
        super.put("msg", "SUCCESS");
        if (data == null) {
            super.put("data", "");
            return;
        }
        super.put("data", data);
    }

    private Object preHandleData(Object data) {
        if (data instanceof Page) {
            return new PageWrapper<>((Page) data);
        } else {
            return data;
        }
    }
}
