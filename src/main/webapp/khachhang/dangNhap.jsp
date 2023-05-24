<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng Nhập</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js"
	integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk"
	crossorigin="anonymous"></script>
<style type="text/css">
	.red {
		color:red; 
	}
</style>

<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
%>
  <!-- Custom styles for this template -->
   <link href="<%=url%>/css/sign-in.css" rel="stylesheet">
    
</head>
<body>

<main class="form-signin w-100 m-auto">
   <form class="text-center" action="../khach-hang-controller" method="post">
   <input type="hidden" name="hanhDong" value="dang-nhap">
   									
    <img class="mb-4" src="<%=url %>/img/Logo/Logo.png" alt="" width="250">
    <h1 class="h3 mb-3 fw-normal">Đăng Nhập</h1>
    <%
    	String baoLoi = request.getAttribute("baoLoi")+"";
		if(baoLoi.equals("null")) {
			baoLoi = "";
		}
    %>
	<div class="text-center" ><span class="red" ><%=baoLoi %></span></div>
    <div class="form-floating">
      <input type="email" class="form-control" id="email" placeholder="name@example.com" name="email">
      <label for="email">Email address</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="matKhau" placeholder="Password" name="matKhau">
      <label for="matKhau">Password</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
    <a href="register.jsp">Bạn chưa có tài khoản?Tạo tài khoản mới</a>
    <p class="mt-5 mb-3 text-muted">&copy; 1999–2023</p>
    
    
<!-- Footer -->
		<jsp:include page="../footer.jsp" />
	<!-- End Footer -->
  </form>
</main>

</body>
</html>