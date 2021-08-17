/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Admin
 */
public class Gallery {
    private int id;
    private String title;
    private String description;
    private String feature_img;

    public Gallery() {
    }

    public Gallery(int id, String title, String description, String feature_img) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.feature_img = feature_img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFeature_img() {
        return feature_img;
    }

    public void setFeature_img(String feature_img) {
        this.feature_img = feature_img;
    }
    
    
}
