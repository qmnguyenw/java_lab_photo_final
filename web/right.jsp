<%-- 
    Document   : right
    Created on : Aug 15, 2021, 4:34:21 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../static/css/right.css" type="text/css"/>
        <link
			href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
			rel="stylesheet"
		/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="header-right">
      <h4>Share this page</h4>
    </div>
    <div class="social">
      <div>
        <ul>
          <li>
            <i class="fa fa-facebook-square"></i><a href="${contact.face_url}"
              ><span>Share on Facebook</span></a
            >
          </li>
          <li>
            <i class="fa fa-twitter-square"></i><a
              href="${contact.twitter_url}"
              ><span>Share on Twitter</span></a
            >
          </li>
          <li>
            <i class="fa fa-google-plus-square"></i><a href="${contact.google_url}"
              ><span>Share on Google</span></a
            >
          </li>
        </ul>
      </div>
    </div>
    </body>
</html>
