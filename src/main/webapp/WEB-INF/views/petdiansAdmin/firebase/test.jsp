<%--
  Created by IntelliJ IDEA.
  User: m
  Date: 2021-03-29
  Time: 오후 5:05
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../../includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>



<script src="https://use.fontawesome.com/releases/v5.12.0/js/all.js"></script>

<!-- Firebase App (the core Firebase SDK) is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/8.3.1/firebase-app.js"></script>

<!-- If you enabled Analytics in your project, add the Firebase SDK for Analytics -->
<script src="https://www.gstatic.com/firebasejs/8.3.1/firebase-analytics.js"></script>

<!-- Add Firebase products that you want to use -->
<script src="https://www.gstatic.com/firebasejs/8.3.1/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.3.1/firebase-firestore.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.3.1/firebase-messaging.js"></script>


<!-- MAIN CONTENT-->
<script>
    <%@ include file="firebaseKey.js" %>
    const messaging = firebase.messaging();

    console.log(messaging);

    // Handle incoming messages. Called when:
    // - a message is received while the app has focus
    // - the user clicks on an app notification created by a service worker
    //   `messaging.onBackgroundMessage` handler.
    messaging.onMessage((payload) => {
        console.log('Message received. ', payload);
        // ...
    });



</script>

<%@ include file="../../includes/footer.jsp" %>