/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Gallery;
import entity.Image;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class PhotoDAO {
    DBContext db;

    public PhotoDAO() {
        db = new DBContext();
    }
    
    //get top 3 gallery
    public List<Gallery> getTop3Gallery() throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Gallery> top3Gallery = new ArrayList<>();
        try {
            con = db.getConnection();
            String query = "SELECT TOP 3 * FROM [Gallery]";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            //add each gallery in result set to list 
            while (rs.next()) {
                String feature_img = db.getImgDir() + rs.getString("feature_img");
                top3Gallery.add(new Gallery(rs.getInt("id"), rs.getString("title"), rs.getString("description"), feature_img));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return top3Gallery;
    }
    
    //get gallery by id 
    public Gallery getGalleryByID(int id) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = db.getConnection();
            String query = "SELECT * FROM [Gallery] WHERE [id]=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                String feature_img = db.getImgDir() + rs.getString("feature_img");
                return new Gallery(rs.getInt("id"), rs.getString("title"), rs.getString("description"), feature_img);
            }
            return null;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }
    
    //count number of gallery 
    public int countNoOfGallery() throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int count = 0;
        try {
            con = db.getConnection();
            String query = "SELECT count(*) FROM [Gallery]";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()) {
                count = rs.getInt(1);
            }
            return count;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }
    
    // get list gallery with paging
    public List<Gallery> getListGalleryWithPaging(int pageIndex, int pageSize) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        int galleryFrom = pageIndex * pageSize - (pageSize - 1);
        int galleryTo = pageIndex * pageSize;
        
        List<Gallery> listGallery = new ArrayList<>();
        try {
            con = db.getConnection();
            String query = "SELECT id,title,description,feature_img FROM ( SELECT ROW_NUMBER() OVER (ORDER BY id ASC) AS rn , * FROM  gallery ) AS b WHERE rn BETWEEN ? AND ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, galleryFrom);
            ps.setInt(2, galleryTo);
            rs = ps.executeQuery();
            while(rs.next()) {
                String feature_img = db.getImgDir() + rs.getString("feature_img");
                listGallery.add(new Gallery(rs.getInt("id"), rs.getString("title"), rs.getString("description"), feature_img));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return listGallery;
    }
    
    //count number image of gallery by id of gallery 
    public int countNoImgOfGallery(int id) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int count = 0;
        try {
            con = db.getConnection();
            String query = "SELECT count(*) FROM [Image] WHERE [gallery_id]=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next()) {
                count = rs.getInt(1);
            }
            return count;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }
    
    //get imgList by gallery id
    public List<Image> getListImageByGalleryID(int galleryID) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        List<Image> listImage = new ArrayList<>();
        try {
            con = db.getConnection();
            String query = "SELECT * FROM [Image] WHERE [gallery_id]=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, galleryID);
            rs = ps.executeQuery();
            while(rs.next()) {
                String img = db.getImgDir() + rs.getString("image_url");
                listImage.add(new Image(rs.getInt("id"), rs.getInt("gallery_id"), img));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return listImage;
    }

    
    
    //get Img by id
    public Image getImageID(int imgID, int galleryID) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = db.getConnection();
            String query = "SELECT * FROM [Image] WHERE [id]=? AND [gallery_id]=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, imgID);
            ps.setInt(2, galleryID);
            rs = ps.executeQuery();
            while(rs.next()) {
                String img = db.getImgDir() + rs.getString("image_url");
                return new Image(rs.getInt("id"), rs.getInt("gallery_id"), img);
            }
            return null;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }
}
