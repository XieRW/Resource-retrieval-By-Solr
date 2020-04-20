# Resource-retrieval-By-Solr
利用Solr8实现资源检索（条件、圈选、框选等），定时增量同步

## 一、项目结构说明
### src 为源代码，由SpringBoot结合solr实现资源的空间检索
### solr-8.2.0为已经配置好的solr服务，基于最新的solr8
### database为和本项目匹配的MySql数据库脚本

## 二、项目功能说明
1. 利用经纬度坐标实现几何图形范围查询，如圈选（圆）、框选（多边形）
2. 实现基于solr join的多个core的联接查询
3. 实现基于权限系统的分权限查询（模拟）
4. 提供最新solr8.2.0和MySql和Springboot整合范示
5. 实现基于solr索引更新定时器的MySql数据自动定时增量同步

...........
