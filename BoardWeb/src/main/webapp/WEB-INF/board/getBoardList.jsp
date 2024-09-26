<%@ page import="java.util.List" %>
<%@ page import="com.ssamz.biz.board.BoardDAO" %>
<%@ page import="com.ssamz.biz.board.BoardVO" %>

<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<%
	//컨트롤러(서블릿)가 모델(DAO)를 이용하여 request에 등록한 글 목록을 가져옵니다
	List<BoardVO> boardList = (List) request.getAttribute("boardList");
%>

<center>

	<!-- 검색 시작 -->
	<form action="/getBoardList.do" method="post">
		<table border="1" cellpadding="0" cellspacing="0" width="700">
		<tr>
			<td align="right">
				<select name="searchCondition">
				<%
				String condition  = (String) session.getAttribute("condition");
				%>
				
				<% if (condition.equals("TITLE")) { %>
				<option value="TITLE" selected>제목
				<% } else { %>
				<option value="TITLE">제목
				<% } %>
				
				<% if (condition.equals("CONTENT")) { %>
				<option value="CONTENT" selected>내용
				<% } else { %>
				<option value="CONTENT">내용
				<% } %>
				
				</select>
				
				<% String keyword = (String) session.getAttribute("keyword"); %>
				<input name="searchKeyword" type="text" value="<%= keyword %>"/>
				<input type="submit" value="검색"/>
			</td>
		</tr>
		</table>
	</form>
	<!-- 검색 종료 -->
	
	<table border="1" cellpadding="0" cellspacing="0" width="700">
		<tr>
			<th bgcolor="orange" width="100">번호</th>
			<th bgcolor="orange" width="200">제목</th>
			<th bgcolor="orange" width="150">작성자</th>
			<th bgcolor="orange" width="150">등록일</th>
			<th bgcolor="orange" width="100">조회수</th>
		</tr>

		<% for(BoardVO board : boardList) { %>
		<tr>
			<td><%= board.getSeq() %></td>
			<td align="left"><a href="getBoard.do?seq=<%= board.getSeq()%>"><%= board.getTitle() %></a></td>
			<td><%= board.getWriter() %></td>
			<td><%= board.getRegDate() %></td>
			<td><%= board.getCnt() %></td>
		</tr>
		<% } %>
		
	</table>
	
</center>
		
<%--
for (BoardVO board : boardList){
	out.print(board.getSeq() + " : " + board.getTitle() + " : "  +
			board.getContent() + "<br>");
}
--%>
	
<%@ include file="../layout/footer.jsp" %>





