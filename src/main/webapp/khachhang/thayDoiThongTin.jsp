<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin khách hàng</title>
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
</head>
<body>
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
    	
 %>
 
<!--  <div class="container">-->			<!-- tại sao lại bỏ vào div container? -->
	<%
		String baoLoi = request.getAttribute("baoLoi") + "";
		baoLoi = (baoLoi.equals("null"))?"":baoLoi;
		
		
		String hoVaTen= khachHang.getEmail();
		
		String soDienThoai= khachHang.getSoDienThoai();
		
		String email = khachHang.getHoVaTen(); // chỗ này éo hiểu sao lại bug, có thì sửa lại
		
		String diaChi= khachHang.getDiaChi();
		
		String diaChi2= khachHang.getDiaChi2();
		
		
		Boolean nhanEmail= khachHang.isDangKyNhanBangTin();
	%>
	<div class="row g-5"> 
			<div class="col-md-7 col-lg-8">
				<h4 class="mb-3">Thay đổi thông tin</h4>
				<div class="red" id="baoLoi">
					<%= baoLoi %>
				</div>
				<form class="needs-validation" novalidate="" action="../khach-hang-controller" method="post">
				<input type="hidden" name="hanhDong" value="thay-doi-thong-tin">
					<div class="row g-3">
						<div class="col-sm-6">
							<label for="hoVaTen" class="form-label">Họ và tên</label> 
							<input type="text" class="form-control" id="hoVaTen" placeholder=""
								value="" required name="hoVaTen" value="<%=hoVaTen%>">
							<div class="invalid-feedback">Valid first name is required.
							</div>
						</div>
	
						<div class="col-sm-6">
							<label for="dienThoai" class="form-label">Số điện thoại</label> 
							<input type="tel" class="form-control" id="dienThoai" placeholder=""
								value="" required="" name="soDienThoai" value="<%=soDienThoai%>">
							<div class="invalid-feedback">Valid first name is required.
							</div>
						</div>
	
						<div class="col-12">
							<label for="email" class="form-label">Email</label> 
							<input type="email" class="form-control" id="email"
								placeholder="you@example.com" required name="email" value="<%=email%>">
							<div class="invalid-feedback">Please enter a valid email
								address for sign-up.</div>
							<div id="emailHelp" class="form-text">We'll never share your
								email with anyone else.</div>
						</div>
	
						<div class="col-12">
							<label for="address" class="form-label">Địa chỉ</label> 
							<input type="text" class="form-control" id="address"
								placeholder="1234 Main St" required name="diaChi" value="<%=diaChi%>">
							<div class="invalid-feedback">Please enter your shipping
								address.</div>
						</div>
	
						<div class="col-12">
							<label for="address2" class="form-label">Địa chỉ thứ 2<span
								class="text-muted">(Không bắt buộc)</span></label> 
								<input type="text" name="diaChi2"
								class="form-control" id="address2"
								placeholder="Apartment or suite" value="<%=diaChi2%>">
						</div>
	
	
	
						<hr class="my-4">
	
						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="save-info" name="nhanEmail" <%=(nhanEmail?"checked":"")%>>
							<label class="form-check-label" for="save-info" >
							Đồng ý nhận email</label>
						</div>
	
						<div class="col-12">
							<button type="submit" class="btn btn-primary" id="submit" >Sign in</button>
						</div>
					</div>
				</form>
			</div>
	 	</div>  
<!--  </div>  -->
	<%} %> 	
	
	<jsp:include page="../footer.jsp" />
	
</body>

</html>