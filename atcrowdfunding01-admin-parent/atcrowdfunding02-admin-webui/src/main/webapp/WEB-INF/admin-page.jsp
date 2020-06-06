<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%@include file="/WEB-INF/include-head.jsp"%>
<body>

	<%@include file="/WEB-INF/include-nav.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<%@include file="/WEB-INF/include-sidebar.jsp"%>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="glyphicon glyphicon-th"></i> 数据列表
						</h3>
					</div>
					<div class="panel-body">
						<form action="admin/get/page.html" method="post"
							class="form-inline" role="form" style="float: left;">
							<div class="form-group has-feedback">
								<div class="input-group">
									<div class="input-group-addon">查询条件</div>
									<input class="form-control has-success" type="text"
										name="keyword" value="${param.keyword }" placeholder="请输入查询条件">
								</div>
							</div>
							<button type="submit" class="btn btn-warning">
								<i class="glyphicon glyphicon-search"></i> 查询
							</button>
						</form>
						<button type="button" class="btn btn-danger"
							style="float: right; margin-left: 10px;">
							<i class=" glyphicon glyphicon-remove"></i> 删除
						</button>
						<button class="btn btn-primary" style="float: right;"
							onclick="window.location.href='admin/to/add/page.html'">
							<i class="glyphicon glyphicon-plus"></i> 新增
						</button>
						<br>
						<hr style="clear: both;">
						<div class="table-responsive">
							<table class="table  table-bordered">
								<thead>
									<tr>
										<th width="30">#</th>
										<th width="30"><input type="checkbox"></th>
										<th>账号</th>
										<th>名称</th>
										<th>邮箱地址</th>
										<th width="100">操作</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty requestScope.pageInfo.list }">
										<tr>
											<td colspan="6">抱歉！没有查询到您要的数据</td>
										</tr>
									</c:if>
									<c:if test="${!empty requestScope.pageInfo.list }">
										<c:forEach items="${pageInfo.list }" var="admin"
											varStatus="loop">
											<tr>
												<td>${loop.count }</td>
												<td><input type="checkbox"></td>
												<td>${admin.loginAcct }</td>
												<td>${admin.userName }</td>
												<td>${admin.email }</td>
												<td><a
													href="assign/to/assign/role/page.html?adminId=${admin.id }&pageNum=${pageInfo.pageNum }&keyword=${param.keyword}"
													class="btn btn-success btn-xs"> <i
														class=" glyphicon glyphicon-check"></i>
												</a> <a
													href="admin/to/edit/page.html?adminId=${admin.id }&pageNum=${pageInfo.pageNum }&keyword=${param.keyword}"
													class="btn btn-primary btn-xs"> <i
														class=" glyphicon glyphicon-pencil"></i>
												</a> <a class="btn btn-danger btn-xs"
													href="admin/remove/admin.html?adminId=${admin.id }&pageNum=${pageInfo.pageNum }&keyword=${param.keyword}">
														<i class=" glyphicon glyphicon-remove"></i>
												</a></td>
											</tr>
										</c:forEach>
									</c:if>

								</tbody>
								<tfoot>
									<tr>
										<td colspan="6" align="center">
											<nav aria-label="Page navigation">
												<ul class="pagination">

													<!-- 判断是否为第一页 -->
													<c:if test="${pageInfo.isFirstPage }">
														<li class="disabled"><span aria-hidden="true">&laquo;</span></li>
													</c:if>
													<c:if test="${!pageInfo.isFirstPage }">
														<!-- 首页 -->
														<li><a
															href="admin/get/page.html?pageNum=${pageInfo.prePage }&keyword=${param.keyword}"
															aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
														</a></li>
														<c:if
															test="${pageInfo.firstPage != 1 && pageInfo.firstPage != 2}">
															<li><a
																href="admin/get/page.html?pageNum=1&keyword=${param.keyword}">1</a></li>
															<li><span>...</span></li>
														</c:if>
														<c:if test="${pageInfo.firstPage == 2}">
															<li><a
																href="admin/get/page.html?pageNum=1&keyword=${param.keyword}">1</a></li>
														</c:if>
													</c:if>


													<!-- 循环导航页 -->
													<c:forEach items="${pageInfo.navigatepageNums }" var="num">
														<c:if test="${pageInfo.pageNum == num }">
															<li class="active"><span>${num }<span
																	class="sr-only">(current)</span></span></li>
														</c:if>
														<c:if test="${pageInfo.pageNum != num }">
															<li><a
																href="admin/get/page.html?pageNum=${num }&keyword=${param.keyword}">${num }</a></li>
														</c:if>
													</c:forEach>


													<!-- 判断是否为最后一页 -->
													<c:if test="${pageInfo.isLastPage }">
														<li class="disabled"><span aria-hidden="true">&raquo;</span></li>
													</c:if>
													<c:if test="${!pageInfo.isLastPage }">
														<!-- 末页 -->
														<c:if
															test="${pageInfo.lastPage != pageInfo.pages && pageInfo.lastPage != pageInfo.pages-1}">
															<li><span>...</span></li>
															<li><a
																href="admin/get/page.html?pageNum=${pageInfo.pages }&keyword=${param.keyword}">${pageInfo.pages }</a></li>
														</c:if>
														<c:if test="${pageInfo.lastPage == pageInfo.pages-1}">
															<li><a
																href="admin/get/page.html?pageNum=${pageInfo.pages }&keyword=${param.keyword}">${pageInfo.pages }</a></li>
														</c:if>
														<li><a
															href="admin/get/page.html?pageNum=${pageInfo.nextPage }&keyword=${param.keyword}"
															aria-label="Next"> <span aria-hidden="true">&raquo;</span>
														</a></li>
													</c:if>
												</ul>
											</nav>
										</td>
									</tr>

								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>