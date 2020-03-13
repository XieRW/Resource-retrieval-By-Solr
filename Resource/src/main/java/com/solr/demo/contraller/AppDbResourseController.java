/**
 * Project Name: solr
 * Package Name:com.solr.demo.contraller
 * File Name:AppDbResourseController.java
 * Data:2019年11月1日
 */
package com.solr.demo.contraller;

import com.solr.demo.DO.AppDbResourse;
import com.solr.demo.base.AppError;
import com.solr.demo.base.ResponseJSON;
import com.solr.demo.enums.CoreName;
import com.solr.demo.model.SearchParam;
import com.solr.demo.service.SearchService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author xrw
 * @create 2019/11/01
 * @description 提供solr的appDbMaterialAddress这个core的读写操作API
 */
@RestController
@RequestMapping("/solr/EmplusResources")
public class AppDbResourseController {
    Logger logger = LoggerFactory.getLogger(AppDbResourseController.class);
    @Autowired
    SearchService searchService;

    /**
     * 应急资源圆选：根据圆心处经纬度、半径查找圈内所有应急资源
     * @param x 经度
     * @param y 纬度
     * @param radius 半径，单位公里
     * @param b_appDbDisasterShelter 是否查找庇护场所
     * @param b_appDbMaterialAddress 是否查找物资库
     * @param b_appDbProtectionobject 是否查找防护目标
     * @param b_appDbRisk 是否查找风险隐患
     * @param b_appDbTeam 是否查找救援队伍
     * @return
     */
    @RequestMapping("/searchAppDbResourseByPoint")
    public ResponseJSON searchAppDbResourseByPoint(@RequestParam("x") Double x,
                                                   @RequestParam("y") Double y,
                                                   @RequestParam("radius") Double radius,
                                                   @RequestParam("appDbDisasterShelter") Boolean b_appDbDisasterShelter,
                                                   @RequestParam("appDbMaterialAddress") Boolean b_appDbMaterialAddress,
                                                   @RequestParam("appDbProtectionobject") Boolean b_appDbProtectionobject,
                                                   @RequestParam("appDbRisk") Boolean b_appDbRisk,
                                                   @RequestParam("appDbTeam") Boolean b_appDbTeam) {
        SearchParam searchParam;
        //参数不为空时，构建查询对象
        if (x != null && y != null && radius != null) {
            searchParam = new SearchParam(x, y, radius);
        } else {//为空时返回错误码
            return new ResponseJSON(AppError.PARAM_NULL_ERROR);
        }
        Map<String, Object> reSoureseMap = new HashMap<>();
        //是否查找庇护场所
        if (b_appDbDisasterShelter) {
            List<AppDbResourse> appDbDisasterShelter = searchService.searchAppDbResourseByPoint(searchParam, CoreName.appDbDisasterShelter.getCoreName());
            reSoureseMap.put("appDbDisasterShelter", appDbDisasterShelter);
        }
        //是否查找物资库
        if (b_appDbMaterialAddress) {
            List<AppDbResourse> appDbMaterialAddress = searchService.searchAppDbResourseByPoint(searchParam, CoreName.appDbMaterialAddress.getCoreName());
            reSoureseMap.put("appDbMaterialAddress", appDbMaterialAddress);
        }
        //是否查找防护目标
        if (b_appDbProtectionobject) {
            List<AppDbResourse> appDbProtectionobject = searchService.searchAppDbResourseByPoint(searchParam, CoreName.appDbProtectionobject.getCoreName());
            reSoureseMap.put("appDbProtectionobject", appDbProtectionobject);
        }
        //是否查找风险隐患
        if (b_appDbRisk) {
            List<AppDbResourse> appDbRisk = searchService.searchAppDbResourseByPoint(searchParam, CoreName.appDbRisk.getCoreName());
            reSoureseMap.put("appDbRisk", appDbRisk);
        }
        //是否查找救援队伍
        if (b_appDbTeam) {
            List<AppDbResourse> appDbTeam = searchService.searchAppDbResourseByPoint(searchParam, CoreName.appDbTeam.getCoreName());
            reSoureseMap.put("appDbTeam", appDbTeam);
        }
        ResponseJSON responseJSON = new ResponseJSON();
        responseJSON.put("data", reSoureseMap);
        logger.info("searchAppDbResourseByPoint success!");
        return responseJSON;
    }

    /**
     * 应急资源框选：用一组闭环的坐标画一个多边形，将处于多边形内的应急资源返回给前端
     * @param points 多边形坐标参数；参数示例：POLYGON((经度 纬度,经度 纬度,......))；备注：（第一组经纬度和最后一组相同）
     * @param b_appDbDisasterShelter 是否查询庇护场所
     * @param b_appDbMaterialAddress 是否查询救援物资库
     * @param b_appDbProtectionobject 是否查询防护目标
     * @param b_appDbRisk 是否查询救援队伍
     * @param b_appDbTeam 是否查询风险隐患
     * @return
     */
    @RequestMapping("/searchAppDbResourseByPolygon")
    public ResponseJSON searchAppDbResourseByPolygon(@RequestParam("points") String points,
                                                     @RequestParam("appDbDisasterShelter") Boolean b_appDbDisasterShelter,
                                                     @RequestParam("appDbMaterialAddress") Boolean b_appDbMaterialAddress,
                                                     @RequestParam("appDbProtectionobject") Boolean b_appDbProtectionobject,
                                                     @RequestParam("appDbRisk") Boolean b_appDbRisk,
                                                     @RequestParam("appDbTeam") Boolean b_appDbTeam) {
        SearchParam searchParam;
        //参数不为空时，构建查询对象
        if (points != null) {
            searchParam = new SearchParam(points);
        } else {//为空时返回错误码
            return new ResponseJSON(AppError.PARAM_NULL_ERROR);
        }
        Map<String, Object> reSoureseMap = new HashMap<>();
        //是否查找庇护场所
        if (b_appDbDisasterShelter) {
            List<AppDbResourse> appDbDisasterShelter = searchService.searchAppDbResourseByPolygon(searchParam, CoreName.appDbDisasterShelter.getCoreName());
            reSoureseMap.put("appDbDisasterShelter", appDbDisasterShelter);
        }
        //是否查找物资库
        if (b_appDbMaterialAddress) {
            List<AppDbResourse> appDbMaterialAddress = searchService.searchAppDbResourseByPolygon(searchParam, CoreName.appDbMaterialAddress.getCoreName());
            reSoureseMap.put("appDbMaterialAddress", appDbMaterialAddress);
        }
        //是否查找防护目标
        if (b_appDbProtectionobject) {
            List<AppDbResourse> appDbProtectionobject = searchService.searchAppDbResourseByPolygon(searchParam, CoreName.appDbProtectionobject.getCoreName());
            reSoureseMap.put("appDbProtectionobject", appDbProtectionobject);
        }
        //是否查找风险隐患
        if (b_appDbRisk) {
            List<AppDbResourse> appDbRisk = searchService.searchAppDbResourseByPolygon(searchParam, CoreName.appDbRisk.getCoreName());
            reSoureseMap.put("appDbRisk", appDbRisk);
        }
        //是否查找救援队伍
        if (b_appDbTeam) {
            List<AppDbResourse> appDbTeam = searchService.searchAppDbResourseByPolygon(searchParam, CoreName.appDbTeam.getCoreName());
            reSoureseMap.put("appDbTeam", appDbTeam);
        }
        ResponseJSON responseJSON = new ResponseJSON();
        responseJSON.put("data", reSoureseMap);
        logger.info("searchAppDbResourseByPolygon success!");
        return responseJSON;
    }
}
