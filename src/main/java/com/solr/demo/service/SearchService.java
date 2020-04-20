package com.solr.demo.service;



import com.solr.demo.DO.AppDbResourse;
import com.solr.demo.model.SearchParam;

import java.util.List;

public interface SearchService {

    List<AppDbResourse> searchAppDbResourseByPoint(SearchParam searchParam, String m_coreName, String title);

    List<AppDbResourse> searchAppDbResourseByPolygon(SearchParam searchParam, String m_coreName, String title);

}
