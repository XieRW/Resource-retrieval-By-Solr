package com.solr.demo.base;

/**
 * @author xrw
 * @create 2019/11/01
 * @description 请求异常返回错误数据
 */
public enum AppError {
    //============错误返回数据=============
    /**
     * 登录异常
     */
    PASSWORD_INCONSISTENCIES("10000", "密码不一致"),
    LOGIN_ERROR("10001", "用户名不存在"),
    NOT_LOGIN("10002", "未登录，禁止访问"),
    SIGN_ERROR("10003", "签名错误"),
    LOGIN_EXPIRED("10004", "登录失效"),
    LOGIN_AUTHENTICATION_ERROR("10005", "登陆信息认证失败"),
    INTERFACE_UNPREMITTED("10006", "无访问权限"),
    EDITUSER_ERROR("10007","原始密码错误"),
    ERROR("1008","请求异常"),
    LOGIN_RESTRICTION("10009","错误次数超过5次,您已被限制登录5分钟"),
    TOKEN_LOGIN_ERROR("10010","身份认证信息失效"),

    /**
     * 接口异常
     */
    PARAM_NULL_ERROR("20001","参数为空");

    public String errorCode;
    public String msg;

     AppError(String errorCode, String msg) {
        this.errorCode = errorCode;
        this.msg = msg;
    }
}
