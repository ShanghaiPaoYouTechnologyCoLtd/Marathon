package com.apew.marathon.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


public class EncodingFilter implements Filter {

	private String encoding;
	
	@Override
	public void destroy() {
		//do nothing
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		if (encoding != null) {
			request.setCharacterEncoding(encoding);
			//logger.info("Request encoding is set to " + encoding);
		}
		try {
			chain.doFilter(request, response);
		} catch (Exception e) {
			//logger.info("路径不存在");
		}

	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
		this.encoding = filterConfig.getInitParameter("encoding");

	}

}
