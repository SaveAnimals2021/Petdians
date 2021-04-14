<%--
  Created by IntelliJ IDEA.
  User: m
  Date: 2021-04-12
  Time: 오후 7:36
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>Login</title>

    <!-- Fontfaces CSS-->
    <link href="../../resources/css/font-face.css" rel="stylesheet" media="all">
    <link href="../../resources/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="../../resources/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="../../resources/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="../../resources/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- vendor CSS-->
    <link href="../../resources/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="../../resources/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="../../resources/vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="../../resources/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="../../resources/vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="../../resources/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="../../resources/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="../../resources/css/theme.css" rel="stylesheet" media="all">

</head>
<body class="animsition">
<div class="page-wrapper">
    <div class="page-content--bge5">
        <div class="container">
            <div class="login-wrap">
                <div class="login-content">
                    <div class="login-logo">
                        <a href="#">
                            <img src="/resources/images/icon/petdians-finish.png" alt="Petdians" style="max-width: 70%"/>
                        </a>
                    </div>
                    <div class="login-form">
                        <form action="/login" method="post">
                            <div class="form-group">
                                <label>Admin ID</label>
                                <input class="au-input au-input--full" type="text" name="username" placeholder="ID">
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input class="au-input au-input--full" type="password" name="password" placeholder="Password">
                            </div>
                            <div class="login-checkbox">
                                <label>
                                    <input type="checkbox" name="remember-me">Remember Me
                                </label>
                                <label>
                                    <a href="#">Forgotten Password?</a>
                                </label>
                            </div>
                            <button class="au-btn au-btn--block au-btn--green m-b-20 signinButton" type="submit">sign in</button>
                            <div class="social-login-content">
                                <div class="social-button">
                                    <button class="au-btn au-btn--block au-btn--blue m-b-20">sign in with facebook</button>
                                    <button class="au-btn au-btn--block au-btn--blue2">sign in with twitter</button>
                                </div>
                            </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                        <div class="register-link">
                            <p>
                                Don't you have account?
                                <a href="#">Sign Up Here</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Jquery JS-->
<script src="../../resources/vendor/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JS-->
<script src="../../resources/vendor/bootstrap-4.1/popper.min.js"></script>
<script src="../../resources/vendor/bootstrap-4.1/bootstrap.min.js"></script>
<!-- ../../resources/vendor JS       -->
<script src="../../resources/vendor/slick/slick.min.js">
</script>
<script src="../../resources/vendor/wow/wow.min.js"></script>
<script src="../../resources/vendor/animsition/animsition.min.js"></script>
<script src="../../resources/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
</script>
<script src="../../resources/vendor/counter-up/jquery.waypoints.min.js"></script>
<script src="../../resources/vendor/counter-up/jquery.counterup.min.js">
</script>
<script src="../../resources/vendor/circle-progress/circle-progress.min.js"></script>
<script src="../../resources/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="../../resources/vendor/chartjs/Chart.bundle.min.js"></script>
<script src="../../resources/vendor/select2/select2.min.js">
</script>

<!-- Main JS-->
<script src="../../resources/js/main.js"></script>


<script>

    // const loginBtn = document.querySelector(".signinButton");
    // loginBtn.addEventListener("click", function(e){
    //
    // })


</script>

</body>

</html>
<!-- end document-->