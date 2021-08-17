<%-- 
    Document   : header
    Created on : Aug 15, 2021, 4:34:05 PM
    Author     : Admin
--%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../static/css/header.css" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="nav">
            <div class= "nav-inner">
                <ul>
                    <li>
                        <a class="${active=="0"?"activeMenu":""}" href="home">My front page</a>
                    </li>
                    <c:forEach items="${top3}" var="i" >
                        <li> <a class="${active==i.id?"activeMenu":""}" href="gallery?galleryID=${i.id}">${i.title}</a> </li>
                    </c:forEach>
                    <li>
                        <a class="${active=="4"?"activeMenu":""}" href="contact">Contact</a>
                    </li>
                </ul>
            </div>

        </div>
        <div class="header">
            <div class="header-inner">
                <div class="img"> </div>
                <!--<img rel="nofollow" src="./images/logo.png"/>-->
                <div class="title ">
                    PHOTOGRAPHER
                </div>
                <div class="subtitle">
                    Welcome to this website
                </div>
            </div>
        </div>
    </body>
</html>
