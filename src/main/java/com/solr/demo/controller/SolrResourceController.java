package com.solr.demo.controller;

import com.solr.demo.DO.AppDbResourse;
import com.solr.demo.base.ResponseJSON;
import com.solr.demo.enums.CoreName;
import com.solr.demo.model.SearchParam;
import com.solr.demo.service.SearchService;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

/**
 * solr资源检索
 * @date 2020/03/12
 * @author xrw
 */
@Log
@RestController
@RequestMapping("/solr/resource")
public class SolrResourceController {
    @Autowired
    SearchService searchService;

    @RequestMapping("/searchSourceByPoint")
    public ResponseJSON searchSourceByPoint(@RequestParam("x") Double x,
                                            @RequestParam("y") Double y,
                                            @RequestParam("radius") Double radius,
                                            @RequestParam("title") String title,
                                            @RequestParam("resoureArea") Boolean resoureArea,
                                            @RequestParam("resoureArticleStorehouse") Boolean resoureArticleStorehouse,
                                            @RequestParam("resoureProtectTarget") Boolean resoureProtectTarget,
                                            @RequestParam("resoureTeam") Boolean resoureTeam,
                                            @RequestParam("riskCamera") Boolean riskCamera){

        SearchParam searchParam;
        //参数不为空时，构建查询对象
        if (x != null && y != null && radius != null) {
            searchParam = new SearchParam(x, y, radius);
        } else {//为空时返回错误码
            return new ResponseJSON("500","参数为空！");
        }
        String q_title;
        if (title !=null && !"".equals(title)){
            q_title = ""+title+"";
        }else {
            q_title = "*";
        }
        Map<String, Object> reSoureseMap = new HashMap<>();
        //是否查找庇护场所
        if (resoureArea) {
            List<AppDbResourse> appDbDisasterShelter = searchService.searchAppDbResourseByPoint(searchParam, CoreName.resoureArea.getCoreName(),q_title);
            reSoureseMap.put("resoureArea", appDbDisasterShelter);
        }
        //是否查找物资库
        if (resoureArticleStorehouse) {
            List<AppDbResourse> appDbMaterialAddress = searchService.searchAppDbResourseByPoint(searchParam, CoreName.resoureArticleStorehouse.getCoreName(),q_title);
            reSoureseMap.put("resoureArticleStorehouse", appDbMaterialAddress);
        }
        //是否查找防护目标
        if (resoureProtectTarget) {
            List<AppDbResourse> appDbProtectionobject = searchService.searchAppDbResourseByPoint(searchParam, CoreName.resoureProtectTarget.getCoreName(),q_title);
            reSoureseMap.put("resoureProtectTarget", appDbProtectionobject);
        }
        //是否查找救援队伍
        if (resoureTeam) {
            List<AppDbResourse> appDbTeam = searchService.searchAppDbResourseByPoint(searchParam, CoreName.resoureTeam.getCoreName(),q_title);
            reSoureseMap.put("resoureTeam", appDbTeam);
        }
        //是否查找监测预警相机
        if (riskCamera) {
            List<AppDbResourse> riskCameraResource = searchService.searchAppDbResourseByPoint(searchParam, CoreName.riskCamera.getCoreName(),q_title);
            reSoureseMap.put("riskCamera", riskCameraResource);
        }
        return new ResponseJSON(reSoureseMap);
    }

    /**
     * 框选
     * @param points 多边形坐标参数；参数示例：POLYGON((经度 纬度,经度 纬度,......))；备注：（第一组经纬度和最后一组相同）
     * @param title
     * @param resoureArea
     * @param resoureArticleStorehouse
     * @param resoureProtectTarget
     * @param resoureTeam
     * @return
     */
    @RequestMapping("/searchSourceByPolygon")
    public ResponseJSON searchSourceByPolygon(@RequestParam("points") String points,
                                             @RequestParam("title") String title,
                                             @RequestParam("resoureArea") Boolean resoureArea,
                                             @RequestParam("resoureArticleStorehouse") Boolean resoureArticleStorehouse,
                                             @RequestParam("resoureProtectTarget") Boolean resoureProtectTarget,
                                             @RequestParam("resoureTeam") Boolean resoureTeam,
                                             @RequestParam("riskCamera") Boolean riskCamera){
        SearchParam searchParam;
        //参数不为空时，构建查询对象
        if (points != null) {
            searchParam = new SearchParam(points);
        } else {//为空时返回错误码
            return new ResponseJSON("500","参数为空！");
        }
        String q_title;
        if (title !=null && !"".equals(title)){
            q_title = ""+title+"";
        }else {
            q_title = "*";
        }
        Map<String, Object> reSoureseMap = new HashMap<>(16);
        //是否查找庇护场所
        if (resoureArea) {
            List<AppDbResourse> appDbDisasterShelter = searchService.searchAppDbResourseByPolygon(searchParam, CoreName.resoureArea.getCoreName(),q_title);
            reSoureseMap.put("resoureArea", appDbDisasterShelter);
        }
        //是否查找物资库
        if (resoureArticleStorehouse) {
            List<AppDbResourse> appDbMaterialAddress = searchService.searchAppDbResourseByPolygon(searchParam, CoreName.resoureArticleStorehouse.getCoreName(),q_title);
            reSoureseMap.put("resoureArticleStorehouse", appDbMaterialAddress);
        }
        //是否查找防护目标
        if (resoureProtectTarget) {
            List<AppDbResourse> appDbProtectionobject = searchService.searchAppDbResourseByPolygon(searchParam, CoreName.resoureProtectTarget.getCoreName(),q_title);
            reSoureseMap.put("resoureProtectTarget", appDbProtectionobject);
        }
        //是否查找救援队伍
        if (resoureTeam) {
            List<AppDbResourse> appDbTeam = searchService.searchAppDbResourseByPolygon(searchParam, CoreName.resoureTeam.getCoreName(),q_title);
            reSoureseMap.put("resoureTeam", appDbTeam);
        }
        //是否查找监测预警相机
        if (riskCamera) {
            List<AppDbResourse> riskCameraResource = searchService.searchAppDbResourseByPolygon(searchParam, CoreName.riskCamera.getCoreName(),q_title);
            reSoureseMap.put("riskCamera", riskCameraResource);
        }
        return new ResponseJSON(reSoureseMap);
    }

}
