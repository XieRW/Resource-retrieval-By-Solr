/**
 * Copyright (c) 2017,Finest. 
 * All Rights Reserved.
 * Finest CONFIDENTIAL
 * 
 * Project Name:sajrisk
 * Package Name:com.finest.sajrisk.webservice
 * File Name:SolrClient.java
 * Date:2017年2月9日 下午2:08:19
 * 
 */
package com.solr.demo;

import org.apache.commons.lang3.StringUtils;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrRequest;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.request.QueryRequest;
import org.apache.solr.client.solrj.response.FacetField;
import org.apache.solr.client.solrj.response.FacetField.Count;
import org.apache.solr.client.solrj.response.Group;
import org.apache.solr.client.solrj.response.GroupCommand;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.client.solrj.response.TermsResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.apache.solr.common.util.NamedList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

/**
 * ClassName: SolrClient <br/>
 * Description: solr查询方法封装类 <br/>
 * Date: 2017年2月9日 下午2:08:19 <br/>
 * <br/>
 * 
 * @author wujw
 * 
 *         修改记录
 * @version 1.0.0 2017年2月9日 wujw Initial Version<br/>
 */
public class SolrClient {

    private Logger log = LoggerFactory.getLogger(SolrClient.class);

    /**
     * SolrClient实例对象
     */
    private static SolrClient mInstance;

    /**
     * ID唯一标识
     */
    public static final String ID = "id";

    /**
     * solr服务哈希表，key为core名称，value为HttpSolrServer对象
     */
    private HashMap<String, SolrServer> solrServers = new HashMap<String, SolrServer>();

    /**
     * UTF-8编码
     */
    public static final String UTF8_CHARSET_NAME = "UTF-8";

    /**
     * solr的url key值
     */
    private static  String SOLR_URL_KEY = "sajRisk.solr_url";

//    @Value("${spring.data.solr.host}")
//    public void setSOLRURLKEY(String SOLR_URL_KEY){
//        SolrClient.SOLR_URL_KEY = SOLR_URL_KEY;
//    }

    /**
     * 拆分词组URL，用于拆分词组
     */
    public static final String URL_SPLIT_WORDS = "splitwords";

    /**
     * 代码词组的URL，用于根据代码得到标准词组
     */
    public static final String URL_CODE_WORDS = "codewords";

    /**
     * 日期格式
     */
    private static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    /** 字段业务名称--标准地址名称 */
    public static final String FIELD_AC_STANDARD_ADDR_NAME = "AC_STANDARD_ADDR_NAME";

    /** 字段业务名称--标准地址名称(字符串类型)，冗余字段类型，用于ALL查询 */
    public static final String FIELD_AC_STANDARD_ADDR_NAME_S = "AC_STANDARD_ADDR_NAME_S";

    /** 注解字段常量--otherFields */
    public static final String ANNOTATION_OTHERFIELDS = "otherFields";

    /**
     * 获取solrClient单一实例
     * 
     * @return
     */
    public static SolrClient getInstance() {
        if (mInstance == null) {
            synchronized (SolrClient.class) {
                if (mInstance == null) {
                    mInstance = new SolrClient();
                }
            }
        }
        return mInstance;
    }

    /**
     * 根据core名称得到SolrServer对象，如果不存在，就创建
     * 
     * @param core
     *            solr的core名称
     * @return
     */
    public SolrServer getSolrServer(String core) {
        if (solrServers.containsKey(core)) {
            return solrServers.get(core);
        }

        Properties props = new Properties();
        InputStream resourceStream = SolrClient.class.getClassLoader().getResourceAsStream("application.properties");
        try {
            props.load(resourceStream);
        } catch (IOException e1) {
            getLogger().error("SolrClient.getProperties() - Failed to load properties file", e1);
        }

        String solrCoreUrl = props.getProperty(SOLR_URL_KEY) + "/" + core;
        SolrServer solrServer;
        try {
            solrServer = new HttpSolrServer(solrCoreUrl);
            solrServer.ping();
            solrServers.put(core, solrServer);
            return solrServer;
        } catch (Throwable e) {
            log.error("SolrClient.getSolrServer() - Failed to connect:" + solrCoreUrl, e);
        }
        return null;
    }

    /**
     * 获取得到SolrDocument的数据列表
     * 
     * @param criteria
     *            查询条件
     * @param coreName
     *            core的名称
     * @param rows
     *            查询条数
     * @param start
     *            开始查询的位置
     * @param sortParams
     *            排序参数，以逗号隔开。如id desc,name desc
     * @return
     */
    public List<SolrDocument> getDocs(String criteria, String coreName, int rows, int start, String sortParams) {
        List<SolrDocument> docs = new ArrayList<SolrDocument>();
        if (StringUtils.isNotEmpty(criteria) && StringUtils.isNotEmpty(coreName)) {
            SolrServer solrServer = getSolrServer(coreName);
            SolrQuery solrQuery = new SolrQuery().setQuery(criteria).setRows(rows).setStart(start);
            this.setSortParams(sortParams, solrQuery);
            QueryRequest queryRequest = new QueryRequest(solrQuery);
            queryRequest.setMethod(SolrRequest.METHOD.POST);
            try {
                QueryResponse response = queryRequest.process(solrServer);
                if (response.getResults() != null) {
                    docs.addAll(response.getResults());
                }
            } catch (SolrServerException e) {
                log.error("SolrClient.getDocs() - Failed to QueryResponse:", e);
                throw new RuntimeException(e);
            }
        }
        return docs;
    }

