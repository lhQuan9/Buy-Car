package model;

import java.sql.Date;

public class KhachHang {
	private String maKhachHang;
	private String matKhau; 
	private String hoVaTen;
	private String diaChi; // xa, huyen, tinh
	private String diaChi2;
	private String soDienThoai;
	private String email;
	private boolean dangKyNhanBangTin;
	private String maXacThuc;
	private Date thoiGianHieuLucMaXacThuc;
	private boolean trangThaiXacThuc;
	
	public KhachHang() {
	}

	public KhachHang(String maKhachHang, String hoVaTen,String email, String matKhau,
			String diaChi, String diaChi2, String soDienThoai, 
			boolean dangKyNhanBangTin) {
		this.maKhachHang = maKhachHang;
		this.matKhau = matKhau;
		this.hoVaTen = hoVaTen;
		this.diaChi = diaChi;
		this.diaChi2 = diaChi2;
		this.soDienThoai = soDienThoai;
		this.email = email;
		this.dangKyNhanBangTin = dangKyNhanBangTin;
	}

	
	
	
	public KhachHang(String maKhachHang, String matKhau, String hoVaTen, String diaChi, String diaChi2,
			String soDienThoai, String email, boolean dangKyNhanBangTin, String maXacThuc,
			Date thoiGianHieuLucMaXacThuc, boolean trangThaiXacThuc) {
		super();
		this.maKhachHang = maKhachHang;
		this.matKhau = matKhau;
		this.hoVaTen = hoVaTen;
		this.diaChi = diaChi;
		this.diaChi2 = diaChi2;
		this.soDienThoai = soDienThoai;
		this.email = email;
		this.dangKyNhanBangTin = dangKyNhanBangTin;
		this.maXacThuc = maXacThuc;
		this.thoiGianHieuLucMaXacThuc = thoiGianHieuLucMaXacThuc;
		this.trangThaiXacThuc = trangThaiXacThuc;
	}

	public String getMaKhachHang() {
		return maKhachHang;
	}

	public void setMaKhachHang(String maKhachHang) {
		this.maKhachHang = maKhachHang;
	}


	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public String getHoVaTen() {
		return hoVaTen;
	}

	public void setHoVaTen(String hoVaTen) {
		this.hoVaTen = hoVaTen;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getDiaChi2() {
		return diaChi2;
	}

	public void setDiaChi2(String diaChi2) {
		this.diaChi2 = diaChi2;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isDangKyNhanBangTin() {
		return dangKyNhanBangTin;
	}

	public void setDangKyNhanBangTin(boolean dangKyNhanBangTin) {
		this.dangKyNhanBangTin = dangKyNhanBangTin;
	}

	public String getMaXacThuc() {
		return maXacThuc;
	}

	public void setMaXacThuc(String maXacThuc) {
		this.maXacThuc = maXacThuc;
	}

	public Date getThoiGianHieuLucMaXacThuc() {
		return thoiGianHieuLucMaXacThuc;
	}

	public void setThoiGianHieuLucMaXacThuc(Date thoiGianHieuLucMaXacThuc) {
		this.thoiGianHieuLucMaXacThuc = thoiGianHieuLucMaXacThuc;
	}

	public boolean isTrangThaiXacThuc() {
		return trangThaiXacThuc;
	}

	public void setTrangThaiXacThuc(boolean trangThaiXacThuc) {
		this.trangThaiXacThuc = trangThaiXacThuc;
	}

	
}
