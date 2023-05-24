<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
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
	
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
%>
  <!-- Custom styles for this template -->
   <link href="<%=url%>/css/sign-in.css" rel="stylesheet">
</head>
<body >
<%
					Object obj  = session.getAttribute("khachHang");
					KhachHang khachHang = null;
					if (obj !=null)
						khachHang = (KhachHang)obj;
					
					if (khachHang==null) {
%>

	<h3>Bạn cần <a style="white-space: nowarp;" href = "dangNhap.jsp">
		 Đăng nhập
	</a> </h3>
	
<%
		} else {
    	String baoLoi = request.getAttribute("baoLoi")+"";
		if(baoLoi.equals("null")) {
			baoLoi = "";
		}
 %>
	<main class="form-signin w-100 m-auto">
	
	  <form action="../khach-hang-controller" method="post">
	  
	  
	  
	  <input type="hidden" name="hanhDong" value="doi-mat-khau">
	    <img class="mb-4" src="<%= url %>/img/Logo/Logo.png" alt="" width="250">
	    <h1 class="h3 mb-3 fw-normal">Đổi mật khẩu</h1>
	
	<span style ="color:red">
		<%=baoLoi %>
	</span>
	
	   <div class="form-floating">
	      <input type="password" class="form-control" id="matKhauCu" placeholder="Old Password" fdprocessedid="lucud7" name="matKhauCu">
	      <label for="matKhauCu">Mật khẩu cũ</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="matKhauMoi" placeholder="New Password" fdprocessedid="lucud7" name="matKhauMoi">
	      <label for="matKhauMoi">Mật khẩu mới</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="matKhauMoiLapLai" placeholder="Password" fdprocessedid="lucud7" name="matKhauMoiLapLai">
	      <label for="matKhauMoiLapLai">Nhập lại mật khẩu</label>
	    </div>
	
	    <button class="w-100 btn btn-lg btn-primary" type="submit" fdprocessedid="b5vvta">Lưu</button>
	    <p class="mt-5 mb-3 text-muted">© 1999–2023</p>
	    
	    <jsp:include page="../footer.jsp" />
	    
	  </form>
	</main>
	<% } %>
</body>
</html>