    /**
     * 获取得到SolrDocument的数据列表<br>
     * 使用场景：<br>
     * 1.当没有过滤显示字段数组，直接返回所有solr原始字段的SolrDocument数据。<br>
     * 2.当有过滤显示字段数组并且没有过滤显示字段别名数组，返回过滤字段后的solr原始字段的SolrDocument数据。<br>
     * 3.当有过滤显示字段数组并且有过滤显示字段别名数组，长度顺序一致，返回过滤字段后的以别名为key的SolrDocument数据。<br>
     * 4.当有过滤显示字段数组并且有过滤显示字段别名数组，顺序一致，但长度不一致，即有部分设置别名，有部分没有设置别名，返回过滤字段后，
     * 有别名的以别名为key、没有别名的以字段名为key的SolrDocument数据。<br>
     * 
     * @param criteria
     *            查询条件
     * @param coreName
     *            core的名称
     * @param rows
     *            查询条数
     * @param start
     *            开始查询的位置
     * @param sortParams
     *            排序参数，以逗号隔开。如id desc,name desc
     * @param fields
     *            过滤显示字段数组，如果设置，只显示数组内的字段，数组为空，显示全部
     * @param aliasFields
     *            过滤显示字段别名数组，数组的顺序与fields字段数组的顺序一一对应，长度可不相同，当不相同时，
     *            取回fields对应的字段名为别名
     * @param filterQueryParams
     *            过滤查询条件，例如权重条件设置：a^2 b^0.3 c^1
     * @param facetParams
     *            分组参数数组
     * @return
     */
    public List<SolrDocument> getDocs(String criteria, String coreName, int rows, int start, String sortParams,
            String[] fields, String[] aliasFields, String filterQueryParams, String[] facetParams) throws Exception {
        // TODO facetParams分组参数数组，目前仅支持单个分组，暂时未支持多个分组。
        // TODO
        // 当有facetParams时，并且有aliasFields，此时的aliasFields别名数组对应的是facetParams分组参数数组的别名。
        List<SolrDocument> docs = new ArrayList<SolrDocument>();
        if (StringUtils.isNotEmpty(criteria) && StringUtils.isNotEmpty(coreName)) {
            SolrServer solrServer = getSolrServer(coreName);
            SolrQuery solrQuery = new SolrQuery().setQuery(criteria).setRows(rows).setStart(start);
            // 由于分组结果和普通结果分开，如果有分组参数，则不再查询普通结果
            if (facetParams == null || facetParams.length <= 0) {
                this.setSortParams(sortParams, solrQuery);
                this.setFieldListParams(fields, aliasFields, solrQuery);
                this.setFilterQueryParams(filterQueryParams, solrQuery);
            } else {
                solrQuery.setRows(0);
                solrQuery.setStart(0);
                this.setFacetParams(facetParams, aliasFields, solrQuery);
            }
            QueryRequest queryRequest = new QueryRequest(solrQuery);
            queryRequest.setMethod(SolrRequest.METHOD.POST);
            try {
                QueryResponse response = queryRequest.process(solrServer);
                // 判断分组参数是否为空
                if (facetParams == null || facetParams.length <= 0) {
                    if (response.getResults() != null) {
                        docs.addAll(response.getResults());
                    }
                } else {
                    // 根据分组结果，设置返回值
                    if (response.getFacetFields() != null) {
                        List<FacetField> facetFields = response.getFacetFields();
                        SolrDocument doc = null;
                        // TODO facetParams分组参数数组，目前仅支持单个分组，暂时未支持多个分组。
                        // 别名处理
                        String facetFieldkey = facetParams[0].trim();
                        String countFieldkey = "count"; // 默认值
                        if (aliasFields != null && aliasFields.length > 0) {
                            facetFieldkey = aliasFields[0] == null ? facetFieldkey : aliasFields[0].trim();
                            if (aliasFields.length > 1) {
                                countFieldkey = aliasFields[1] == null ? facetFieldkey : aliasFields[1].trim();
                            }
                        }

                        for (FacetField facetField : facetFields) {
                            for (Count count : facetField.getValues()) {
                                doc = new SolrDocument();
                                doc.addField(facetFieldkey, count.getName());
                                doc.addField(countFieldkey, count.getCount());
                                docs.add(doc);
                            }
                        }
                    }
                }
            } catch (SolrServerException e) {
                String error = "solr工具类-获取得到SolrDocument的数据列表方法出现异常！";
                log.error(error, e);
                throw new SolrServerException(e);
            }
        }
        return docs;
    }

    /**
     * 获取得到对象化的数据列表
     * 
     * @param criteria
     *            查询条件
     * @param coreName
     *            core的名称
     * @param rows
     *            查询条数
     * @param start
     *            开始查询的位置
     * @param sortParams
     *            排序参数，以逗号隔开。如id desc,name desc
     * @param clazz
     *            要转换对象的Class
     * @return
     */
    public <T extends Object> List<T> getBeans(String criteria, String coreName, int rows, int start, String sortParams,
            Class<T> clazz) {
        if (StringUtils.isNotEmpty(criteria) && StringUtils.isNotEmpty(coreName)) {
            SolrServer solrServer = getSolrServer(coreName);
            SolrQuery solrQuery = new SolrQuery().setQuery(criteria).setRows(rows).setStart(start);
            this.setSortParams(sortParams, solrQuery);
            QueryRequest queryRequest = new QueryRequest(solrQuery);
            queryRequest.setMethod(SolrRequest.METHOD.POST);
            try {
                QueryResponse response = queryRequest.process(solrServer);
                if (response.getResults() != null) {
                    return response.getBeans(clazz);
                }
            } catch (SolrServerException e) {
                e.printStackTrace();
            }
        }
        return Collections.emptyList();
    }

    /**
     * 获取得到对象化的数据列表<br>
     * 使用场景：<br>
     * 1.当没有过滤显示字段数组，转换对象的Class注解有@Field关联字段值进行映射，返回对象数据列表。<br>
     * 2.当有过滤显示字段数组并且没有过滤显示字段别名数组，过滤字段后，转换对象的Class注解有@Field关联字段值进行映射，返回对象数据列表。
     * <br>
     * 3.当有过滤显示字段数组并且有过滤显示字段别名数组，不需要转换对象的Class注解有@Field字段：<br>
     * 1)长度顺序一致，即都设置有别名情况下，设置对应的别名，并且能找到与别名名称相同的转换对象Class的属性名，通过反射直接赋值。<br>
     * 2)顺序一致，但长度不一致，即有部分设置别名，有部分没有设置别名，设置对应的别名，并且能找到与别名名称相同的转换对象Class的属性名，
     * 通过反射直接赋值，找不到相同的属性名则不做赋值处理。<br>
     * 
     * @param criteria
     *            查询条件
     * @param coreName
     *            core的名称
     * @param rows
     *            查询条数
     * @param start
     *            开始查询的位置
     * @param sortParams
     *            排序参数，以逗号隔开。如id desc,name desc
     * @param clazz
     *            要转换对象的Class
     * @param fields
     *            过滤显示字段数组，如果设置，只显示数组内的字段，数组为空，显示全部
     * @param aliasFields
     *            过滤显示字段别名数组，数组的顺序与fields字段数组的顺序一一对应，长度可不相同，当不相同时，
     *            取回fields对应的字段名为别名，并且返回对象的属性名与别名一致。
     * @param filterQueryParams
     *            过滤查询条件，例如权重条件设置：a^2 b^0.3 c^1
     * @return
     */
    public <T extends Object> List<T> getBeans(String criteria, String coreName, int rows, int start, String sortParams,
            Class<T> clazz, String[] fields, String[] aliasFields, String filterQueryParams) {
        if (StringUtils.isNotEmpty(criteria) && StringUtils.isNotEmpty(coreName)) {
            SolrServer solrServer = getSolrServer(coreName);
            SolrQuery solrQuery = new SolrQuery().setQuery(criteria).setRows(rows).setStart(start);
            this.setSortParams(sortParams, solrQuery);
            this.setFieldListParams(fields, aliasFields, solrQuery);
            this.setFilterQueryParams(filterQueryParams, solrQuery);
            QueryRequest queryRequest = new QueryRequest(solrQuery);
            queryRequest.setMethod(SolrRequest.METHOD.POST);
            try {
                QueryResponse response = queryRequest.process(solrServer);

                if (response.getResults() != null) {
                    // 如果设置有别名，根据转换对象的Class，通过反射设置得到对应的转换对象列表，并返回
                    // 如果没有设置别名，返回solr原始getBeans方法得到的对象列表值。该getBeans方法是通过注解的方'式设置映射关系
                    if (fields != null && fields.length > 0 && aliasFields != null && aliasFields.length > 0) {
                        return this.getBeansByDocsAndClazz(response.getResults(), clazz);
                    } else {
                        return response.getBeans(clazz);
                    }
                }
            } catch (SolrServerException e) {
                e.printStackTrace();
            }
        }
        return Collections.emptyList();
    }

