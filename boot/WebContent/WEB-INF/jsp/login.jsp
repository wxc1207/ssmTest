<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录界面</title>
<!--引入外部的bootstrap中的css文件-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/bootstrap.min.css">
    <!--jQuery文件务必在bootstrap.min.js之前引入-->
	<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
	 <!--再引入bootstrap.min.js-->
	<script type="text/javascript"
    src="${pageContext.request.contextPath }/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript">

		function check() {
			var user_code = $("#user_code").val();
			var user_password = $("#user_password").val();
			
			//alert(user_code+" --- "+user_password); 
			
			if (user_code == "" || user_password == "") {
				//$("#message").text("账号或密码不能为空!");
				alert("账号或密码不能为空!");
				return false;
			}
			return true;
		}
	</script>
	
	<style type="text/css">
		.middle {
		float: none;
		display: inline-block;
		vertical-align: middle;
		}
	</style>
</head>
<body background = "${pageContext.request.contextPath }/images/login.jpg">
<form  class="bs-example bs-example-form" role="form" action="${pageContext.request.contextPath }/login.action" method="post" onsubmit="return check();">
	
	<div style=" width: 100%;height: 100%;src:" >
	
			<!-- style="padding: 300px 300px 10px;" border:5px solid black; border:1px solid blue; -->
		<div  style="margin-left: 50%;margin-top:15%;width: 30%;height: 80%;  ">
			<div style="margin-left: 9%;margin-top: 10%;margin-bottom: 10%;width: 80%;height: 90%; ">
				<font size="5" color="black" ><b>欢迎使用BOOT客户管理系统</b></font>
				<br>
				<br>
				<br>
		    	<span>${msg }</span>
		        <div class="input-group">
		            <span class="input-group-addon" >用户账号：</span>
		            <input type="text" name="usercode" id="user_code" class="form-control" placeholder="请输入用户账号" style="width: 250px">
		        </div>
		        <br>
		        <div class="input-group">
		            <span class="input-group-addon">用户密码：</span>
		            <input type="password" name="password" id="user_password" class="form-control" 
		            placeholder="请输入用户密码" style="width: 250px">
		        </div>
		        <br> 
		        <div style="margin-left: 32%;">
		         	<button type="input" class="btn btn-primary" >登录</button>  
		         </div> 
		     </div>
		</div>
	</div>
</form>
</body>
</html>