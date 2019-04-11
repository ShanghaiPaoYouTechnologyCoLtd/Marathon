package com.apew.marathon.service;

import com.apew.marathon.model.SystemUserModel;

public interface ISystemUserService {
	public SystemUserModel Login(String name, String pwd);
}