    /**
     * 获取得到对象化的数据列表<br>
     * 使用场景：<br>
     * 1.当fieldsMap字段Map为空，以转换对象的Class注解有@Field关联字段值进行映射，返回对象数据列表。<br>
     * 2.当fieldsMap字段Map不为空情况下，不需要转换对象的Class注解有@Field字段：<br>
     * 1)所有键与值都有值，即都设置有别名情况下，设置对应的别名，并且能找到与别名名称相同的转换对象Class的属性名，通过反射直接赋值。<br>
     * 2)转换对象的Class注解有@Field("otherFields")的Map属性，所有找不到别名名称相同的转换对象Class的属性名，
     * 把那些没有设置到属性里的值，全部加入到注解有@Field( "otherFields")的Map对象中<br>
     * 3)如果没有找到注解有@Field("otherFields")的Map，所有找不到别名名称相同的转换对象Class的属性名，
     * 把那些没有设置到属性里的值全部丢弃掉<br>
     * 
     * @param criteria
     *            查询条件
     * @param coreName
     *            core的名称
     * @param rows
     *            查询条数
     * @param start
     *            开始查询的位置
     * @param sortParams
     *            排序参数，以逗号隔开。如id desc,name desc
     * @param clazz
     *            要转换对象的Class
     * @param fieldsMap
     *            字段Map，key为字段名，value为字段别名，别名可以为空，取回key对应的字段名为别名
     * @param filterQueryParams
     *            过滤查询条件，例如权重条件设置：a^2 b^0.3 c^1
     * @return
     */
    public <T extends Object> List<T> getBeans(String criteria, String coreName, int rows, int start, String sortParams,
            Class<T> clazz, Map<String, String> fieldsMap, String filterQueryParams) {
        if (StringUtils.isNotEmpty(criteria) && StringUtils.isNotEmpty(coreName)) {
            SolrServer solrServer = getSolrServer(coreName);
            SolrQuery solrQuery = new SolrQuery().setQuery(criteria).setRows(rows).setStart(start);
            this.setSortParams(sortParams, solrQuery);
            // 通过字段map，得到字段名数组和别名数组，并设置
            if (fieldsMap != null) {
                // 字段名拼接字符串，字段名之间以逗号隔开
                StringBuilder fieldsSb = new StringBuilder();
                // 字段别名拼接字符串，字段别名之间以逗号隔开
                StringBuilder aliasFieldsSb = new StringBuilder();

                for (Entry<String, String> entry : fieldsMap.entrySet()) {
                    fieldsSb.append(entry.getKey()).append(",");
                    if (StringUtils.isNotEmpty(entry.getValue())) {
                        aliasFieldsSb.append(entry.getValue().trim()).append(",");
                    } else {
                        aliasFieldsSb.append(",");
                    }
                }
                if (fieldsSb.length() > 0) {
                    fieldsSb.delete(fieldsSb.length() - 1, fieldsSb.length());
                }
                if (aliasFieldsSb.length() > 0) {
                    aliasFieldsSb.delete(aliasFieldsSb.length() - 1, aliasFieldsSb.length());
                }
                this.setFieldListParams(fieldsSb.toString().split(" *, *"), aliasFieldsSb.toString().split(" *, *"),
                        solrQuery);
            }

            this.setFilterQueryParams(filterQueryParams, solrQuery);
            QueryRequest queryRequest = new QueryRequest(solrQuery);
            queryRequest.setMethod(SolrRequest.METHOD.POST);
            try {
                QueryResponse response = queryRequest.process(solrServer);

                if (response.getResults() != null) {
                    // 如果字段map，根据solr文档列表和转换对象的Class，通过反射设置得到对应的转换对象列表
                    // 如果没有设置别名，返回solr原始getBeans方法得到的对象列表值。该getBeans方法是通过注解的方式设置映射关系
                    if (fieldsMap != null) {
                        return this.getBeansByDocsAndClazz(response.getResults(), clazz);
                    } else {
                        return response.getBeans(clazz);
                    }
                }
            } catch (SolrServerException e) {
                e.printStackTrace();
            }
        }
        return Collections.emptyList();
    }

    /**
     * 获取得到对象化的数据对象<br>
     * 使用场景：<br>
     * 1.当没有过滤显示字段数组，转换对象的Class注解有@Field关联字段值进行映射，返回对象数据。<br>
     * 2.当有过滤显示字段数组并且没有过滤显示字段别名数组，过滤字段后，转换对象的Class注解有@Field关联字段值进行映射，返回对象数据。<br>
     * 3.当有过滤显示字段数组并且有过滤显示字段别名数组，不需要转换对象的Class注解有@Field字段：<br>
     * 1)长度顺序一致，即都设置有别名情况下，设置对应的别名，并且能找到与别名名称相同的转换对象Class的属性名，通过反射直接赋值。<br>
     * 2)顺序一致，但长度不一致，即有部分设置别名，有部分没有设置别名，设置对应的别名，并且能找到与别名名称相同的转换对象Class的属性名，
     * 通过反射直接赋值，找不到相同的属性名则不做赋值处理。<br>
     * 
     * @param criteria
     *            查询条件
     * @param coreName
     *            core的名称
     * @param sortParams
     *            排序参数，以逗号隔开。如id desc,name desc
     * @param clazz
     *            要转换对象的Class
     * @param fields
     *            过滤显示字段数组，如果设置，只显示数组内的字段，数组为空，显示全部
     * @param aliasFields
     *            过滤显示字段别名数组，数组的顺序与fields字段数组的顺序一一对应，长度可不相同，当不相同时，
     *            取回fields对应的字段名为别名，并且返回对象的属性名与别名一致。
     * @return
     */
    public <T extends Object> T getBean(String criteria, String coreName, String sortParams, Class<T> clazz,
            String[] fields, String[] aliasFields) {
        if (StringUtils.isNotEmpty(criteria) && StringUtils.isNotEmpty(coreName)) {
            SolrServer solrServer = getSolrServer(coreName);
            SolrQuery solrQuery = new SolrQuery().setQuery(criteria).setRows(1);
            this.setSortParams(sortParams, solrQuery);
            this.setFieldListParams(fields, aliasFields, solrQuery);
            QueryRequest queryRequest = new QueryRequest(solrQuery);
            queryRequest.setMethod(SolrRequest.METHOD.POST);
            try {
                QueryResponse response = queryRequest.process(solrServer);
                if (response.getResults() != null && response.getResults().size() > 0) {
                    // 如果设置有别名，根据转换对象的Class，通过反射设置得到对应的转换对象列表，并返回
                    // 如果没有设置别名，返回solr原始getBeans方法得到的对象列表值。该getBeans方法是通过注解的方式设置映射关系
                    if (aliasFields != null && aliasFields.length > 0) {
                        return this.getBeansByDocsAndClazz(response.getResults(), clazz).get(0);
                    } else {
                        return response.getBeans(clazz).get(0);
                    }
                }
            } catch (Throwable e) {
                throw new RuntimeException(e);
            }
        }
        return null;
    }

    /**
     * 获取得到对象化的数据对象
     * 
     * @param criteria
     *            查询条件
     * @param coreName
     *            core的名称
     * @param sortParams
     *            排序参数，以逗号隔开。如id desc,name desc
     * @param clazz
     *            要转换对象的Class
     * @return
     */
    public <T extends Object> T getBean(String criteria, String coreName, String sortParams, Class<T> clazz) {
        if (StringUtils.isNotEmpty(criteria) && StringUtils.isNotEmpty(coreName)) {
            SolrServer solrServer = getSolrServer(coreName);
            SolrQuery solrQuery = new SolrQuery().setQuery(criteria).setRows(1);
            this.setSortParams(sortParams, solrQuery);
            QueryRequest queryRequest = new QueryRequest(solrQuery);
            queryRequest.setMethod(SolrRequest.METHOD.POST);
            try {
                QueryResponse response = queryRequest.process(solrServer);
                if (response.getResults() != null && response.getResults().size() > 0) {
                    return response.getBeans(clazz).get(0);
                }
            } catch (Throwable e) {
                throw new RuntimeException(e);
            }
        }
        return null;
    }

