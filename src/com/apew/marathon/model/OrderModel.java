package com.apew.marathon.model;

public class OrderModel {
	
	//主键ID
	private Long id;
	
	//订单号
	private String serialNum;
	
	//姓名
	private String userName;
	
	//性别：1：男  2：女
	private int sex;
	
	//证件类型：1。身份证/2。台胞证/3。护照/4.军官证
	private int cardType;
	
	//证件号
	private String cardNo;
	
	private String phoneNo;
	
	//'1:支付宝'
	private int payType;
	
	//商户流水号
	private String outTradeNo;
	
	//'-1支付失败  0： 未支付 1：已支付'
	private int tradeState;
	
	//
	private float payFee;
	
	//下单时间
	private String orderTime;
	
	//支付时间
	private String payTime;
	
	//创建时间
	private String createTime;
	
	//合作方
	private String cooperaterName;
	
	private String province;
	private String city;
	private String district;
	private String address;
	
	public String getProvince(){
		return province;
	}

	public void setProvince(String p){
		province=p;
	}
	
	public String getCity(){
		return city;
	}

	public void setCity(String p){
		city=p;
	}
	
	public String getDistrict(){
		return district;
	}

	public void setDistrict(String p){
		district=p;
	}
	
	public String getAddress(){
		return address;
	}

	public void setAddress(String p){
		address=p;
	}
	
	public String getCooperateName(){
		return cooperaterName;
	}

	public void setCooperaterName(String coname){
		cooperaterName=coname;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSerialNum() {
		return serialNum;
	}

	public void setSerialNum(String serialNum) {
		this.serialNum = serialNum;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public int getCardType() {
		return cardType;
	}

	public void setCardType(int cardType) {
		this.cardType = cardType;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public int getPayType() {
		return payType;
	}

	public void setPayType(int payType) {
		this.payType = payType;
	}

	public String getOutTradeNo() {
		return outTradeNo;
	}

	public void setOutTradeNo(String outTradeNo) {
		this.outTradeNo = outTradeNo;
	}

	public int getTradeState() {
		return tradeState;
	}

	public void setTradeState(int tradeState) {
		this.tradeState = tradeState;
	}

	public float getPayFee() {
		return payFee;
	}

	public void setPayFee(float payFee) {
		this.payFee = payFee;
	}

	public String getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}

	public String getPayTime() {
		return payTime;
	}

	public void setPayTime(String payTime) {
		this.payTime = payTime;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}
