<%-- 
    Document   : gallery
    Created on : Aug 15, 2021, 4:35:36 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./static/css/home.css" rel="stylesheet" type="text/css">
        <link href="./static/css/slide.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp"/>
            <div class="main">
                <div class="left">
                    <div class="about">
                        <h3>${gallery.name}</h3>
                    </div>
                    <c:if test="${error != null}">
                        <h3 style="margin-bottom: 600px"> ${error}</h3>
                    </c:if>
                    <c:if test="${error == null}">
                        <c:if test="${top1Gallery.image_url != null && totalRecord > 0 }">
                            <div class="imageGaler" id="imageGaler">
                                <c:set var="k" value="0"/>
                                <c:set var="cur" value="0"/>
                                <c:forEach items="${listImage}" var="i" varStatus="loop">
                                    <c:if test="${top1Gallery.id == i.id}">
                                        <c:set var="cur" value="${k}"/>
                                        <div class="mySlides show-on fadesl">
                                            <a href="detail?galleryID=${galleryID}&imgID=${i.id}"><img src="${i.image_url}"></a>
                                        </div>
                                    </c:if>
                                    <c:if test="${top1Gallery.id != i.id}">
                                        <div class="mySlides show-off fadesl">
                                            <a href="detail?galleryID=${galleryID}&imgID=${i.id}"><img src="${i.image_url}"></a>
                                        </div>
                                    </c:if>
                                    <c:set var="k" value="${k + 1}"/>
                                </c:forEach>                                
                                <input type="button" value="Play" onclick="clickBtn();" class="playbtn" id="playbtn">
                            </div>
                        </c:if>
                        <div class="contentGallery">

                            <c:if test="${error == null}">
                                <%--<c:if test="${index > maxPage || index < 0}">--%>
                                    <!--<h3> Not found this page!!!</h3>-->
                                <%--</c:if>--%>
                                    
                                <ul>
                                    <c:if test="${index <= maxPage}">
                                        <c:forEach items="${listImage}" var="i" varStatus="loop">
                                            <li class="span4">
                                                <a href="gallery?index=${index}&galleryID=${galleryID}&imgID=${i.id}"><img src="${i.image_url}"></a>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                </ul>

                            </c:if>    
                            <div class="paging">
                                <c:if test="${maxPage > 1}">
                                    <c:forEach begin="1" end="${maxPage}" var="i">
                                        <a class="${i==index?"active":""}" href="gallery?index=${i}&galleryID=${galleryID}">${i}</a>
                                        <c:set var="index" value="${index}" />
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </c:if>

                </div>
                <div class="right">
                    <jsp:include page="right.jsp"/>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <script src="js/slide.js" type="text/javascript"></script>
        <script>
            var slideIndex = ${cur};
            showSlides();
        </script>
    </body>
</html>
