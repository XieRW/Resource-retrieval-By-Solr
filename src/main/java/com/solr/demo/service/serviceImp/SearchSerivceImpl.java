package com.solr.demo.service.serviceImp;

import com.solr.demo.DO.AppDbResourse;
import com.solr.demo.enums.CoreName;
import com.solr.demo.model.SearchParam;
import com.solr.demo.service.SearchService;
import com.solr.demo.SolrClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClassName: SearchSerivceImpl
 * Description: 空间搜索实现类
 *
 * @date: 2019年11月01日
 * @author xrw
 * @email 1429382875@qq.com
 */
@Service(value = "searchSerivceImpl")
public class SearchSerivceImpl implements SearchService {
    Logger logger = LoggerFactory.getLogger(SearchService.class);
    String coreName; // core名称

    @Value("${sajRisk.solr_url}")
    private String solrUrl;

    @Autowired
    SolrClient solrClient;

    @Override
    public List<AppDbResourse> searchAppDbResourseByPoint(SearchParam searchParam, String coreName,String title) {
        /**
         * solr中的数据属性名
         */
        String[] solrAttribute = new String[]{"id", "vcName", "x", "y", "vcAddress", "vcRemark", "GEO", "platformId"};
        /**
         * vo中的属性名
         */
        String[] beanAttribute = new String[]{"id", "vcName", "x", "y", "vcAddress", "vcRemark", "GEO", "platformId"};
        // 圆选条件，如有其筛选条件，必须放在此条件前面，否则其它条件不起作用
        Integer platformId = 1;
        /**
         * 配合shiro获取平台id，以便于分平台查询数据
         * 这里只是提供思路，将shiro或者security整合进来就可以实现数据权限的分离
         */
        // Integer platformId = ShiroUtils.getPlatformId();

        String criteria ="platformId: "+ platformId + " AND vcName: "+title+" AND"+" {!geofilt sfield=GEO pt=" + searchParam.getY() + "," + searchParam.getX() + " d="
                + searchParam.getRadius() + "}";
        if (coreName.equals(CoreName.resoureArticleStorehouse.getCoreName())){
            criteria = "(({!join from=storehouseId to=id fromIndex="+CoreName.resoureArticle.getCoreName()+"}vcName:"+title+" AND platformId: "+platformId
                    + ") OR vcName: "+title+") AND"+"{!geofilt sfield=GEO pt=" + searchParam.getY() + "," + searchParam.getX() + " d="
                    + searchParam.getRadius() + "}";
        }

        List<AppDbResourse> list = solrClient.getBeans(criteria, solrUrl+"/"+coreName, Integer.MAX_VALUE, 0, null, AppDbResourse.class,
                solrAttribute, beanAttribute, null);
        return list;
    }

