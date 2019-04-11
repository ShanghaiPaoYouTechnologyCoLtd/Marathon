package com.apew.marathon.service.impl;

import org.springframework.stereotype.Service;

import com.alipay.util.MD5Util;
import com.apew.marathon.model.SystemUserModel;
import com.apew.marathon.service.BaseService;
import com.apew.marathon.service.ISystemUserService;

@Service("systemUserService")
public class SystemUserServiceImpl extends BaseService<SystemUserModel> implements ISystemUserService{

	@Override
	public SystemUserModel Login(String name, String pwd) {
		String sql="select * from web_sys_user where LoginName=? and password=?";
		SystemUserModel m=queryForObject(sql,new Object[]{name,pwd},SystemUserModel.class);
		return m;
	}

}
