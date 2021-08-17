/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ContactDAO;
import dao.CountDAO;
import dao.PhotoDAO;
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
public class HomeController extends HttpServlet {

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
            
            int pageSize = 3;
            int index = 0;
            String pageIndex = request.getParameter("index");
            //check index page
            if (pageIndex != null) {
                index = Integer.parseInt(pageIndex);
            } else {
                index = 1;
            }
            //get gallery with paging
            int noOfGallery = photoDAO.countNoOfGallery();
            int noPageOfGalleryList = noOfGallery/pageSize;
            
            if((noOfGallery % pageSize) != 0) {
                noPageOfGalleryList ++;
            }
            List<Gallery> galleryList = photoDAO.getListGalleryWithPaging(index, pageSize);
            
            request.setAttribute("galleryList", galleryList);
            request.setAttribute("index", index);
            request.setAttribute("noPageOfGalleryList", noPageOfGalleryList);
            request.setAttribute("noOfGallery", noOfGallery);
            
            //about context + feature_image
            request.setAttribute("contact", contactDAO.getContactInfo());
            
            //get top 3 gallery
            request.setAttribute("top3", photoDAO.getTop3Gallery());
            
            request.setAttribute("active", "0");
            
            HttpSession session = request.getSession();
            if (session.isNew()) {
                countDAO.addVisit();
            }
            
            //get visit number info
            int visit = countDAO.getVisit();
            String visitStr = String.format("%05d", visit);
            request.setAttribute("visit", visitStr);
            
            request.getRequestDispatcher("home.jsp").forward(request, response);
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
