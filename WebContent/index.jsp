<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BaseWeb Index</title>
<%request.setAttribute("path", request.getContextPath()); %>
<jsp:include page="/js/common/base.jsp"></jsp:include>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		reHeight();
		$(window).resize(reHeight);
	});
	function reHeight(){
		var width = $("body").width();
		if (width < 800){
			$("body").width(800);
		} else {
			$("body").width($(window).width());
		} 
		
		var h_main = $(".main_div div").height();
		var h_main_min = $(window).height()-$("header").height()-$("footer").height()-30;
		if (h_main_min < 400) {
			h_main_min = 400;
		}
		if (h_main < h_main_min){
			$(".main_div").height(h_main_min);
		}
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/page/common/header.jsp"></jsp:include>
	</header>
	<div class="main_div">
		<div>
			<jsp:include page="/page/main.jsp"></jsp:include>
		</div>
	</div>
	<footer>
		<jsp:include page="/page/common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>