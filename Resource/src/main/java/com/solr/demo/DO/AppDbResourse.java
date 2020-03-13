package com.solr.demo.DO;

/**
 * @author xrw
 * @create 2019/11/01
 * 资源抽象实体实体
 */
public class AppDbResourse {

    private String id;
    private String vcName;
    private String x;
    private String y;
    private String vcAddress;
    private String vcRemark;
    private String GEO;

    public String getid() { return id; }

    public void setid(String id) { this.id = id; }

    public String getVcName() { return vcName; }

    public void setVcName(String vcName) { this.vcName = vcName; }

    public String getX() { return x; }

    public void setX(String x) { this.x = x; }

    public String getY() { return y; }

    public void setY(String y) { this.y = y; }

    public String getVcAddress() { return vcAddress; }

    public void setVcAddress(String vcAddress) { this.vcAddress = vcAddress; }

    public String getVcRemark() { return vcRemark; }

    public void setVcRemark(String vcRemark) { this.vcRemark = vcRemark; }

    public String getGEO() { return GEO; }

    public void setGEO(String GEO) { this.GEO = GEO; }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AppDbResourse that = (AppDbResourse) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (vcName != null ? !vcName.equals(that.vcName) : that.vcName != null) return false;
        if (x != null ? !x.equals(that.x) : that.x != null) return false;
        if (y != null ? !y.equals(that.y) : that.y != null) return false;
        if (vcAddress != null ? !vcAddress.equals(that.vcAddress) : that.vcAddress != null) return false;
        if (vcRemark != null ? !vcRemark.equals(that.vcRemark) : that.vcRemark != null) return false;
        if (GEO != null ? !GEO.equals(that.GEO) : that.GEO != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (vcName != null ? vcName.hashCode() : 0);
        result = 31 * result + (x != null ? x.hashCode() : 0);
        result = 31 * result + (y != null ? y.hashCode() : 0);
        result = 31 * result + (vcAddress != null ? vcAddress.hashCode() : 0);
        result = 31 * result + (vcRemark != null ? vcRemark.hashCode() : 0);
        result = 31 * result + (GEO != null ? GEO.hashCode() : 0);
        return result;
    }
}