<%--
  Created by IntelliJ IDEA.
  User: Gustavo Pfeifer
  Date: 02/05/2017
  Time: 23:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Users</title>

    <!-- Bootstrap core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="resources/vendor/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link href="resources/vendor/jquery.dataTables/1.10.15/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="resources/app/css/user-form.css" rel="stylesheet">
</head>

<body>

<!-- Fixed navbar -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">CRUD Users&Posts</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="users">Users</a></li>
                <li><a href="#">Posts</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="container theme-showcase" role="main" style="margin-top: 50px;">


    <h1> Users </h1>
        <div class="row">
            <div class="col-md-6 col-lg-6 well">
                <c:if test='${ errorMessage}'>
                <div id="error_message" class="alert alert-danger">
                    The next fieds are required!!
                    <ul>
                        <c:if test='${ empty userForm.name }'>
                            <li><strong>User</strong></li>
                        </c:if>
                        <c:if test='${ empty userForm.email }'>
                                <li><strong>Email</strong></li>
                        </c:if>
                        <c:if test='${ empty userForm.phone }'>
                            <li><strong>Phone</strong></li>
                        </c:if>
                    </ul>
                </div>
                </c:if>
                <form:form method="post" action="user-new"  modelAttribute="userForm">
                    <fieldset>
                        <legend>User</legend>
                        <div class="form-group">
                            <label>Name</label>
                            <c:set value="form-control" var="cssClass"></c:set>
                            <c:if test='${ empty userForm.name  && errorMessage}'>
                                <c:set value="form-control required" var="cssClass"></c:set>
                            </c:if>
                            <form:input id="name_field" path="name"  cssClass="${cssClass}" placeholder="Name"/>
                            <div id="name_error_message" class="alert alert-danger" style="display: none;">
                                <!--<p>This name is already registered</p>-->
                            </div>
                            <div id="name_success_message" class="alert alert-success" style="display: none;">
                                <p>Valid name</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <c:set value="form-control" var="cssClass"></c:set>
                            <c:if test='${ empty userForm.email  && errorMessage}'>
                                <c:set value="form-control required" var="cssClass"></c:set>
                            </c:if>
                            <form:input id="email_field" path="email" cssClass="${cssClass}"      placeholder="Email"/>
                            <div id="email_error_message" class="alert alert-danger" style="display: none;">
                                <!--<p>This email is already registered</p>
                                <p>invalid format</p>-->
                            </div>
                            <div id="email_success_message" class="alert alert-success" style="display: none;">
                                <p>Valid email</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Phone</label>
                            <c:set value="form-control" var="cssClass"></c:set>
                            <c:if test='${ empty userForm.phone  && errorMessage}'>
                                <c:set value="form-control required" var="cssClass"></c:set>
                            </c:if>
                            <form:input id="phone_field" path="phone" cssClass="${cssClass}" placeholder="Phone"/>
                        </div>
                    </fieldset>
                    <fieldset formGroupName="address">
                        <legend>Address</legend>
                        <div class="form-group">
                            <label>Street</label>
                            <form:input path="street" cssClass="form-control" placeholder="Street"/>
                        </div>
                        <div class="form-group">
                            <label>Suite</label>
                            <form:input path="suite" cssClass="form-control" placeholder="Suite"/>
                        </div>
                        <div class="form-group">
                            <label>City</label>
                            <form:input path="city" cssClass="form-control" placeholder="City"/>
                        </div>
                        <div class="form-group">
                            <label>ZipCode</label>
                            <form:input path="zipCode" cssClass="form-control" placeholder="ZipCode"/>
                        </div>
                    </fieldset>
                    <button type="submit" class="btn btn-primary">Save</button>
                </form:form>
            </div>
        </div>
</div> <!-- /container -->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="resources/vendor/jquery/1.12.4/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="resources/app/js/user-form.js"></script>

<script>
    $( document ).ready(function() {
        userFormModule.init({
            "parent_host": '<c:out value="${parentHost}" />'
        });
    });


</script>

</body>
</html>
