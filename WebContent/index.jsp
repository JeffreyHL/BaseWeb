<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Eclipse Web Project</title>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<style type="text/css">
	td{
	padding: 2px;
	}
</style>
</head>
<body>

	Eclipse Show Web JSP File!<br>
	<%= new Date().toLocaleString() %><br>
     
     <form action="" method="post" >
	    	<table width="100%" border="0" cellspacing="1" cellpadding="3">
	    		<tr>
	    			<td width="17%" align="right">类说明：</td>
	    			<td><input type="text" name="comment" value=""/></td>
	    		</tr>
	    		<tr>
	    			<td width="17%" align="right">创建人：</td>
	    			<td><input type="text" name="person" value=""/></td>
	    		</tr>
	    		<tr>
	    			<td width="17%" align="right"></td>
	    			<td><input type="submit" value="生成"/></td>
	    		</tr>
	    	</table>
    	</form>
     <%=request.getCharacterEncoding() %>
     
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
    <br>
    <%
        String str = "Hello EL!";
        session.setAttribute("str", str);
        Integer num = 1;
    %>
    ${str}
    
    <br>
    <c:if test="${1 eq 1}">Hello JSTL!</c:if>
    <br>
   
    <c:choose>
    	<c:when test="${num ne 1}">JSTL choose when</c:when>
    	<c:otherwise>JSTL choose otherwise</c:otherwise>
    </c:choose>
    <jsp:useBean id="now" class="java.util.Date" /> 
    <fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss.S E"/>
    
    
    <hr>
    <table>
    	<tr>
    		<td></td>
    		<td>default</td>
    		<td>short</td>
    		<td>medium</td>
    		<td>long</td>
    		<td>full</td>
    	</tr>
    	<tr>
    		<td>both</td>
    		<td><fmt:formatDate value="${now}" type="both" dateStyle="default" timeStyle="default"/></td>
		    <td><fmt:formatDate value="${now}" type="both" dateStyle="short" timeStyle="short"/></td>
		    <td><fmt:formatDate value="${now}" type="both" dateStyle="medium" timeStyle="medium"/></td>
		    <td><fmt:formatDate value="${now}" type="both" dateStyle="long" timeStyle="long"/></td>
		    <td><fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/></td>
    	</tr>
    	<tr>
    		<td>date</td>
   			<td><fmt:formatDate value="${now}" type="date" dateStyle="default"/></td>
			<td><fmt:formatDate value="${now}" type="date" dateStyle="short"/></td>
			<td><fmt:formatDate value="${now}" type="date" dateStyle="medium"/></td>
			<td><fmt:formatDate value="${now}" type="date" dateStyle="long"/></td>
			<td><fmt:formatDate value="${now}" type="date" dateStyle="full"/></td>
    	</tr>
    	<tr>
    		<td>time</td>
    		<td><fmt:formatDate value="${now}" type="time" timeStyle="default"/></td>
			<td><fmt:formatDate value="${now}" type="time" timeStyle="short"/></td>
			<td><fmt:formatDate value="${now}" type="time" timeStyle="medium"/></td>
			<td><fmt:formatDate value="${now}" type="time" timeStyle="long"/></td>
			<td><fmt:formatDate value="${now}" type="time" timeStyle="full"/></td>
    	</tr>
    </table>
	<hr>
	
	<br>[ EEEE, MMMM d, yyyy HH:mm:ss Z ]
	<br><fmt:formatDate value="${now}" type="both" pattern="E, MMM d, yyyy HH:mm:ss Z"/>
	<br>[ d MMM yy, h:m:s a zzzz ]
	<br><fmt:formatDate value="${now}" type="both" pattern="d MMM yy, h:m:s a zzzz"/>
    <br>[ G yyyy年MM月dd日 E ]
	<br><fmt:formatDate value="${now}" pattern="G yyyy年MM月dd日 E"/>
	<br>[ a HH:mm:ss.S z ]
	<br><fmt:formatDate value="${now}" pattern="a HH:mm:ss.S z"/>
	<br>[ G yyyy-MM/MMMM-dd a HH:mm:ss.S E Z z zzzz  ]
	<br><fmt:formatDate value="${now}" pattern="G yyyy-MM/MMMM-dd a HH:mm:ss.S E Z z zzzz "/>
	
</body>
</html>