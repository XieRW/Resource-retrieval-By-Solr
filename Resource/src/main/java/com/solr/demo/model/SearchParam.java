package com.solr.demo.model;

public class SearchParam {

    //经度
    private double x;
    //纬度
    private double y;
    //半径
    private double radius;

    private String Polygon;

    public SearchParam(double x, double y, double radius) {
        this.x = x;
        this.y = y;
        this.radius = radius;
    }

    public SearchParam(String polygon) {
        this.Polygon = polygon;
    }

    public double getX() {
        return x;
    }

    public void setX(double x) {
        this.x = x;
    }

    public double getY() {
        return y;
    }

    public void setY(double y) {
        this.y = y;
    }

    public double getRadius() {
        return radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

    public String getPolygon() {
        return Polygon;
    }

    public void setPolygon(String polygon) {
        Polygon = polygon;
    }
}
