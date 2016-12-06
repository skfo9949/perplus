<%@ page contentType="text/html;charset=UTF-8"%>
<script type="text/javascript">
var emailCheck = true;
	$(document).ready(function() {
		$("#joinEmail").on("keyup", function() {
			var email = this.value;
			$.ajax({
				url : "/Perplus/member/emailCheck.do",
				data : {
					"email" : email
				},
				dataType : "JSON",
				beforeSend : function() {
					if (!email) {
						return false;
					}
				},
				success : function(obj) {
					emailCheck = obj.result;

					if (emailCheck) {
						$("#emailDupMessage").text("중복된 아이디 입니다.");
					} else {
						$("#emailDupMessage").text("사용할 수 있는 아이디 입니다.");
					}
				},
				error : function(request, error, status) {
				}
			})
		});
		$("#member_join_form").on("submit", function(){
			if(emailCheck){
				alert("중복된 아이디입니다.");
				$("#joinEmail").focus();
				return false;
			}
			alert("회원가입을 축하드립니다.");
		});
		
		
	});
</script>
<!-- 회원가입 폼 -->
<div class="modal fade" id="join" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">회원 가입</h4>
			</div>
			<div class="modal-body">
				<form action="/Perplus/member/join.do" id="member_join_form">
					<div class="form-group">
						<input type="email" class="form-control" id="joinEmail"
							name="memberEmail" placeholder="이메일 주소" required
							autocomplete="off"><span id="emailDupMessage"></span>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="name"
							name="memberName" placeholder="이름" required>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="joinPassword"
							name="memberPassword" placeholder="password" required>
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-xs-5 col-md-5 col-lg-5">
								<select class="form-control" id="joinSelect" name="mm">
									<option>월</option>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
									<option>8</option>
									<option>9</option>
									<option>10</option>
									<option>11</option>
									<option>12</option>
								</select>
							</div>
							<div class="col-xs-3 col-md-3 col-lg-3" id="joinSelectStyle"
								style="padding-left: 0px !important;">
								<select class="form-control" id="joinSelect" name="dd">
									<option>일</option>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>3</option>
								</select>
							</div>
							<div class="col-xs-4 col-md-4 col-lg-4">
								<select class="form-control" id="joinSelect" name="yy">
									<option>년</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" name="login" class="btn btn-default btn-lg"
							id="loginBtn" value="회원가입">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>