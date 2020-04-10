<%@page import="com.github.pagehelper.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<!-- 引入2个Bootstrap的文件
		引入jQuery文件
	 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/bootstrap.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript">
//清空新建客户窗口中的数据
	function clearCustomer() {
	    $("#new_customerName").val("");
	    $("#new_customerFrom").val("")
	    $("#new_custIndustry").val("")
	    $("#new_custLevel").val("")
	    $("#new_linkMan").val("");
	    $("#new_phone").val("");
	    $("#new_mobile").val("");
	    $("#new_zipcode").val("");
	    $("#new_address").val("");
	}
	
	// 创建客户
	function createCustomer() {
	$.post("<%=basePath%>customer/create.action",
	$("#new_customer_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("客户创建成功！");
	            window.location.reload();
	        }else{
	            alert("客户创建失败！");
	            window.location.reload();
	        }
	    });
	}
	 // 执行修改客户操作
	function updateCustomer() {
		$.post("<%=basePath%>customer/update.action",$("#edit_customer_form").serialize(),function(data){
			if(data =="OK"){
				alert("客户信息更新成功！");
				window.location.reload();
				/* js刷新页面 */
			}else{
				alert("客户信息更新失败！");
				window.location.reload();
			}
		});
	}
	 
	// 通过id获取修改的客户信息
	function editCustomer(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>customer/getCustomerById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_cust_id").val(data.cust_id);
	            $("#edit_customerName").val(data.cust_name);
	            $("#edit_customerFrom").val(data.cust_source)
	            $("#edit_custIndustry").val(data.cust_industry)
	            $("#edit_custLevel").val(data.cust_level)
	            $("#edit_linkMan").val(data.cust_linkman);
	            $("#edit_phone").val(data.cust_phone);
	            $("#edit_mobile").val(data.cust_mobile);
	            $("#edit_zipcode").val(data.cust_zipcode);
	            $("#edit_address").val(data.cust_address);
	            
	        }
	    });
	}
	// 删除客户
	function deleteCustomer(id) {
	    if(confirm('确实要删除该客户吗?')) {
	$.post("<%=basePath%>customer/delete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("客户删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除客户失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
	</script>
</head>
<body>
	<!--上面-->
	<div style="width: 100%; height: 60px; margin-top: 1%;">
		<div style="float: left;">
			<h3>BOOT客户管理系统</h3>
		</div>
		<div style="margin-left: 85%;">

			<!-- ********** -->
			<div class="dropdown" style="float: left;">
				<button class="btn btn-primary" type="button"
					id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">

					<span class="glyphicon glyphicon-envelope"></span>

				</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<li><a href="#">1点半去开会</a></li>
					<li><a href="#">2点去参加第二轮面试</a></li>

					<li class="divider"></li>
					<li><a href="#">查看更多消息</a></li>
				</div>
			</div>
			<!-- 2 -->
			<div class="dropdown" style="float: left; margin-left: 10px;">
				<button class="btn btn-primary" type="button"
					id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">

					<span class="glyphicon glyphicon-tasks"></span>

				</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<div class="progress progress-striped">
						<div class="progress-bar progress-bar-success" role="progressbar"
							aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
							style="width: 50%;">
							<span class="sr-only">90%</span>
						</div>
					</div>
					<div class="progress progress-striped">
						<div class="progress-bar progress-bar-info" role="progressbar"
							aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
							style="width: 30%;">
							<span class="sr-only">30% 完成（信息）</span>
						</div>
					</div>
					<div class="progress progress-striped">
						<div class="progress-bar progress-bar-warning" role="progressbar"
							aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
							style="width: 20%;">
							<span class="sr-only">20% 完成（警告）</span>
						</div>
					</div>
					<div class="progress progress-striped">
						<div class="progress-bar progress-bar-danger" role="progressbar"
							aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
							style="width: 10%;">
							<span class="sr-only">10% 完成（危险）</span>
						</div>
					</div>
					<li class="divider"></li>
					<li><a href="#">查看更多任务情况</a></li>
				</div>
			</div>
			<!-- 3 -->
			<div class="dropdown" style="float: left; margin-left: 10px;">
				<button class="btn btn-primary" type="button"
					id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">

					<span class="glyphicon glyphicon-bell"></span>

				</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<li><a href="#">吃饭吃饭</a></li>
					<li><a href="#">睡觉睡觉</a></li>

					<li class="divider"></li>
					<li><a href="#">查看更多消息</a></li>
				</div>
			</div>

			<!-- 4 -->
			<div class="dropdown" style="float: left; margin-left: 10px;">
				<button class="btn btn-primary" type="button"
					id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">

					<span class="glyphicon glyphicon-user"></span>

				</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<li><a href="#">用户：${USER_SESSION.user_name }</a></li>
					<li><a href="#">系统设置</a></li>

					<li class="divider"></li>
					<li><a href="#">退出登录</a></li>
				</div>
			</div>

			<!-- *********** -->

		</div>
	</div>
	<!--清除-->
	<!--<div style="clear: both;"></div>-->
	<!--下面-->
	<div style="width: 100%; height: 70%;">
		<!-- 左侧 -->
		<div style="float: left; width: 15%; height: 100px;">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="搜索内容..."
					width="40px">

			</div>
			<div style="float: right">
				<button type="button" class="btn btn-primary">搜索</button>
			</div>
			<br /> <br /> <br />
			<div style="clear: both;"></div>


			<ul class="nav nav-pills nav-stacked">
				<li class="active"><a href="#">客户管理</a></li>
				<li><a href="#">客户拜访</a></li>
				<li><a href="#">查看更多功能...</a></li>
			</ul>
		</div>
	</div>
	<div>
		<!-- 右侧 -->
		<div
			style="float: left; margin-left: 2%; margin-top: 1%; width: 80%; height: 100%;">
			<!-- /.row -->
			<h2>客户管理</h2>
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline" method="get"
						action="${pageContext.request.contextPath }/customer/list.action">
						<div class="form-group">
							<label for="customerName">客户名称</label> <input type="text"
								class="form-control" id="customerName" value="${custName }"
								name="custName" placeholder="请输入客户名称" />
						</div>
						<div class="form-group">
							<label for="customerFrom">客户来源</label> <select
								class="form-control" id="customerFrom" name="custSource">
								<option value="">--请选择--</option>

								<option value="网络营销">网络营销</option>
								<option value="电话营销">电话营销</option>

							</select>
						</div>
						<div class="form-group">
							<label for="custIndustry">所属行业</label> <select
								class="form-control" id="custIndustry" name="custIndustry">
								<option value="">--请选择--</option>
								<option value="教育培训">教育培训</option>
								<option value="电子商务">电子商务</option>
								<option value="酒店管理">酒店管理</option>
								<%-- <c:forEach items="${custIndustry }" var="custIndustry">
									<option value="${custIndustry }">
								  	 	${custIndustry }
									</option> 
								</c:forEach>
								 --%>
								<!-- 结束语 -->
							</select>
						</div>
						<div class="form-group">
							<label for="custLevel">客户级别</label> <select class="form-control"
								id="custLevel" name="custLevel">
								<option value="">--请选择--</option>
								<option value="VIP用户">VIP用户</option>
								<option value="普通用户">普通用户</option>


							</select>
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
					</form>
				</div>
			</div>

			<div style="height: 30%; width: 50%; margin-left: 10px;">
				<a href="#" class="btn btn-primary" data-toggle="modal"
					data-target="#newCustomerDialog" onclick="clearCustomer()">新建客户</a>
			</div>


			<div>
				<div class="col-lg-12">
					<div class="panel-heading">
						<!-- panel panel-default -->
						<font size="5" color="black">客户信息列表</font>
						<!-- /.panel-heading -->

						<table class="table table-hover" border="1px" width="65%">
							<thead>
								<tr>
									<th>编号</th>
									<th>客户名称</th>
									<th>客户来源</th>
									<th>客户所属行业</th>
									<th>客户级别</th>
									<th>固定电话</th>
									<th>手机</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageInfo.list}" var="row">
									<tr>
										<td>${row.cust_id}</td>
										<td>${row.cust_name}</td>
										<td>${row.cust_source}</td>
										<td>${row.cust_industry}</td>
										<td>${row.cust_level}</td>
										<td>${row.cust_phone}</td>
										<td>${row.cust_mobile}</td>
										<td><a href="#" class="btn btn-primary btn-xs"
											data-toggle="modal" data-target="#customerEditDialog"
											onclick="editCustomer(${row.cust_id})">修改</a> <a href="#"
											class="btn btn-danger btn-xs"
											onclick="deleteCustomer(${row.cust_id})">删除</a> ${row.cust_id }
										</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						<!-- 显示分页信息 -->
						<div class="row-fluid">
							<!-- 分页信息 -->
							<div class="col-md-6">
								本页为：${pageInfo.pageNum }/共${pageInfo.pages }页<br>
								客户为：${pageInfo.size }/共${pageInfo.total }人<br>
							</div>
							<!-- 分页条信息 -->
							<div>
								<ul class="pagination ">
									<!-- 首页 -->
									<li><a
										href="${pageContext.request.contextPath }/customer/list.action">

											首页</a></li>

									<!-- 判断上一页 -->
									<c:if test="${pageInfo.hasPreviousPage }">
										<li><a
											href="${pageContext.request.contextPath }/customer/list.action?pn=${pageInfo.prePage}">上一页
										</a></li>
									</c:if>
									<!--******************************  -->
									<!-- ********************************* -->
									<!-- 循环遍历每一页 并且让当前页active -->
									<c:forEach items="${pageInfo.navigatepageNums }"  var="pageNum">
										<c:if test="${pageNum == pageInfo.pageNum }">
											<li class="active"><a
												href="${pageContext.request.contextPath }/customer/list.action?pn=${pageNum }">${pageNum }</a></li>
										</c:if>
										<c:if test="${pageNum != pageInfo.pageNum }">
											<li><a
												href="${pageContext.request.contextPath }/customer/list.action?pn=${pageNum }">${pageNum }</a></li>
										</c:if>
									</c:forEach>
									<!-- 没有下一页也不显示下一页 -->
									<c:if test="${pageInfo.hasNextPage }">
										<li><a
											href="${pageContext.request.contextPath }/customer/list.action?pn=${pageInfo.nextPage}">
												下一页 </a></li>
										<li><a href="">...</a></li>
									</c:if>
									<li><a
										href="${pageContext.request.contextPath }/customer/list.action?pn=${pageInfo.pages}">尾页</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>



















			</div>

		</div>


		<!-- 创建客户模态框 -->
		<div class="modal fade" id="newCustomerDialog" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">新建客户信息</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="new_customer_form">
							<div class="form-group">
								<label for="new_customerName" class="col-sm-2 control-label">
									客户名称 </label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="new_customerName"
										placeholder="客户名称" name="cust_name" />
								</div>
							</div>
							<div class="form-group">
								<label for="new_customerFrom"
									style="float: left; padding: 7px 15px 0 27px;">客户来源</label>
								<div class="col-sm-10">
									<select class="form-control" id="new_customerFrom"
										name="cust_source">
										<option value="">--请选择--</option>
										<option value="网络营销">网络营销</option>
										<option value="电话营销">电话营销</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="new_custIndustry"
									style="float: left; padding: 7px 15px 0 27px;">所属行业</label>
								<div class="col-sm-10">
									<select class="form-control" id="new_custIndustry"
										name="cust_industry">
										<option value="">--请选择--</option>
										<option value="酒店管理">酒店管理</option>
										<option value="电子商务">电子商务</option>
										<option value="教育培训">教育培训</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="new_custLevel"
									style="float: left; padding: 7px 15px 0 27px;">客户级别</label>
								<div class="col-sm-10">
									<select class="form-control" id="new_custLevel"
										name="cust_level">
										<option value="">--请选择--</option>
										<option value="VIP用户">VIP用户</option>
										<option value="普通用户">普通用户</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="new_linkMan" class="col-sm-2 control-label">联系人</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="new_linkMan"
										placeholder="联系人" name="cust_linkman" />
								</div>
							</div>
							<div class="form-group">
								<label for="new_phone" class="col-sm-2 control-label">固定电话</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="new_phone"
										placeholder="固定电话" name="cust_phone" />
								</div>
							</div>
							<div class="form-group">
								<label for="new_mobile" class="col-sm-2 control-label">移动电话</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="new_mobile"
										placeholder="移动电话" name="cust_mobile" />
								</div>
							</div>
							<div class="form-group">
								<label for="new_zipcode" class="col-sm-2 control-label">邮政编码</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="new_zipcode"
										placeholder="邮政编码" name="cust_zipcode" />
								</div>
							</div>
							<div class="form-group">
								<label for="new_address" class="col-sm-2 control-label">联系地址</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="new_address"
										placeholder="联系地址" name="cust_address" />
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary"
							onclick="createCustomer()">创建客户</button>
					</div>
				</div>
			</div>
		</div>




		<!-- 修改模态框（Modal） -->
		<div class="modal fade" id="customerEditDialog" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title" id="myModalLabel">修改客户信息</h4>
					</div>

					<div class="modal-body">
						<form class="form-horizontal" id="edit_customer_form">
							<input type="hidden" id="edit_cust_id" name="cust_id" />
							<div class="form-group">
								<label for="edit_customerName" class="col-sm-2 control-label">客户名称</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_customerName"
										placeholder="客户名称" name="cust_name" />
								</div>
							</div>
							<div class="form-group">
								<label for="edit_customerFrom"
									style="float: left; padding: 7px 15px 0 27px;">客户来源</label>
								<div class="col-sm-10">
									<select class="form-control" id="edit_customerFrom"
										name="cust_source">
										<option value="">--请选择--</option>
										<option value="网络营销">网络营销</option>
										<option value="电话营销">电话营销</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="edit_custIndustry"
									style="float: left; padding: 7px 15px 0 27px;">所属行业</label>
								<div class="col-sm-10">
									<select class="form-control" id="edit_custIndustry"
										name="cust_industry">
										<option value="">--请选择--</option>
										<option value="教育培训">教育培训</option>
										<option value="酒店管理">酒店管理</option>
										<option value="电子商务">电子商务</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="edit_custLevel"
									style="float: left; padding: 7px 15px 0 27px;">客户级别</label>
								<div class="col-sm-10">
									<select class="form-control" id="edit_custLevel"
										name="cust_level">
										<option value="">--请选择--</option>
										<option value="VIP用户">VIP用户</option>
										<option value="普通用户">普通用户</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="edit_linkMan" class="col-sm-2 control-label">联系人</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_linkMan"
										placeholder="联系人" name="cust_linkman" />
								</div>
							</div>
							<div class="form-group">
								<label for="edit_phone" class="col-sm-2 control-label">固定电话</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_phone"
										placeholder="固定电话" name="cust_phone" />
								</div>
							</div>
							<div class="form-group">
								<label for="edit_mobile" class="col-sm-2 control-label">移动电话</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_mobile"
										placeholder="移动电话" name="cust_mobile" />
								</div>
							</div>
							<div class="form-group">
								<label for="edit_zipcode" class="col-sm-2 control-label">邮政编码</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_zipcode"
										placeholder="邮政编码" name="cust_zipcode" />
								</div>
							</div>
							<div class="form-group">
								<label for="edit_address" class="col-sm-2 control-label">联系地址</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_address"
										placeholder="联系地址" name="cust_address" />
								</div>
							</div>
						</form>




					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary"
							onclick="updateCustomer()">确认修改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
</body>
</html>