    /**
     * 
     * @param id
     *            ID唯一标识
     * @param coreName
     *            core的名称
     * @param clazz
     *            要转换对象的Class
     * @return
     */
    public <T extends Object> T getBeanById(String id, String coreName, Class<T> clazz) {
        return getBean("id:" + id, coreName, null, clazz);
    }

    /**
     * 获取得到对象化的数据Solr文档
     * 
     * @param criteria
     *            查询条件
     * @param coreName
     *            core的名称
     * @param fields
     *            过滤显示字段数组，如果设置，只显示数组内的字段，数组为空，显示全部
     * @param aliasFields
     *            过滤显示字段别名数组，数组的顺序与fields字段数组的顺序一一对应，长度可不相同，当不相同时，
     *            取回fields对应的字段名为别名
     * @return
     */
    public SolrDocument getDoc(String criteria, String coreName, String[] fields, String[] aliasFields) {
        if (StringUtils.isNotEmpty(criteria) && StringUtils.isNotEmpty(coreName)) {
            SolrServer solrServer = getSolrServer(coreName);
            SolrQuery solrQuery = new SolrQuery().setQuery(criteria).setRows(1);
            this.setFieldListParams(fields, aliasFields, solrQuery);
            QueryRequest queryRequest = new QueryRequest(solrQuery);
            queryRequest.setMethod(SolrRequest.METHOD.POST);
            try {
                QueryResponse response = queryRequest.process(solrServer);
                if (response.getResults() != null && response.getResults().size() > 0) {
                    return response.getResults().get(0);
                }
            } catch (SolrServerException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     * 获取得到对象化的数据Solr文档
     * 
     * @param criteria
     * @param coreName
     * @return
     */
    public SolrDocument getDoc(String criteria, String coreName) throws SolrServerException {
        if (StringUtils.isNotEmpty(criteria) && StringUtils.isNotEmpty(coreName)) {
            SolrServer solrServer = getSolrServer(coreName);
            SolrQuery solrQuery = new SolrQuery().setQuery(criteria).setRows(1);
            QueryRequest queryRequest = new QueryRequest(solrQuery);
            queryRequest.setMethod(SolrRequest.METHOD.POST);
            try {
                QueryResponse response = queryRequest.process(solrServer);
                if (response.getResults() != null && response.getResults().size() > 0) {
                    return response.getResults().get(0);
                }
            } catch (SolrServerException e) {
                log.error(this.getClass().getName() + ".getDoc() Failed to query from core:" + coreName, e);
                throw new SolrServerException(e);
            }
        }
        return null;
    }

    /**
     * 
     * @param id
     * @param coreName
     * @param objectClass
     * @return
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public Object getRealTimeObject(String id, String coreName, Class objectClass) {
        if (StringUtils.isNotEmpty(id) && StringUtils.isNotEmpty(coreName)) {
            SolrServer solrServer = getSolrServer(coreName);
            SolrQuery solrQuery = new SolrQuery().setParam("id", id).setRows(1);
            QueryRequest queryRequest = new QueryRequest(solrQuery);
            queryRequest.setMethod(SolrRequest.METHOD.POST);
            queryRequest.setPath("/get");
            try {
                QueryResponse response = queryRequest.process(solrServer);
                Object solrDoc = response.getResponse().get("doc");
                if (solrDoc != null && solrDoc instanceof SolrDocument) {
                    return solrServer.getBinder().getBean(objectClass, (SolrDocument) solrDoc);
                }
            } catch (SolrServerException e) {
                e.printStackTrace();
                throw new RuntimeException(e);
            }
        }
        return null;
    }

    /**
     * 
     * @param criteria
     * @param coreName
     * @return
     */
    public long getNumberFound(String criteria, String coreName) {
        if (StringUtils.isNotEmpty(criteria) && StringUtils.isNotEmpty(coreName)) {
            SolrServer solrServer = getSolrServer(coreName);
            SolrQuery solrQuery = new SolrQuery().setQuery(criteria).setRows(0);
            QueryRequest queryRequest = new QueryRequest(solrQuery);
            queryRequest.setMethod(SolrRequest.METHOD.POST);
            try {
                QueryResponse response = queryRequest.process(solrServer);
                return response.getResults().getNumFound();
            } catch (SolrServerException e) {
                e.printStackTrace();
                throw new RuntimeException(e);
            }
        }
        return 0;
    }

    /**
     * 
     * @param document
     * @param coreName
     */
    public void addDoc(SolrInputDocument document, String coreName) {
        addDocumentIntoSolr(document, coreName, false);
    }

    /**
     * 
     * @param document
     * @param coreName
     */
    public void addDocByHardCommit(SolrInputDocument document, String coreName) {
        addDocumentIntoSolr(document, coreName, true);
    }

    /**
     * 
     * @param document
     * @param coreName
     */
    public void addBean(Object document, String coreName) {
        addDocumentIntoSolr(document, coreName, false);
    }

    /**
     * 
     * @param document
     * @param coreName
     */
    public void addBeanByHardCommit(Object document, String coreName) {
        addDocumentIntoSolr(document, coreName, true);
    }

    private void addDocumentIntoSolr(Object object, String coreName, boolean isHardCommit) {
        if (object != null && StringUtils.isNotEmpty(coreName)) {
            SolrServer solrServer = getSolrServer(coreName);
            try {
                if (object instanceof SolrInputDocument) {
                    solrServer.add((SolrInputDocument) object);
                } else {
                    solrServer.addBean(object);
                }
                if (isHardCommit) {
                    solrServer.commit();
                }
            } catch (Exception e) {
                getLogger().error("[SolrClient]Failed to add doc into Solr", e);
                throw new RuntimeException(e);
            }
        }
    }

    /**
     * 
     * @param documents
     * @param coreName
     */
    @SuppressWarnings("rawtypes")
    public void addBeans(List documents, String coreName) {
        addDocumentsIntoSolr(documents, coreName, false);
    }

    /**
     * 
     * @param documents
     * @param coreName
     */
    @SuppressWarnings("rawtypes")
    public void addBeansByHardCommit(List documents, String coreName) {
        addDocumentsIntoSolr(documents, coreName, true);
    }

    /**
     * 
     * @param documents
     * @param coreName
     */
    public void addDocs(List<SolrInputDocument> documents, String coreName) {
        addDocumentsIntoSolr(documents, coreName, false);
    }

    /**
     * 
     * @param documents
     * @param coreName
     */
    public void addDocsByHardCommit(List<SolrInputDocument> documents, String coreName) {
        addDocumentsIntoSolr(documents, coreName, true);
    }

    @SuppressWarnings({ "rawtypes", "unchecked" })
    private void addDocumentsIntoSolr(List documents, String coreName, boolean isHardCommit) {
        if (documents != null && documents.size() > 0 && StringUtils.isNotEmpty(coreName)) {
            try {
                SolrServer solrServer = getSolrServer(coreName);
                if (documents.get(0) instanceof SolrInputDocument) {
                    solrServer.add(documents);
                } else {
                    solrServer.addBeans(documents);
                }
                if (isHardCommit) {
                    solrServer.commit();
                }
            } catch (Exception e) {
                getLogger().error("[SolrClient]Failed to add docs into Solr", e);
                throw new RuntimeException(e);
            }
        }
    }

    /**
     * 
     * @param inputDoc
     * @param id
     * @param fields
     * @param values
     * @return
     */
    public SolrInputDocument updateSolrFieldsWithId(SolrInputDocument inputDoc, Object id, List<String> fields,
            Object[] values) {
        inputDoc = this.updateSolrFields(inputDoc, fields, values);
        inputDoc.setField(ID, id);
        return inputDoc;
    }

    /**
     * 
     * @param inputDoc
     * @param fields
     * @param values
     * @return
     */
    public SolrInputDocument updateSolrFields(SolrInputDocument inputDoc, List<String> fields, Object[] values) {
        if (fields != null && values != null && fields.size() <= values.length) {
            for (int i = 0; i < fields.size(); i++) {
                Map<String, Object> updater = new HashMap<String, Object>();
                updater.put("set", values[i]);
                inputDoc.setField(fields.get(i), updater);
            }
        }

        return inputDoc;
    }

    /**
     * 
     * @param inputDoc
     * @param fields
     * @param values
     * @return
     */
    public SolrInputDocument updateSolrFields(SolrInputDocument inputDoc, List<String> fields, SolrDocument values) {
        if (fields != null && values != null) {
            for (int i = 0; i < fields.size(); i++) {
                Map<String, Object> updater = new HashMap<String, Object>();
                updater.put("set", values.getFieldValue(fields.get(i)));
                inputDoc.setField(fields.get(i), updater);
            }
        }

        return inputDoc;
    }

    /**
     *
     * @param query
     * @param coreName
     */
    public void deleteByQuery(String query, String coreName) {
        try {
            SolrServer solrServer = getSolrServer(coreName);
            solrServer.deleteByQuery(query);
            solrServer.commit();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    /**
     *
     * @param coreName
     * @param termsField
     * @param prefix
     * @param fetchRows
     * @return
     */
    public List<TermsResponse.Term> suggest(String coreName, String termsField, String prefix, int fetchRows) {
        try {
            SolrQuery solrQuery = new SolrQuery();
            solrQuery.addTermsField(termsField);
            solrQuery.setTerms(true);
            solrQuery.setTermsLimit(fetchRows);
            solrQuery.setTermsSortString("index");
            solrQuery.setTermsPrefix(prefix);
            solrQuery.setRequestHandler("/terms");
            QueryResponse queryResponse = getSolrServer(coreName).query(solrQuery);
            return queryResponse.getTermsResponse().getTerms(termsField);
        } catch (Throwable e) {
            getLogger().error(this.getClass().getName() + ".suggest()",
                    "Failed to queryTerms from core:" + coreName + " [" + termsField + "] [" + prefix + "]", e);
            throw new RuntimeException(e);
        }
    }

    /**
     *
     * @param coreName
     * @param queryString
     * @param fetchRows
     * @param fetchStartAt
     * @param sortParams
     * @param params
     * @return
     */
    public <T extends Object> SolrDocumentList spell(String coreName, String queryString, int fetchRows,
            int fetchStartAt, String sortParams, String params) {
        try {
            SolrQuery solrQuery = new SolrQuery().setQuery(queryString).setRows(fetchRows).setStart(fetchStartAt);
            setSortParams(sortParams, solrQuery);
            setParams(params, solrQuery);
            solrQuery.setRequestHandler("/spell");
            QueryResponse response;
            QueryRequest queryRequest = new QueryRequest(solrQuery);
            queryRequest.setMethod(SolrRequest.METHOD.POST);
            response = queryRequest.process(getSolrServer(coreName));
            SolrDocumentList results = response.getResults();
            if (null == results && null != response.getGroupResponse()) {
                results = new SolrDocumentList();
                for (GroupCommand groupCommand : response.getGroupResponse().getValues()) {
                    for (Group group : groupCommand.getValues()) {
                        results.addAll(group.getResult());
                    }
                }
            }
            return results;

        } catch (Throwable e) {
            getLogger().error(this.getClass().getName() + ".spell()",
                    "Failed to query from core:" + coreName + " [" + queryString + "]", e);
            throw new RuntimeException(e);
        }
    }

    /**
     * 拆分词组，返回匹配到的词组
     *
     * @param criteria
     *            查询条件
     * @param coreName
     *            core名称
     * @param requestHandler
     *            请求句柄
     * @param rows
     *            条数，可用于分页
     * @param start
     *            开始查询位置，可用于分页
     * @param sortParams
     *            排序参数，以逗号隔开。如id desc,name desc
     * @return
     */
    public <T extends Object> List<T> splitwWordsBeans(String criteria, String coreName, String requestHandler,
            int rows, int start, String sortParams, Class<T> clazz) {
        if (StringUtils.isNotEmpty(criteria) && StringUtils.isNotEmpty(coreName)
                && StringUtils.isNotEmpty(requestHandler)) {
            SolrServer solrServer = getSolrServer(coreName);
            SolrQuery solrQuery = new SolrQuery().setQuery(criteria).setRows(rows).setStart(start);
            solrQuery.setRequestHandler("/" + requestHandler);
            this.setSortParams(sortParams, solrQuery);
            QueryRequest queryRequest = new QueryRequest(solrQuery);
            queryRequest.setMethod(SolrRequest.METHOD.POST);
            try {
                QueryResponse response = queryRequest.process(solrServer);
                if (response.getResults() != null) {
                    return response.getBeans(clazz);
                }
            } catch (SolrServerException e) {
                log.error(this.getClass().getName() + ".splitwWordsBeans() Failed to query from core:" + coreName + " ["
                        + criteria + "]" + e);
                throw new RuntimeException(e);
            }
        }
        return Collections.emptyList();
    }

    /**
     * 拆分词组，返回匹配到SolrDocument的词组
     *
     * @param criteria
     *            查询条件
     * @param coreName
     *            core名称
     * @param requestHandler
     *            请求句柄
     * @param rows
     *            条数，可用于分页
     * @param start
     *            开始查询位置，可用于分页
     * @param sortParams
     *            排序参数，以逗号隔开。如id desc,name desc
     * @return
     */
    public List<SolrDocument> splitwWordsDocs(String criteria, String coreName, String requestHandler, int rows,
            int start, String sortParams) {
        List<SolrDocument> docs = new ArrayList<SolrDocument>();
        if (StringUtils.isNotEmpty(criteria) && StringUtils.isNotEmpty(coreName)
                && StringUtils.isNotEmpty(requestHandler)) {
            SolrServer solrServer = getSolrServer(coreName);
            SolrQuery solrQuery = new SolrQuery().setQuery(criteria).setRows(rows).setStart(start);
            solrQuery.setRequestHandler("/" + requestHandler);
            this.setSortParams(sortParams, solrQuery);
            QueryRequest queryRequest = new QueryRequest(solrQuery);
            queryRequest.setMethod(SolrRequest.METHOD.POST);
            try {
                QueryResponse response = queryRequest.process(solrServer);
                if (response.getResults() != null) {
                    docs.addAll(response.getResults());
                }
            } catch (SolrServerException e) {
                log.error(this.getClass().getName() + ".splitwWordsDocs() Failed to query from core:" + coreName + " ["
                        + criteria + "]" + e);
                throw new RuntimeException(e);
            }
        }
        return docs;
    }

    /**
     * 拆分词组，返回匹配到的词对象
     *
     * @param criteria
     *            查询条件
     * @param coreName
     *            core名称
     * @param requestHandler
     *            请求句柄
     * @param sortParams
     *            排序参数，以逗号隔开。如id desc,name desc
     * @param clazz
     *            要转换对象的Class
     * @return
     */
    public <T extends Object> T getSplitwWordsBean(String criteria, String coreName, String requestHandler,
            String sortParams, Class<T> clazz) {
        if (StringUtils.isNotEmpty(criteria) && StringUtils.isNotEmpty(coreName)
                && StringUtils.isNotEmpty(requestHandler)) {
            SolrServer solrServer = getSolrServer(coreName);
            SolrQuery solrQuery = new SolrQuery().setQuery(criteria).setRows(1);
            solrQuery.setRequestHandler("/" + requestHandler);
            this.setSortParams(sortParams, solrQuery);
            QueryRequest queryRequest = new QueryRequest(solrQuery);
            queryRequest.setMethod(SolrRequest.METHOD.POST);
            try {
                QueryResponse response = queryRequest.process(solrServer);
                if (response.getResults() != null && response.getResults().size() > 0) {
                    return response.getBeans(clazz).get(0);
                }
            } catch (Throwable e) {
                throw new RuntimeException(e);
            }
        }
        return null;
    }

    /**
     * 拆分词组，返回匹配到的SolrDocument对象
     *
     * @param criteria
     *            查询条件
     * @param coreName
     *            core名称
     * @param requestHandler
     *            请求句柄
     * @return
     */
    public SolrDocument getSplitwWordsDoc(String criteria, String coreName, String requestHandler) {
        if (StringUtils.isNotEmpty(criteria) && StringUtils.isNotEmpty(coreName)
                && StringUtils.isNotEmpty(requestHandler)) {
            SolrServer solrServer = getSolrServer(coreName);
            SolrQuery solrQuery = new SolrQuery().setQuery(criteria).setRows(1);
            solrQuery.setRequestHandler("/" + requestHandler);
            QueryRequest queryRequest = new QueryRequest(solrQuery);
            queryRequest.setMethod(SolrRequest.METHOD.POST);
            try {
                QueryResponse response = queryRequest.process(solrServer);
                if (response.getResults() != null && response.getResults().size() > 0) {
                    return response.getResults().get(0);
                }
            } catch (SolrServerException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     * 反向匹配，返回转换后的结果对象列表
     *
     * @param coreName
     *            core名称
     * @param lon
     *            经度
     * @param lat
     *            纬度
     * @param radius
     *            搜索半径，单位km
     * @param returnDistanceName
     *            返回时距离的名称，与tClass距离属性名称要一致，如不填，tClass要有distance距离属性，不然将无法得到距离值
     * @param clazz
     *            要转换对象的Class
     * @return
     */
    public <T extends Object> T reverseMatchBean(String coreName, double lon, double lat, double radius, Class<T> clazz,
            String returnDistanceName) throws Exception {
        if (StringUtils.isNotEmpty(coreName)) {
            SolrServer solrServer = getSolrServer(coreName);
            SolrQuery params = new SolrQuery();
            params.set("q", "*:*");
            params.set("fq", "{!geofilt}"); // 距离过滤函数
            params.set("pt", lat + "," + lon); // 当前坐标
            params.set("sfield", "GEO"); // 经纬度字段，默认约定geo名称
            params.set("d", "" + radius); // 搜索半径，单位km
            params.set("sort", "geodist() asc"); // 根据距离排序：由近到远
            params.set("start", 0); // 记录开始位置
            params.set("rows", 1); // 查询的行数
            if (StringUtils.isEmpty(returnDistanceName)) {
                returnDistanceName = "distance";
            }
            params.set("fl", "*," + returnDistanceName + ":geodist()"); // 查询的结果中添加距离

            QueryRequest queryRequest = new QueryRequest(params);
            queryRequest.setMethod(SolrRequest.METHOD.POST);
            try {
                QueryResponse response = queryRequest.process(solrServer);
                if (response.getResults() != null) {
                    return response.getBeans(clazz).get(0);
                }
            } catch (SolrServerException e) {
                log.error(this.getClass().getName() + ".reverseMatchBean() Failed to query from core:" + coreName, e);
                throw new SolrServerException(e);
            }
        }
        return null;
    }

    /**
     * 反向匹配，返回转换后的结果对象列表
     *
     * @param coreName
     *            core名称
     * @param lon
     *            经度
     * @param lat
     *            纬度
     * @param radius
     *            搜索半径，单位km
     * @param start
     *            开始位置
     * @param rows
     *            查询的行数
     * @param returnDistanceName
     *            返回时距离的名称，与tClass距离属性名称要一致，如不填，tClass要有distance距离属性，不然将无法得到距离值
     * @param clazz
     *            要转换对象的Class
     * @return
     */
    public <T extends Object> List<T> reverseMatchBeans(String coreName, double lon, double lat, double radius,
            int rows, int start, Class<T> clazz, String returnDistanceName) throws Exception {
        if (StringUtils.isNotEmpty(coreName)) {
            SolrServer solrServer = getSolrServer(coreName);
            SolrQuery params = new SolrQuery();
            params.set("q", "*:*");
            params.set("fq", "{!geofilt}"); // 距离过滤函数
            params.set("pt", lat + "," + lon); // 当前坐标
            params.set("sfield", "GEO"); // 经纬度字段，默认约定geo名称
            params.set("d", "" + radius); // 搜索半径，单位km
            params.set("sort", "geodist() asc"); // 根据距离排序：由近到远
            params.set("start", start); // 记录开始位置
            params.set("rows", rows); // 查询的行数
            if (StringUtils.isEmpty(returnDistanceName)) {
                returnDistanceName = "distance";
            }
            params.set("fl", "*," + returnDistanceName + ":geodist()"); // 查询的结果中添加距离

            QueryRequest queryRequest = new QueryRequest(params);
            queryRequest.setMethod(SolrRequest.METHOD.POST);
            try {
                QueryResponse response = queryRequest.process(solrServer);
                if (response.getResults() != null) {
                    return response.getBeans(clazz);
                }
            } catch (SolrServerException e) {
                log.error(this.getClass().getName() + ".reverseMatchBeans() Failed to query from core:" + coreName, e);
                throw new SolrServerException(e);
            }
        }
        return Collections.emptyList();
    }

    /**
     * 反向匹配，返回SolrDocument列表
     *
     * @param coreName
     *            core名称
     * @param lon
     *            经度
     * @param lat
     *            纬度
     * @param radius
     *            搜索半径，单位km
     * @param start
     *            开始位置
     * @param rows
     *            查询的行数
     * @param returnDistanceName
     *            返回时距离的名称
     * @return
     */
    public List<SolrDocument> reverseMatchDocs(String coreName, double lon, double lat, double radius, int rows,
            int start, String returnDistanceName) throws Exception {
        List<SolrDocument> docs = new ArrayList<SolrDocument>();
        if (StringUtils.isNotEmpty(coreName)) {
            SolrServer solrServer = getSolrServer(coreName);
            SolrQuery params = new SolrQuery();
            params.set("q", "*:*");
            params.set("fq", "{!geofilt}"); // 距离过滤函数
            params.set("pt", lat + "," + lon); // 当前坐标
            params.set("sfield", "GEO"); // 经纬度字段，默认约定geo名称
            params.set("d", "" + radius); // 搜索半径，单位km
            params.set("sort", "geodist() asc"); // 根据距离排序：由近到远
            params.set("start", start); // 记录开始位置
            params.set("rows", rows); // 查询的行数
            if (StringUtils.isEmpty(returnDistanceName)) {
                returnDistanceName = "distance";
            }
            params.set("fl", "*," + returnDistanceName + ":geodist()"); // 查询的结果中添加距离

            QueryRequest queryRequest = new QueryRequest(params);
            queryRequest.setMethod(SolrRequest.METHOD.POST);
            try {
                QueryResponse response = queryRequest.process(solrServer);
                if (response.getResults() != null) {
                    docs.addAll(response.getResults());
                }
            } catch (SolrServerException e) {
                log.error(this.getClass().getName() + ".reverseMatchDocs() Failed to query from core:" + coreName, e);
                throw new SolrServerException(e);
            }
        }
        return docs;
    }

    /**
     * 根据参数执行solr导入操作，返回成功更新条数<br>
     *
     * @param coreName
     *            core的名称
     * @param paramsDataMap
     *            参数数据Map
     * @return
     */
    @SuppressWarnings("unchecked")
    public int dataImportByParams(String coreName, Map<String, String> paramsDataMap) throws SolrServerException {
        if (StringUtils.isNotEmpty(coreName)) {
            SolrServer solrServer = getSolrServer(coreName);
            SolrQuery solrQuery = new SolrQuery();
            solrQuery.setRequestHandler("/dataimport");

            // 设置参数
            if (paramsDataMap != null) {
                for (Map.Entry<String, String> entry : paramsDataMap.entrySet()) {
                    solrQuery.setParam(entry.getKey(), entry.getValue());
                }
            }

            QueryRequest queryRequest = new QueryRequest(solrQuery);
            queryRequest.setMethod(SolrRequest.METHOD.POST);
            try {
                QueryResponse response = queryRequest.process(solrServer);

                int num = 0;
                if (response != null) {
                    // 获取得到更新条数。
                    NamedList<Object> resMap = response.getResponse();
                    if (resMap.get("statusMessages") != null) { // 更新条数是在statusMessages对象里
                        try {
                            LinkedHashMap<String, String> obj = (LinkedHashMap<String, String>) resMap
                                    .get("statusMessages");
                            num = Integer.parseInt(obj.get("Total Changed Documents"));
                        } catch (Exception e1) {
                            num = 0;
                        }
                        return num;
                    }
                }
            } catch (SolrServerException e) {
                log.error(this.getClass().getName() + ".dataImportByParams() Failed to query from core:" + coreName, e);
                throw new SolrServerException(e);
            }
        }
        return 0;
    }

    /**
     * 
     * @param content
     * @param name
     * @return
     * @throws IOException
     */
    public static byte[] zip(String content, String name) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        ZipOutputStream zipOutputStream = null;
        DataOutputStream dataOutputStream = null;
        try {
            zipOutputStream = new ZipOutputStream(byteArrayOutputStream);
            zipOutputStream.putNextEntry(new ZipEntry(name));
            dataOutputStream = new DataOutputStream(zipOutputStream);
            dataOutputStream.write(content.getBytes(UTF8_CHARSET_NAME));
            dataOutputStream.flush();
            zipOutputStream.flush();
            zipOutputStream.finish();
        } finally {
            dataOutputStream.close();
            zipOutputStream.close();
        }
        return byteArrayOutputStream.toByteArray();
    }

    /**
     * 
     * @param value
     * @return
     */
    public static String unZip(byte[] value) {
        if (null == value) {
            return null;
        }
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(value);
        ZipInputStream zipInputStream = null;
        String sourceText = null;
        try {
            zipInputStream = new ZipInputStream(byteArrayInputStream);
            zipInputStream.getNextEntry();
            final int bufferSize = 4096;
            byte[] buffer = new byte[bufferSize];
            int n;
            while ((n = zipInputStream.read(buffer, 0, bufferSize)) != -1) {
                byteArrayOutputStream.write(buffer, 0, n);
            }
            sourceText = byteArrayOutputStream.toString("UTF-8");
        } catch (Throwable t) {
            t.printStackTrace();
        } finally {
            try {
                if (null != zipInputStream) {
                    zipInputStream.close();
                    zipInputStream = null;
                }
                if (null != byteArrayInputStream) {
                    byteArrayInputStream.close();
                    byteArrayInputStream = null;
                }
                if (null != byteArrayOutputStream) {
                    byteArrayOutputStream.close();
                    byteArrayOutputStream = null;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return sourceText;
    }

    private Logger getLogger() {
        return this.log;
    }

    private void setSortParams(String sortParams, SolrQuery solrQuery) {
        if (StringUtils.isNotEmpty(sortParams)) {
            String[] sortFields = sortParams.trim().split(" *, *");
            for (String sortField : sortFields) {
                String[] sortFieldAndOrder = sortField.split(" +");
                if (2 == sortFieldAndOrder.length) {
                    solrQuery.addSort(sortFieldAndOrder[0],
                            SolrQuery.ORDER.valueOf(sortFieldAndOrder[1].toLowerCase()));
                } else if (1 == sortFieldAndOrder.length) {
                    solrQuery.addSort(sortFieldAndOrder[0], SolrQuery.ORDER.asc);
                }
            }
        }
    }

    private void setParams(String params, SolrQuery solrQuery) {
        if (StringUtils.isNotEmpty(params)) {
            String[] paramPairs = params.trim().split("&");
            for (String paramPair : paramPairs) {
                String[] paramFieldAndValue = paramPair.split("=");
                solrQuery.add(paramFieldAndValue[0], paramFieldAndValue[1]);
            }
        }
    }

    /**
     * 设置过滤查询参数<br>
     * 例如权重条件设置：a^2 b^0.3 c^1
     *
     * @param params
     *            参数
     * @param solrQuery
     *            solr查询类
     */
    private void setFilterQueryParams(String params, SolrQuery solrQuery) {
        if (StringUtils.isNotEmpty(params)) {
            String[] paramPairs = params.trim().split(" *  *");
            for (String paramPair : paramPairs) {
                solrQuery.addFilterQuery(paramPair);
            }
        }
    }

    /**
     * 设置过虑字段参数，如果有别名，则设置别名
     *
     * @param fields
     *            过滤显示字段数组，如果设置，只显示数组内的字段，数组为空，显示全部
     * @param aliasFields
     *            过滤显示字段别名数组，数组的顺序与fields字段数组的顺序一一对应，长度可不相同，当不相同时，
     *            取回fields对应的字段名为别名
     * @param solrQuery
     *            solr查询类
     */
    private void setFieldListParams(String[] fields, String[] aliasFields, SolrQuery solrQuery) {
        if (fields == null || fields.length <= 0) {
            return;
        }

        // 判断字段别名数组不为空且长度与字段数组相等
        if (aliasFields != null && aliasFields.length > 0) {
            StringBuilder fieldSb = new StringBuilder();
            // 别名的格式是: 别名:真实名
            for (int i = 0; i < fields.length; i++) {
                fieldSb.delete(0, fieldSb.length());
                if (aliasFields.length - 1 >= i) {
                    if (StringUtils.isEmpty(aliasFields[i])) {
                        aliasFields[i] = fields[i];
                    }
                    fieldSb.append(aliasFields[i]).append(":").append(fields[i]);
                } else {
                    fieldSb.append(fields[i]).append(":").append(fields[i]);
                }
                fields[i] = fieldSb.toString();
            }
        }
        solrQuery.setFields(fields);
    }

    /**
     * 设置分组参数<br>
     * 主要用于数据统计，对应数据库中的group by
     *
     * @param facetParams
     *            分组参数数组
     * @param aliasFields
     *            过滤显示字段别名数组，数组的顺序与facetParams数组的顺序一一对应，长度可不相同，没有别名则不设置别名，
     *            facetParams的数组长度一定大于等于aliasFields数组长度
     * @param solrQuery
     *            solr查询类
     */
    private void setFacetParams(String[] facetParams, String[] aliasFields, SolrQuery solrQuery) {
        if (facetParams != null && facetParams.length > 0) {
            // TODO 别名处理由得到结果后处理
            // if (aliasFields != null && aliasFields.length > 0) {
            // StringBuilder facetFieldSb = new StringBuilder();
            // for (int i = 0; i < aliasFields.length; i++) {
            // facetFieldSb.delete(0, facetFieldSb.length());
            // facetFieldSb.append("{!key=\"").append(aliasFields[i]).append("\"}").append(facetParams[i]);
            // facetParams[i] = facetFieldSb.toString();
            // }
            // }

            // 如果选择的是匹配后得到的标准地址名称进行分组时，直接搜索solr中的类型为string的AC_STANDARD_ADDR_NAME_S字段，此字段不受中文分词影响。
            // 中文分词分组会导致以分到的词组进行分组。得到的结果根据不是最终想要得到的结果，因此多冗余一个类型为string的AC_STANDARD_ADDR_NAME_S字段。
            String facetParam = null;
            for (int i = 0; i < facetParams.length; i++) {
                facetParam = facetParams[i];
                if (facetParam.equals(FIELD_AC_STANDARD_ADDR_NAME)) {
                    facetParam = FIELD_AC_STANDARD_ADDR_NAME_S;
                    facetParams[i] = facetParam;
                    break;
                }
            }
            solrQuery.setFacet(true);
            solrQuery.addFacetField(facetParams);
            solrQuery.setFacetMissing(false); // 不统计null的值
        }
    }

    /**
     * 根据solr文档列表和转换对象的Class，通过反射设置得到对应的转换对象列表<br>
     * 1.主要用于当已经设置过滤返回对象和别名后得到的docs文档列表，根据转换对象的Class，设置与文档key一致的属性值<br>
     * 2.当转换对象的Class注解有@Field("otherFields")，把那些没有设置到属性里的值，全部加入到注解有@Field(
     * "otherFields")的Map对象中<br>
     * 3.如果没有找到注解有@Field("otherFields")的Map，那些没有设置到属性里的值全部丢弃掉<br>
     *
     * @param docs
     *            solr文档对象列表
     * @param clazz
     *            要转换对象的Class
     * @return
     */
    private <T extends Object> List<T> getBeansByDocsAndClazz(List<SolrDocument> docs, Class<T> clazz) {
        // solr文档对象列表为空，直接返回空列表
        if (docs == null || docs.size() <= 0) {
            return Collections.emptyList();
        }

        // 得到所有属性列表
        Field[] declaredFields = clazz.getDeclaredFields();
        // 对象实例
        T obj = null;
        // 其他字段值map
        Map<String, String> otherFieldValueMap = null;
        // solr字段Object对象变量
        Object fieldValueObj = null;
        // solr字段字符串变量
        String fieldValueStr = null;
        // 返回列表
        List<T> rtnList = new ArrayList<T>();
        // 是否有相同的字段名称
        boolean hasSameFieldName = false;

        for (SolrDocument doc : docs) {
            // fieldValueMap = doc.getFieldValueMap();
            try {
                hasSameFieldName = false;
                otherFieldValueMap = new HashMap<String, String>();
                // 创建实例
                obj = clazz.newInstance();
                // 循环反射得到的字段列表，比较字段名是否一致，一致的话则赋值给对象。
                for (Entry<String, Object> entry : doc.entrySet()) {
                    fieldValueObj = entry.getValue();

                    for (Field field : declaredFields) {
                        // 字段名一致
                        if (field.getName().equals(entry.getKey())) {
                            field.setAccessible(true);

                            // 类型转换，如果是solr文档对象是日期类型，并且与clazz属性类型不一致，则做日期格式转换
                            if (fieldValueObj instanceof Date) {
                                if (field.getType() == Date.class) {
                                    field.set(obj, fieldValueObj);
                                } else {
                                    field.set(obj, dateFormat.format(fieldValueObj));
                                }
                            } else {
                                // 除了日期类型之外，其他类型solr对象与bean对象属性类型一致，按原类型设置值
                                if (fieldValueObj.getClass() == field.getType()) {
                                    field.set(obj, fieldValueObj);
                                } else {
                                    field.set(obj, fieldValueObj.toString());
                                }
                            }
                            hasSameFieldName = true;
                            break;
                        }
                    }

                    if (!hasSameFieldName) {
                        // 那些没有找到相同属性名的值，全部加入Map对象中
                        if (fieldValueObj instanceof Date) {
                            fieldValueStr = dateFormat.format(fieldValueObj);
                        } else {
                            // 除了日期类型之外，其他类型按字符串类型设置值
                            fieldValueStr = fieldValueObj.toString();
                        }
                        otherFieldValueMap.put(entry.getKey(), fieldValueStr);
                    }

                } // end-for (Entry<String, Object> entry : doc.entrySet())

                // 通过反射，设置其他字段值map到对象实例
                setOtherFieldValueMap(declaredFields, obj, otherFieldValueMap);

                rtnList.add(obj);
            } catch (InstantiationException e) {
                // 出现异常，记录日志，不直接抛出中断流程
                String error = "通过转换得到对应的转换对象列表方法时，出现InstantiationException异常！";
                log.error(error, e);
            } catch (IllegalAccessException e) {
                // 出现异常，记录日志，不直接抛出中断流程
                String error = "通过转换得到对应的转换对象列表方法时，出现IllegalAccessException异常！";
                log.error(error, e);
            }
        }
        return rtnList;
    }

    /**
     * 通过反射，设置其他字段值map到对象实例
     *
     * @param declaredFields
     *            所有属性字段的列表
     * @param obj
     *            要转换对象Class的对象实例
     * @param otherFieldValueMap
     *            其他字段值map
     * @return
     */
    private <T extends Object> T setOtherFieldValueMap(Field[] declaredFields, T obj,
            Map<String, String> otherFieldValueMap) {

        for (Field field : declaredFields) {
            if (field.isAnnotationPresent(org.apache.solr.client.solrj.beans.Field.class)
                    && field.getType() == Map.class) {

                org.apache.solr.client.solrj.beans.Field annotationField = field
                        .getAnnotation(org.apache.solr.client.solrj.beans.Field.class);

                // 注解的字段名是否为otherFields，则把除了有设置别名之外的需要返回的字段值，赋值给该字段值上
                if (ANNOTATION_OTHERFIELDS.equals(annotationField.value())) {
                    try {
                        field.setAccessible(true);
                        field.set(obj, otherFieldValueMap);
                    } catch (IllegalArgumentException e) {
                        // 出现异常，记录日志，不直接抛出中断流程
                        String error = "通过反射设置其他字段值map到对象实例方法时，出现InstantiationException异常！";
                        log.error(error, e);
                    } catch (IllegalAccessException e) {
                        // 出现异常，记录日志，不直接抛出中断流程
                        String error = "通过反射设置其他字段值map到对象实例方法时，出现IllegalAccessException异常！";
                        log.error(error, e);
                    }
                    break;
                }
            }
        }

        return obj;
    }
}
