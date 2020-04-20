package com.solr.demo.enums;

public enum CoreName {

    //庇护场所
    resoureArea("resoureArea"),
    //物资库
    resoureArticle("resoureArticle"),
    //防护目标
    resoureArticleStorehouse("resoureArticleStorehouse"),
    //救援队伍
    resoureProtectTarget("resoureProtectTarget"),
    //风险隐患
    resoureTeam("resoureTeam"),
    //监测预警相机
    riskCamera("riskCamera");

    private String coreName;

    CoreName(String coreName) {
        this.coreName = coreName;
    }

    public String getCoreName() {
        return coreName;
    }
}
