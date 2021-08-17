/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Contact;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ContactDAO {
    DBContext db;

    public ContactDAO() {
        db = new DBContext();
    }
    
    public Contact getContactInfo() throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            con = db.getConnection();
            String query = "SELECT TOP 1 * FROM [Contact]";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                String img = db.getImgDir() + rs.getString("image_main");
                return new Contact(rs.getString("telephone"), rs.getString("email"), 
                        rs.getString("face_url"), rs.getString("twitter_url"), 
                        rs.getString("google_url"), rs.getString("address"), 
                        rs.getString("city"), rs.getString("country"), 
                        rs.getString("map_url"), img, rs.getString("description"));
            }
            return null;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }
}
