<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="assignModal" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">分配权限信息</h4>
			</div>
			<div class="modal-body delete-body">
				<ul id="authTreeDemo" class="ztree">

				</ul>
			</div>
			<div class="modal-footer">
				<button id="assignAuthBtn" type="button" class="btn btn-success">
					执行分配</button>
			</div>
		</div>
	</div>
</div>