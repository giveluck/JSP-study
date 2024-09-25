package com.ssamz.web.controller;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DispatcherServlet
 */
@WebServlet("/*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//1. 사용자 요청 path를 추출합니다.
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"));
		//2. 추출된 path 정보에 따라 요청을 분기 처리합니다.
		if(path.equals("login.do")) {
			System.out.println("로그인 처리");
		}
		
	}

}
