<%@page import="com.ssamz.biz.board.BoardDAO"%>
<%@page import="com.ssamz.biz.board.BoardVO"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
	//사용자 정보 추출
	String seq = request.getParameter("seq");
	//DB 연동 처리
	BoardVO vo = new BoardVO();
	vo.setSeq(Integer.parseInt(seq));
	
	BoardDAO dao = new BoardDAO();
	dao.deleteBoard(vo);
	
	//3. 화면 이동
	RequestDispatcher disapDispatcher = request.getRequestDispatcher("index.jsp");
	disapDispatcher.forward(request, response);
%>