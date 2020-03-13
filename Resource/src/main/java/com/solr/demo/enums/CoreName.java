package com.solr.demo.enums;

public enum CoreName {

    //庇护场所
    appDbDisasterShelter("appDbDisasterShelter"),
    //物资库
    appDbMaterialAddress("appDbMaterialAddress"),
    //防护目标
    appDbProtectionobject("appDbProtectionobject"),
    //救援队伍
    appDbTeam("appDbTeam"),
    //风险隐患
    appDbRisk("appDbRisk");

    private String coreName;

    CoreName(String coreName) {
        this.coreName = coreName;
    }

    public String getCoreName() {
        return coreName;
    }
}
