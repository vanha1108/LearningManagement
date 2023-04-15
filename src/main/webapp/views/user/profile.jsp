<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>System</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
<div id="wrapper">
    <%@include file="../components/sidebar/sidebar_dashboard.jsp" %>
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-8 col-lg-7">
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <div class="d-flex justify-content-center">
                                    <div class="container h-100">
                                        <div class="d-flex justify-content-center" style="padding: 30px">
                                            <div class="user_regist_card">
                                                <div class="d-flex justify-content-center">
                                                    <div>
                                                        <h2>Profile</h2>
                                                    </div>
                                                </div>
                                                <div class="d-flex justify-content-center">
                                                    <form onsubmit="return checkFormRegist()" id="formLogin" action="<c:url value="/user/profile"/>" method="POST" enctype="multipart/form-data">
                                                        <c:if test="${not empty requestScope.messageParam}">
                                                            <div class="alert alert-${requestScope.alert}" role="alert">
                                                                    ${requestScope.messageParam}
                                                            </div>
                                                        </c:if>
                                                        <div class="row">
                                                            <div class="form-group" style="margin: 10px">
                                                                <label for="username" class="col-form-label">User name</label>
                                                                <input required id="username" value="${sessionScope.USER_APP.username}" name="username" type="text" class="form-control" id="regisName"/>
                                                            </div>
                                                            <div class="form-group" style="margin: 10px">
                                                                <label for="fullName" class="col-form-label">Full name</label>
                                                                <input required id="fullName" value="${sessionScope.USER_APP.fullName}" name="fullName" type="text" class="form-control"/>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="form-group" style="margin: 10px">
                                                                <label for="regisEmail" class="col-form-label">Email</label>
                                                                <input disabled required value="${sessionScope.USER_APP.email}" name="txtEmail" type="email" class="form-control" id="regisEmail">
                                                            </div>
                                                            <div class="form-group" style="margin: 10px">
                                                                <label for="regisPhone" class="col-form-label">Mobile</label>
                                                                <input required  value="${sessionScope.USER_APP.mobile}" name="txtPhone" type="text" class="form-control" id="regisPhone"/>
                                                                <p style="color: red" id="checkPhone"></p>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <button type="submit" class="btn btn-primary">Update profile</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../components/footer/footer.jsp"%>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

    const PATTERN_TEXT = "[A-Za-z0-9]{1,100}";
    const PATTERN_EMAIL = "[A-Za-z0-9]{1,}@[A-Za-z0-9]{1,}";
    const PATTERN_PHONE = "[0-9]{10}";
    const checkFormRegist = () => {
        document.getElementById("checkConfirm").innerHTML = "";
        document.getElementById("checkPhone").innerHTML = "";
        var regisPhone = document.getElementById("regisPhone").value.trim();
        var check = true;

        if (!regisPhone.match(PATTERN_PHONE)) {
            document.getElementById("checkPhone").innerHTML = "invalid phone"
            check = false;
        }
        return check;
    }

</script>
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="js/demo/chart-area-demo.js"></script>
<script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>