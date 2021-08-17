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
public class Contact {
    private String telephone;
    private String email;
    private String face_url;
    private String twitter_url;
    private String google_url;
    private String address;
    private String city;
    private String country;
    private String map_url;
    private String image_main;
    private String description;

    public Contact() {
    }

    public Contact(String telephone, String email, String face_url, String twitter_url, String google_url, String address, String city, String country, String map_url, String image_main, String description) {
        this.telephone = telephone;
        this.email = email;
        this.face_url = face_url;
        this.twitter_url = twitter_url;
        this.google_url = google_url;
        this.address = address;
        this.city = city;
        this.country = country;
        this.map_url = map_url;
        this.image_main = image_main;
        this.description = description;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFace_url() {
        return face_url;
    }

    public void setFace_url(String face_url) {
        this.face_url = face_url;
    }

    public String getTwitter_url() {
        return twitter_url;
    }

    public void setTwitter_url(String twitter_url) {
        this.twitter_url = twitter_url;
    }

    public String getGoogle_url() {
        return google_url;
    }

    public void setGoogle_url(String google_url) {
        this.google_url = google_url;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getMap_url() {
        return map_url;
    }

    public void setMap_url(String map_url) {
        this.map_url = map_url;
    }

    public String getImage_main() {
        return image_main;
    }

    public void setImage_main(String image_main) {
        this.image_main = image_main;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    
}
