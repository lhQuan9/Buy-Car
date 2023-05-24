	package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.KhachHangDAO;
import model.KhachHang;
import util.Email;
import util.MaHoa;
import util.SoNgauNhien;

/**
 * Servlet implementation class KhachHangController
 */
@WebServlet("/khach-hang-controller")
public class KhachHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KhachHangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hanhDong = request.getParameter("hanhDong");
		if (hanhDong.equals("dang-nhap")) {
			dangNhap(request,response);
		}else if (hanhDong.equals("dang-xuat")) {
			dangXuat(request, response);
		}else if (hanhDong.equals("dang-ky")) {
			dangKy(request, response);
		}else if (hanhDong.equals("doi-mat-khau")) {
			doiMatKhau(request, response);
		}else if (hanhDong.equals("thay-doi-thong-tin")) {
			thayDoiThongTin(request, response);
		}
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void dangNhap(HttpServletRequest request, HttpServletResponse response) {
		try {
			String email = request.getParameter("email");
			String matKhau = request.getParameter("matKhau");
			matKhau = MaHoa.toSHA1(matKhau); 

			KhachHang kh = new KhachHang();
			kh.setEmail(email);
			kh.setMatKhau(matKhau);
			
			KhachHangDAO khd = new KhachHangDAO();
			KhachHang khachHang = khd.selectByIdAndPassWord(kh);
			String url = "";
			if (khachHang!= null) {
				HttpSession session = request.getSession();
				session.setAttribute("khachHang", khachHang);
				url = "/index.jsp";
			}else {
				request.setAttribute("baoLoi", "Tên đăng nhập hoặc mật khẩu không chính xác");
				url = "/khachhang/dangNhap.jsp";
			}
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	private void dangXuat(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			//Huy bo session
			session.invalidate();
			
			String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
			
			response.sendRedirect(url+"/index.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void dangKy(HttpServletRequest request, HttpServletResponse response) {
		try {
			String hoVaTen = request.getParameter("hoVaTen");
			String soDienThoai = request.getParameter("soDienThoai");
			String email = request.getParameter("email");
			String matKhau = request.getParameter("matKhau");
			String nhapLaiMatKhau = request.getParameter("nhapLaiMatKhau");
			String diaChi = request.getParameter("diaChi");
			String diaChi2 = request.getParameter("diaChi2");
			String nhanEmail = request.getParameter("nhanEmail");
			request.setAttribute("hoVaTen", hoVaTen);
			request.setAttribute("soDienThoai", soDienThoai);
			request.setAttribute("email", email);
			request.setAttribute("diaChi", diaChi);
			request.setAttribute("diaChi2", diaChi2);
			request.setAttribute("nhanEmail", nhanEmail);
			
			String url = "";
			
			String baoLoi ="";
			KhachHangDAO khachHangDAO = new KhachHangDAO();
			if (khachHangDAO.kiemTraEmail(email)) {
				baoLoi += "Email đã tồn tại, vui lòng chọn Email khác. <br/>";
			}
			
			if (!matKhau.equals(nhapLaiMatKhau)) {
				baoLoi += "Mật khẩu không khớp. <br/>";
			} else {
				matKhau = MaHoa.toSHA1(matKhau);
			}
			
			request.setAttribute("baoLoi", baoLoi);
			
			if (baoLoi.length() > 0) {
				url = "/khachhang/register.jsp";
			}else {
				Random rd = new Random();
				String maKhachHang = System.currentTimeMillis() + rd.nextInt(1000) + "";
				KhachHang kh = new KhachHang(maKhachHang, email, matKhau,hoVaTen, diaChi, diaChi2,soDienThoai, nhanEmail!= null);
				if(khachHangDAO.insert(kh)>0) {
					// dãy số xác thực
					String soNgauNhien = SoNgauNhien.getSoNgauNhien();
					
					// quy định thời gian hiệu lực xác thực
					Date todaysDate = new Date(new java.util.Date().getTime());
					Calendar c = Calendar.getInstance();
					c.setTime(todaysDate);
					c.add(Calendar.DATE, 1);
					Date thoiGianHieuLucMaXacThuc = new Date(c.getTimeInMillis());
					
					// Trạng thái xác thực = false;
					boolean trangThaiXacThuc = false;
					
					kh.setMaXacThuc(soNgauNhien);
					kh.setThoiGianHieuLucMaXacThuc(thoiGianHieuLucMaXacThuc);
					kh.setTrangThaiXacThuc(trangThaiXacThuc);
					
					if(khachHangDAO.updateVerifyInformation(kh)>0) {
						// Gửi email cho khách hàng
						Email.sendEmail(kh.getEmail(),"Xác thực tài khoản MustangCar.vn", getNoiDung(kh));
//						Email.sendEmail("shinnosukevn1999@gmail.com", System.currentTimeMillis()+"", "623");
					};
				};
				url = "/khachhang/thanhCong.jsp";
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void doiMatKhau(HttpServletRequest request, HttpServletResponse response) {
		try {
			String matKhauCu = request.getParameter("matKhauCu");
			String matKhauMoi = request.getParameter("matKhauMoi");
			String matKhauMoiLapLai = request.getParameter("matKhauMoiLapLai");
			
			String matKhauCu_Sha1 = MaHoa.toSHA1(matKhauCu);
			
			String baoLoi = "";
			String url = "/khachhang/doiMatKhau.jsp";
			
			// kiem tra mat khau cu có giong hay khong
			HttpSession session = request.getSession();
			Object obj  = session.getAttribute("khachHang");
			KhachHang khachHang = null;
			if (obj !=null)
				khachHang = (KhachHang)obj;
			
			if (khachHang==null) {
				baoLoi = "Bạn quên chưa đăng nhập";
			}else {
				if(!matKhauCu_Sha1.equals(khachHang.getMatKhau())) {
					baoLoi = "Mật khẩu cũ vẫn chưa chính xác";
				} else {
					if (!matKhauMoi.equals(matKhauMoiLapLai)) {
						baoLoi = "Mật khẩu nhập lại chưa đúng";
					} else {
						String matKhauMoi_Sha1 = MaHoa.toSHA1(matKhauMoi);
						khachHang.setMatKhau(matKhauMoi_Sha1);
						KhachHangDAO khd = new KhachHangDAO();
						if(khd.changePassword(khachHang)) {
							baoLoi = "Đổi mật khẩu thành công";
						} else {
							baoLoi = "Đổi mật khẩu thất bại";
						}
					}
				}
			}
			request.setAttribute("baoLoi", baoLoi);
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void thayDoiThongTin(HttpServletRequest request, HttpServletResponse response) {
		try {
			String hoVaTen = request.getParameter("hoVaTen");
			String soDienThoai = request.getParameter("soDienThoai");
			String email = request.getParameter("email");
			String diaChi = request.getParameter("diaChi");
			String diaChi2 = request.getParameter("diaChi2");
			String nhanEmail = request.getParameter("nhanEmail");
			request.setAttribute("hoVaTen", hoVaTen);
			request.setAttribute("soDienThoai", soDienThoai);
			request.setAttribute("email", email);
			request.setAttribute("diaChi", diaChi);
			request.setAttribute("diaChi2", diaChi2);
			request.setAttribute("nhanEmail", nhanEmail);
			
			String url = "";
			
			String baoLoi ="";
			KhachHangDAO khachHangDAO = new KhachHangDAO();
			
			request.setAttribute("baoLoi", baoLoi);
			
			if (baoLoi.length() > 0) {
				url = "/khachhang/register.jsp";
			}else {
				Object obj  = request.getSession().getAttribute("khachHang");
				KhachHang khachHang = null;
				if (obj !=null)
					khachHang = (KhachHang)obj; 
				if (khachHang!=null) {
					String maKhachHang = khachHang.getMaKhachHang();
					KhachHang kh = new KhachHang(maKhachHang, email,"",hoVaTen, diaChi, diaChi2,soDienThoai, nhanEmail!= null);
					khachHangDAO.updateInfo(kh);
					KhachHang kh2 = khachHangDAO.selectById(kh);
					request.getSession().setAttribute("khachhang", kh2); 
					url = "/khachhang/thanhCong.jsp";
				}
				
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public static String getNoiDung(KhachHang kh) {
		String link = "http://localhost:8080/JSP31/khach-hang/xac-thuc?makhachhang"+kh.getMaKhachHang()+"&maxacthuc="+kh.getMaXacThuc();
		String noiDung = "<p>BoosDDoiwf xin ch&agrave;o bạn <strong>"+kh.getHoVaTen()+"</strong>,</p>\r\n"
				+ "<p>Vui l&ograve;ng x&aacute;c thực t&agrave;i khoản của bạn bằng c&aacute;ch nhập m&atilde; <span style=\"color: #00ccff;\"><strong>"+kh.getMaXacThuc()+" </strong></span>, hoặc click trực tiếp v&agrave;o đường link sau đ&acirc;y:</p>\r\n"
				+ "<p style=\"text-align: center;\"><a href=\""+link+"\"><strong>Click v&agrave;o đ&acirc;y</strong></a></p>\r\n"
				+ "<p style=\"text-align: left;\">Đ&acirc;y l&agrave; email tự động, vui l&ograve;ng kh&ocirc;ng phản hồi email n&agrave;y.</p>\r\n"
				+ "<p style=\"text-align: left;\">Tr&acirc;n trọng cảm ơn.</p>";
//		String noiDung = "tại sao lại bug";
		return noiDung;
	}
	
}
