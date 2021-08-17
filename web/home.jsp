<%-- 
    Document   : home.jsp
    Created on : Aug 17, 2021, 11:26:26 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../static/css/home.css" type="text/css"/>
        <title>Homepage</title>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp"/>
            <div class="main">
                <div class="left">
                    <div class="image">
                        <img src="${contact.image_main}" alt="DemoImage">
                    </div>
                    <div class="description">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque voluptatum laboriosam consectetur corporis sit. Molestiae quia quas officiis quasi temporibus culpa, corrupti consectetur, nemo accusantium, sequi recusandae! Blanditiis, ipsa. Sint?
                    </div>
                    <div class="content">
                        <c:if test="${error != null}">
                            <h3>${error}</h3>
                        </c:if>
                        <c:if test="${error == null}">
                            <c:if test="${index > noPageOfGalleryList}">
                                <h3> Not found this page!!!</h3>
                            </c:if>
                            <ul >
                                <c:if test="${index <= noPageOfGalleryList}">
                                    <c:forEach items="${galleryList}" var="i" >
                                        <li class="span4">
                                            <div class="image">
                                                <img src="${i.feature_img}">
                                            </div>
                                            <h4>
                                                <a href="gallery?galleryID=${i.id}">View ${i.title}</a>
                                            </h4>
                                            <p>${i.description}</p>
                                        </li>
                                    </c:forEach>
                                </c:if>
                            </ul>
                        </c:if>    
                    <div class="paging">
                        <c:if test="${noPageOfGalleryList < 1}">
                            <h3>Not Found!!</h3>
                        </c:if>
                        <c:if test="${noPageOfGalleryList > 1}">
                            <c:forEach begin="1" end="${noPageOfGalleryList}" var="i">
                                <a class="${i==index?"active":""}" href="home?index=${i}">${i}</a>
                            </c:forEach>
                        </c:if>
                    </div>
                    </div>
                    <div class="about">
                        <h3>About me</h3>
                    </div>
                    <div class="about-detail">
                        ${contact.description}
                    </div>
                </div>
                <div class="right">
                    <jsp:include page="right.jsp"/>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