    @Override
    public List<AppDbResourse> searchAppDbResourseByPolygon(SearchParam searchParam, String coreName, String title) {
        /**
         * solr中的数据属性名
         */
        String[] solrAttribute = new String[]{"id", "vcName", "x", "y", "vcAddress", "vcRemark", "GEO", "platformId"};
        /**
         * vo中的属性名
         */
        String[] beanAttribute = new String[]{"id", "vcName", "x", "y", "vcAddress", "vcRemark", "GEO", "platformId"};
        Integer platformId = 1;
        /**
         * 配合shiro获取平台id，以便于分平台查询数据
         * 这里只是提供思路，将shiro或者security整合进来就可以实现数据权限的分离
         */
        // Integer platformId = ShiroUtils.getPlatformId();
        //searchParam.getPolygon() 的示例
        // String test = "POLYGON((0 0,0 90,112 90,112 0,0 0))";
        String criteria ="platformId: "+ platformId +  " AND vcName: "+title+" AND"+" GEO:\"IsWithin(" + searchParam.getPolygon() + ")\" "; // 查询条件
        if (coreName.equals(CoreName.resoureArticleStorehouse.getCoreName())){
            criteria = "(({!join from=storehouseId to=id fromIndex="+CoreName.resoureArticle.getCoreName()+"}vcName:"+title+" AND platformId: "+platformId
                    + ") OR vcName: "+title+") AND platformId: " + platformId + " AND"+" GEO:\"IsWithin(" + searchParam.getPolygon() + ")\" ";
        }
        List<AppDbResourse> list = solrClient.getBeans(criteria, solrUrl+"/"+coreName, Integer.MAX_VALUE, 0, null, AppDbResourse.class,
                solrAttribute, beanAttribute, null);
        return list;
    }

//    @Override
//    public AppDbMaterialAddress searchEResourcesById(String id) {
//        // 获取solr实例
//        SolrClient solrClient = SolrClient.getInstance();
//        String criteria = " id:" + id + " ";
//        String[] solrAttribute = new String[] { "id", "erName", "teamNo", "teamType", "qualificationLevel",
//                "occupationType", "applicableIndustry", "specialtyType", "province", "city", "county", "townStreet",
//                "address", "competentUnit", "x", "y", "captainName", "headcount", "tatolAmbulance", "establishDate",
//                "personInCharge", "picPhone", "emergencyCall", "emergencyFax", "fullTimeStaff", "partTimeStaff",
//                "squadronCount", "smallTeamCount", "certificateNo", "issueDate", "validDate", "expirationDate",
//                "specialtyDescription", "gisRange", "serviceArea", "teamStatus", "mainEquipment",
//                "equipmentDescription", "remark" }; // solr中的数据属性名
//        String[] beanAttribute = new String[] { "id", "erName", "teamNo", "teamType", "qualificationLevel",
//                "occupationType", "applicableIndustry", "specialtyType", "province", "city", "county", "townStreet",
//                "address", "competentUnit", "x", "y", "captainName", "headcount", "tatolAmbulance", "establishDate",
//                "personInCharge", "picPhone", "emergencyCall", "emergencyFax", "fullTimeStaff", "partTimeStaff",
//                "squadronCount", "smallTeamCount", "certificateNo", "issueDate", "validDate", "expirationDate",
//                "specialtyDescription", "gisRange", "serviceArea", "teamStatus", "mainEquipment",
//                "equipmentDescription", "remark" }; // dto中的属性名
//
//        AppDbMaterialAddress appDbMaterialAddress = solrClient.getBean(criteria, coreName, null, AppDbMaterialAddress.class, solrAttribute,
//                beanAttribute);
//        return appDbMaterialAddress;
//    }

//    @Override
//    public Risk searchRiskById(String id) {
//        // 获取solr实例
//        SolrClient solrClient = SolrClient.getInstance();
//
//        String criteria = " id:" + id + " ";
//        String[] solrAttribute = new String[] { "id", "riskName", "reportingUnit", "createRiskDate", "rsDddName",
//                "rsDddChildName", "rcDddName", "dddChildName", "riskPersonInCharge", "riskPicPhone", "riskEmployerName",
//                "competentUnit", "riskLevel", "characteristicDddName", "riskParameter", "isHcFlag",
//                "hazardousChemicals", "isHcTechnologyFlag", "hcTechnology", "isChsFlag", "chsLevel", "mineSketch",
//                "affectedAreas", "influencePersonnel", "propertyLoss", "nvironmentImpact", "socialImpact", "province",
//                "city", "county", "townStreet", "address", "x", "y", "controlMeasure", "operatorId", "operDeptCode",
//                "fillPersonInCharge", "fpicPhone", "auditPerson", "isCheckFlag", "collectionWay", "matchingPrecision",
//                "isDeleted", "earlyWarningStatus", "ewDate", "remark", "createDate", "updateDate", "remarkInfo1",
//                "remarkInfo2", "remarkInfo3" }; // solr中的数据属性名
//        String[] beanAttribute = new String[] { "id", "riskName", "reportingUnit", "createRiskDate", "rsDddName",
//                "rsDddChildName", "rcDddName", "dddChildName", "riskPersonInCharge", "riskPicPhone", "riskEmployerName",
//                "competentUnit", "riskLevel", "characteristicDddName", "riskParameter", "isHcFlag",
//                "hazardousChemicals", "isHcTechnologyFlag", "hcTechnology", "isChsFlag", "chsLevel", "mineSketch",
//                "affectedAreas", "influencePersonnel", "propertyLoss", "nvironmentImpact", "socialImpact", "province",
//                "city", "county", "townStreet", "address", "x", "y", "controlMeasure", "operatorId", "operDeptCode",
//                "fillPersonInCharge", "fpicPhone", "auditPerson", "isCheckFlag", "collectionWay", "matchingPrecision",
//                "isDeleted", "earlyWarningStatus", "ewDate", "remark", "createDate", "updateDate", "remarkInfo1",
//                "remarkInfo2", "remarkInfo3" }; // dto中的属性名
//        String coreName = DistributionMapConstants.SEARCH_RISK_INFO_CORE; // core名称
//        Risk risk = solrClient.getBean(criteria, coreName, null, Risk.class, solrAttribute, beanAttribute);
//        return risk;
//    }


//    @Override
//    public List<Risk> searchRisksByPoint(SearchParam searchParam) {
//        SolrClient solrClient = SolrClient.getInstance(); // 获取solr实例
//
//        /* 当前用户信息 */
//        String operDeptCode = "";
//        if (null != ClientInfoFilter.getCurrentUserId()) {
//            operDeptCode = ClientInfoFilter.getCurrentUserDeptCode();
//        }
//        // 圆选条件，如有其筛选条件，必须放在此条件前面，否则其它条件不起作用
//        String criteria = " operDeptCode:" + operDeptCode + "* AND {!geofilt sfield=GEO pt=" + searchParam.getY() + ","
//                + searchParam.getX() + " d=" + searchParam.radii + "}";
//        String[] solrAttribute = new String[] { "id", "risk_name", "city", "create_risk_Date", "rs_ddd_name",
//                "risk_parameter", "risk_level", "address", "x", "y" }; // solr中的数据属性名
//        String[] beanAttribute = new String[] { "id", "riskName", "city", "createRiskDate", "rsDddName",
//                "riskParameter", "riskLevel", "address", "x", "y" }; // dto中的属性名
//        String coreName = DistributionMapConstants.SEARCH_RISK_INFO_CORE; // core名称
//
//        List<Risk> list = solrClient.getBeans(criteria, coreName, Integer.MAX_VALUE, 0, null, Risk.class, solrAttribute,
//                beanAttribute, null);
//        return list;
//    }


//
//    @Override
//    public List<Risk> searchRisksByPolygon(SearchParam searchParam) {
//        SolrClient solrClient = SolrClient.getInstance(); // 获取solr实例
//        /* 当前用户信息 */
//        String operDeptCode = "";
//        if (null != ClientInfoFilter.getCurrentUserId()) {
//            operDeptCode = ClientInfoFilter.getCurrentUserDeptCode();
//        }
//
//        String criteria = " operDeptCode:" + operDeptCode + "* AND GEO:\"IsWithin(" + searchParam.getPolygon() + ")\" "; // 查询条件
//        String[] solrAttribute = new String[] { "id", "risk_name", "city", "create_risk_Date", "rs_ddd_name",
//                "risk_parameter", "risk_level", "address", "x", "y" }; // solr中的数据属性名
//        String[] beanAttribute = new String[] { "id", "riskName", "city", "createRiskDate", "rsDddName",
//                "riskParameter", "riskLevel", "address", "x", "y" }; // dto中的属性名
//        String coreName = DistributionMapConstants.SEARCH_RISK_INFO_CORE; // core名称
//        List<Risk> list = solrClient.getBeans(criteria, coreName, Integer.MAX_VALUE, 0, null, Risk.class, solrAttribute,
//                beanAttribute, null);
//        return list;
//    }
//
//    @Override
//    public List<EResources> searchEResourcesByKeyword(SearchParam searchParam) {
//        SolrClient solrClient = SolrClient.getInstance(); // 获取solr实例
//        // 查询条件
//        StringBuffer criteria = new StringBuffer();
//        criteria.append(" ");
//        if (StringUtils.isNotEmpty(searchParam.getKeyWord())) {
//            String[] keywords = searchParam.getKeyWord().split(" ");
//            for (int i = 0; i < keywords.length; i++) {
//                if (i > 0) {
//                    criteria.append("AND");
//                }
//                criteria.append(" keyword:*" + keywords[i] + "* ");
//            }
//        }
//        String[] solrAttribute = new String[] { "id", "er_name", "city", "main_equipment", "person_in_charge",
//                "pic_phone", "address", "x", "y" }; // solr中的数据属性名
//        String[] beanAttribute = new String[] { "id", "erName", "city", "mainEquipment", "personInCharge", "picPhone",
//                "address", "x", "y" }; // dto中的属性名
//        String coreName = DistributionMapConstants.SEARCH_EMERGENCY_RESOURCES_CORE; // core名称
//        List<EResources> list = solrClient.getBeans(criteria.toString(), coreName, Integer.MAX_VALUE, 0, null,
//                EResources.class, solrAttribute, beanAttribute, null);
//        return list;
//    }
//
//    @Override
//    public List<Risk> searchRisksByKeyword(SearchParam searchParam) {
//        SolrClient solrClient = SolrClient.getInstance(); // 获取solr实例
//        /* 当前用户信息 */
//        String operDeptCode = "";
//        if (null != ClientInfoFilter.getCurrentUserId()) {
//            operDeptCode = ClientInfoFilter.getCurrentUserDeptCode();
//        }
//        // 查询条件
//        StringBuffer criteria = new StringBuffer();
//        criteria.append(" operDeptCode:" + operDeptCode + "* ");
//        if (StringUtils.isNotEmpty(searchParam.getKeyWord())) {
//            String[] keywords = searchParam.getKeyWord().split(" ");
//            for (String keyword : keywords) {
//                if (StringUtils.isEmpty(keyword)) {
//                    continue;
//                }
//                criteria.append(" AND keyword:*" + keyword + "* ");
//            }
//        }
//        String[] solrAttribute = new String[] { "id", "risk_name", "city", "create_risk_Date", "rs_ddd_name",
//                "risk_parameter", "risk_level", "address", "x", "y" }; // solr中的数据属性名
//        String[] beanAttribute = new String[] { "id", "riskName", "city", "createRiskDate", "rsDddName",
//                "riskParameter", "riskLevel", "address", "x", "y" }; // dto中的属性名
//        String coreName = DistributionMapConstants.SEARCH_RISK_INFO_CORE; // core名称
//        List<Risk> list = solrClient.getBeans(criteria.toString(), coreName, Integer.MAX_VALUE, 0, null, Risk.class,
//                solrAttribute, beanAttribute, null);
//        return list;
//    }
//
//    @Override
//    public List<Risk> searchRisksByKeyword(String searchParam) {
//        SolrClient solrClient = SolrClient.getInstance(); // 获取solr实例
//
//        // 查询条件
//        StringBuffer criteria = new StringBuffer();
//        criteria.append("rsDddName:*" + searchParam + "* ");
//
//        String[] solrAttribute = new String[] { "id", "rs_ddd_name", "x", "y" }; // solr中的数据属性名
//        String[] beanAttribute = new String[] { "id", "rsDddName", "x", "y" }; // dto中的属性名
//        String coreName = DistributionMapConstants.SEARCH_RISK_INFO_CORE; // core名称
//        List<Risk> list = solrClient.getBeans(criteria.toString(), coreName, Integer.MAX_VALUE, 0, null, Risk.class,
//                solrAttribute, beanAttribute, null);
//
//        return list;
//    }

}
