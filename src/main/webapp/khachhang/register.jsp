<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Đăng ký</title>
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
		String baoLoi = request.getAttribute("baoLoi") + "";
		baoLoi = (baoLoi.equals("null"))?"":baoLoi;
		
		String email = request.getAttribute("email") +"";
		email = (email.equals("null"))?"":email;
		
		String hoVaTen= request.getAttribute("hoVaTen") +"";
		hoVaTen = (hoVaTen.equals("null"))?"":hoVaTen;
		
		String diaChi= request.getAttribute("diaChi") +"";
		diaChi = (diaChi.equals("null"))?"":diaChi;
		
		String diaChi2= request.getAttribute("diaChi2") +"";
		diaChi2 = (diaChi2.equals("null"))?"":diaChi2;
		
		String soDienThoai= request.getAttribute("soDienThoai") +"";
		soDienThoai = (soDienThoai.equals("null"))?"":soDienThoai;
		
		String nhanEmail= request.getAttribute("nhanEmail") +"";
		nhanEmail = (nhanEmail.equals("null"))?"":nhanEmail;
	%>
	<div class="row g-5"> 
			<div class="col-md-7 col-lg-8">
				<h4 class="mb-3">Đăng ký</h4>
				<div class="red" id="baoLoi">
					<%= baoLoi %>
				</div>
				<form class="needs-validation" novalidate="" action="../khach-hang-controller" method="post">
				<input type="hidden" name="hanhDong" value="dang-ky">
					<div class="row g-3">
						<div class="col-sm-6">
							<label for="hoVaTen" class="form-label">Họ và tên<span class="red">*</span></label> 
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
							<label for="email" class="form-label">Email<span class="red">*</span></label> 
							<input type="email" class="form-control" id="email"
								placeholder="you@example.com" required name="email" value="<%=email%>">
							<div class="invalid-feedback">Please enter a valid email
								address for sign-up.</div>
							<div id="emailHelp" class="form-text">We'll never share your
								email with anyone else.</div>
						</div>
	
						<div class="col-12">
							<label for="matKhau" class="form-label">Mật khẩu<span class="red">*</span></label> 
							<input type="password" id="matKhau" class="form-control" name="matKhau"
								aria-describedby="passwordHelpBlock" required onkeyup="kiemTraMatKhau()">
							<div id="passwordHelpBlock" class="form-text">Your password
								must be 8-20 characters long, contain letters and numbers, and
								must not contain spaces, special characters, or emoji.</div>
						</div>
	
						<div class="col-12">
							<label for="nhapLaiMatKhau" class="form-label">Nhập lại
								mật khẩu<span class="red">*</span><span id="msg" class="red"></span></label> 
								<input type="password" id="nhapLaiMatKhau" name="nhapLaiMatKhau"
								class="form-control" aria-describedby="passwordHelpBlock" required onkeyup="kiemTraMatKhau()">
							<div id="passwordHelpBlock" class="form-text">Your password
								must be 8-20 characters long, contain letters and numbers, and
								must not contain spaces, special characters, or emoji.</div>
						</div>
	
						<div class="col-12">
							<label for="address" class="form-label">Địa chỉ<span class="red">*</span></label> 
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
							<input type="checkbox" class="form-check-input" id="dongYDieuKhoan"
							 required="required" onchange="kiemTraDongY()" name="dongYDieuKhoan">
							<label class="form-check-label" for="dongYDieuKhoan" >
							Đồng ý điều khoản công ty<span class="red">*</span></label>
						</div>
	
						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="save-info" name="nhanEmail">
							<label class="form-check-label" for="save-info">
							Đồng ý nhận email</label>
						</div>
	
						<div class="col-12">
							<button type="submit" class="btn btn-primary" id="submit" style="visibility: hidden;">Sign in</button>
						</div>
					</div>
				</form>
			</div>
	 	</div>  
	 	
	 	<!-- Footer -->
		<jsp:include page="../footer.jsp" />
	<!-- End Footer -->
	
</body>

<script type="text/javascript">
	function kiemTraMatKhau() {
		matKhau = document.getElementById("matKhau").value;
		matKhauNhapLai = document.getElementById("nhapLaiMatKhau").value;	
		if(matKhau != matKhauNhapLai) {
			document.getElementById("msg").innerHTML ="Mật khẩu không khớp!";
			return false;
		}else{
			document.getElementById("msg").innerHTML ="";
			return true;
		}
	}

	function kiemTraDongY() {
		dongYDieuKhoan = document.getElementById("dongYDieuKhoan");
		if(dongYDieuKhoan.checked==true) {
			document.getElementById("submit").style.visibility="visible";
		}else{
			document.getElementById("submit").style.visibility="hidden";
		}
	}
</script>
</html>