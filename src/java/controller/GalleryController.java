/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ContactDAO;
import dao.CountDAO;
import dao.PhotoDAO;
import entity.Image;
import entity.Gallery;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class GalleryController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            PhotoDAO photoDAO = new PhotoDAO();
            ContactDAO contactDAO = new ContactDAO();
            CountDAO countDAO = new CountDAO();
            
            String galleryIDStr = request.getParameter("galleryID");
            String imgIDStr = request.getParameter("imgID");
            
            boolean invaild = true;
            boolean indexValid = true;
            
            int galleryID = Integer.parseInt(galleryIDStr);
            int noOfImageInGallery = photoDAO.countNoImgOfGallery(galleryID);
            request.setAttribute("noOfImageInGallery", noOfImageInGallery);
            
            List<Image> imageList = photoDAO.getListImageByGalleryID(galleryID);
            Gallery gallery = photoDAO.getGalleryByID(galleryID);
            
            
            
            HttpSession session = request.getSession();
            if (session.isNew()) {
                countDAO.addVisit();
            }
            //get visit number info
            int visit = countDAO.getVisit();
            String visitStr = String.format("%05d", visit);
            request.setAttribute("visit", visitStr);
            
        } catch (Exception e) {
            request.setAttribute("error", e);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
