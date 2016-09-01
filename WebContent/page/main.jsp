<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Eclipse Web Project</title>
<style type="text/css">
	.main div{
		background: #FFF;
		float: left;
		padding: 5px 8px;
		margin: 2px;
		height: 100px;
		border: 1px solid #FFF;
	}
	.main div:HOVER {
		background: #9BCDF7;
	}
</style>
<script type="text/javascript">
	function getImage(){
		$("#image").attr("src", "${path}/HelloServlet?ts="+new Date().getTime());
	}
</script>
</head>
<body>
     <div class="main">
     	
     	<div>
     		图片验证码
			<br>
			<img alt="验证码" id="image" src="${path}/HelloServlet" onclick="getImage();" title="单击更换图片">
			<br>
			<input type="button" value="换一张" onclick="getImage();">
			
     	</div>
     	
     	<div>
	     	<form action="" method="post">
		    	<table width="100%" border="0" cellspacing="1" cellpadding="3">
		    		<tr>
		    			<td width="40%" align="right">类说明：</td>
		    			<td><input type="text" name="comment" value=""/></td>
		    		</tr>
		    		<tr>
		    			<td width="40%" align="right">创建人：</td>
		    			<td><input type="text" name="person" value=""/></td>
		    		</tr>
		    		<tr>
		    			<td width="40%" align="right">
		    				<%=request.getCharacterEncoding() %>
		    			</td>
		    			<td><input type="submit" value="生成"/></td>
		    		</tr>
		    	</table>
	    	</form>
		     
		     
		     <%
		    	if(request.getMethod().toLowerCase().equals("post")){
		    		String comment = request.getParameter("comment");
		    		String person = request.getParameter("person");
		        	%>
		        	<script type="text/javascript">
		        		$("input[name=comment]").val("<%=comment%>");
		        		$("input[name=person]").val("<%=person%>");
		        	</script>
		        	<%
		    	}
		    %>
     	</div>
     	
		<div>
			EL and Session
			<br>
			<%
				String str = "Hello EL";
				session.setAttribute("el", str);
			%>
			${el}
			<br>
			${str}
		</div>
     
	    <div>
	    	JSTL Test
		    <br>
		    <c:if test="${1 eq 1}">if</c:if>
		    <br>
		    <c:choose>
		    	<c:when test="${1 eq 1}">choose when</c:when>
		    	<c:otherwise>choose otherwise</c:otherwise>
		    </c:choose>
	    </div>
	    
		<div>
			时间格式
			<jsp:useBean id="now" class="java.util.Date" />
			<br>
			<%= new Date().toLocaleString() %>
			<br>
			Eg: pattern="G yyyy-MM/MMMM-dd a HH:mm:ss.S E Z z zzzz || D W w"
			<br>
			<fmt:formatDate value="${now}" pattern="G yyyy-MM/MMMM-dd a HH:mm:ss.SSS E Z z zzzz || D W w"/>
		</div>
	</div>
</body>
</html>