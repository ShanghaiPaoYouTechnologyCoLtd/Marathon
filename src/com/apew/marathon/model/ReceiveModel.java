package com.apew.marathon.model;

public class ReceiveModel {
	public int ID;
	public int OrderID;
	public int PayType;
	public String PayTime;
	public String Phone;
	public String Province;
	public String City;
	public String District;
	public String Address;
	public int Status;
	public String ExpressNo;
	public String ExpressCo;
	public float PayFee;
	public String TradeNo;
	public String OutTradeNo;
	public String getOutTradeNo() {
		return OutTradeNo;
	}
	public void setOutTradeNo(String iD) {
		OutTradeNo = iD;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public int getOrderID() {
		return OrderID;
	}
	public void setOrderID(int orderID) {
		OrderID = orderID;
	}
	public int getPayType() {
		return PayType;
	}
	public void setPayType(int payType) {
		PayType = payType;
	}
	public String getPayTime() {
		return PayTime;
	}
	public void setPayTime(String payTime) {
		PayTime = payTime;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getProvince() {
		return Province;
	}
	public void setProvince(String province) {
		Province = province;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getDistrict() {
		return District;
	}
	public void setDistrict(String district) {
		District = district;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public int getStatus() {
		return Status;
	}
	public void setStatus(int status) {
		Status = status;
	}
	public String getExpressNo() {
		return ExpressNo;
	}
	public void setExpressNo(String expressNo) {
		ExpressNo = expressNo;
	}
	public String getExpressCo() {
		return ExpressCo;
	}
	public void setExpressCo(String expressCo) {
		ExpressCo = expressCo;
	}
	public float getPayFee() {
		return PayFee;
	}
	public void setPayFee(float payFee) {
		PayFee = payFee;
	}
	public String getTradeNo() {
		return TradeNo;
	}
	public void setTradeNo(String tradeNo) {
		TradeNo = tradeNo;
	}
	
}
