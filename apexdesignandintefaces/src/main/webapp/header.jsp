<%--
    Document   : header
    Created on : Mar 15, 2021, 10:32:53 AM
    Author     : Sebastian
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="apexTheme.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="cartStyle.css">
<link rel="stylesheet" href="footerStickify.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="signUpFunctions.js"></script>
<script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>

<script>
<!--Code given by Mahadev last semester that prevents people from clicking the back button once logged out. This makes it so that people can't get on the computer and into your account right after they log off and walk away from the computer. -->
        function preventBack() {
            window.history.forward();
        }
    setTimeout("preventBack()", 0);
        window.onunload = function () {
            null
    };

    </script>
    <div id="home"> <!--this id makes it so that we can make a button on the page that says "take me to the top" -->
        <!--Top bar with Logo, website name, address -->
        <div class="w3-bar w3-theme w3-padding">
            <div class="w3-col s2"><img src="Images/apexLogo.png" alt="apexLogo" class="logo"/></div>
            <div class="w3-col s8 w3-center"><h1>Apex Design and Interfaces</h1></div>
            <div class="w3-col s2 w3-right-align"> <p>732 Bridge Cr. <br>Waltham, MA 02452</p>
                <a href="cart.jsp" class="cart w3-bar-item w3-right w3-button w3-theme-l2">
                    <ion-icon name="cart-Outline"></ion-icon>Cart <span>0</span>
                </a>
            </div>
        </div>
    <% // session control
        String logged = (String) session.getAttribute("logged");
        String name = (String) session.getAttribute("name");
        String email = (String) session.getAttribute("email");
        boolean testEnable = false;
    %>
    <!--Second bar down, has buttons with drop down on left and sign up on the right -->
    <div class="w3-bar w3-theme-d2">
        <div class="w3-col s4">
            <a href="index.jsp" class="w3-bar-item w3-button w3-theme-l1 w3-medium"><i class="fa fa-home w3-margin-right"></i>Home</a>
            <div class="w3-dropdown-hover w3-medium">
                <button class="w3-button">Products <i class="fa fa-caret-down"></i></button>
                <div class="w3-dropdown-content w3-card-4 w3-bar-block">
                    <a href="allproducts.jsp" class="w3-bar-item w3-button">All Products</a>
                    <a href="laptops.jsp" class="w3-bar-item w3-button">Laptops</a>
                    <a href="desktops.jsp" class="w3-bar-item w3-button">Desktops</a>
                    <a href="tv.jsp" class="w3-bar-item w3-button">TVs</a>
                    <a href="videogames.jsp" class="w3-bar-item w3-button">Video Games/Consoles</a>
                    <a href="audiovideo.jsp" class="w3-bar-item w3-button">Audio/Video</a>
                </div>
            </div>
            <a href="deals.jsp" class="w3-bar-item w3-button w3-medium">Deals!</a>
            <%
                if (testEnable == true) {
                    out.println("<a href='#' class='w3-bar-item w3-button w3-medium w3-text-red'>TEST ON!</a>");
                }
            %>

        </div>
        <div class="w3-col s4">
            <form name="searchbar" action="searchAction.jsp" method="POST" class="w3-medium w3-center">
                <input class="w3-border" required type="text" placeholder="Search for Products" name="search" id="search">
                <input class="w3-button w3-theme-l1" type="submit" value="Search"/>
            </form>
        </div>

        <div class="w3-col s4" id="portals">
            <a href="loginPortal.jsp" class="w3-bar-item w3-right w3-button w3-theme-l1">Login</a>
        </div>
        <div class="w3-col s4" id="logout">
            <a href="logoutAction.jsp" onclick="localStorage.clear();" class="w3-bar-item w3-right w3-button w3-theme-l1">Logout</a>
            <div class="w3-bar-item w3-right w3-theme-l1 w3-border-right">Welcome: <%= name%></div>
            <%
                if (logged != null) {
                    /* Show the appropriate pages for customer and admin. */
                    if (logged.equals("1")) {
                        out.println("<a href='customerHome.jsp' class='w3-bar-item w3-right w3-button w3-theme-l1 w3-border-right'>Home</a>");
                    } 
                    else if (logged.equals("0")) {
                        out.println("<a href='administrator.jsp' class='w3-bar-item w3-right w3-button w3-theme-l1 w3-border-right'>Admin</a>");
                    } 
                    else {
                        // Do nothing. This is to catch when someone fails to log in and logged is set to index.
                        //out.println("<a href='dummy.jsp' class='w3-bar-item w3-right w3-button w3-theme-l1 w3-border-right'>dummy</a>");
                    }

                }
            %>
        </div>
    </div>
</div>
