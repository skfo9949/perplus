<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBWDGjKV2YFKGM5q6gtx-J5GcJTa2wLDQU"
	type="text/javascript"></script>
<script src="/Perplus/js/map.js"></script>
<script src="/Perplus/js/search-map.js">
	
</script>
<script type="text/javascript">
	$(document).ready(function() {
		var location;
		var checkIn;
		var checkOut;
		var guestNumber;
		if (decodeURI(window.location.search).includes('location')) {
			location = getQueryString('location');
			$("#location").val(location);
		}
		if (decodeURI(window.location.search).includes('checkIn')) {
			checkIn = getQueryString('checkIn');
		}
		if (decodeURI(window.location.search).includes('checkOut')) {
			checkOut = getQueryString('checkOut');
		}
		if (decodeURI(window.location.search).includes('guestNumber')) {
			guestNumber = getQueryString('guestNumber');
		}
		$("#amount").on("input", printByFilter());

		$(".addfilterBtn").click(function() {
			$(".addfilter").toggle();

		});

	});

	$(function() {

		$("#slider-range").slider({
			range : true,
			min : 0,
			max : 200000,
			values : [ 30000, 80000 ],
			slide : function(event, ui) {
				$("#amount").val("₩" + ui.values[0] + " - ₩" + ui.values[1]);
			}
		});
		$("#amount").val(
				"₩" + $("#slider-range").slider("values", 0) + " - ₩"
						+ $("#slider-range").slider("values", 1));
		$("#slider-range").on("slidestop", function() {
			printByFilter();
		});
	});
	function printByFilter() {

	}
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-7 col-sm-12 col-xs12" style="padding-left: 0px">
			<input type="hidden" id="stage" value="search"> <input
				type="hidden" id="location">
			<div id="map-canvas" style="width: 100%; height: 600px;"></div>
		</div>
		<div class="col-md-5 col-sm-12 col-xs-12">

			<div class="row panel-MT">
				<div class="col-md-12">
					<!-- 숙소 출력 -->
					<div class="col-md-2 col-sm-2 col-xs-12 rightform leftform">
						<span class="btn btn-primary"
							style="margin-bottom: 15px !important;">날짜</span>
					</div>


					<div class="col-md-3 col-sm-3 col-xs-4 ">

						<input type="text" class="form-control" name="check" id="dpd1"
							placeholder="yy-mm-dd" value="시작일 ">

					</div>


					<div class="col-md-3 col-sm-3 col-xs-4 ">

						<input type="text" class="form-control" name="check" id="dpd2"
							placeholder="yy-mm-dd" value="종료일">

					</div>

					<div class="col-md-3 col-sm-3 col-xs-4 ">
						<select class="form-control " onchange="printByFilter()">
							<option>인원수</option>
							<c:forEach var="i" begin="2" end="100" step="1">
								<option>${i}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="row panel-MT">
				<div class="checkbox">
					<div class="col-md-3 rightform " style="margin-bottom: 15px;">
						<button class="btn btn-primary">숙소 유형</button>
					</div>
					<div class="col-md-2 col-xs-offset-1 col-xs-3  rightform leftform">
						<label><input type="radio" name="house-type"
							onchange="printByFilter()">집전체</label>
					</div>
					<div class="col-md-2 col-xs-3 rightform leftform">
						<label><input type="radio" name="house-type"
							onchange="printByFilter()">개인실</label>
					</div>
					<div class="col-md-2 col-xs-3 rightform leftform">
						<label><input type="radio" name="house-type"
							onchange="printByFilter()">다인실</label>
					</div>
				</div>
			</div>

			<div class="row panel-MT">
				<div class="checkbox">
					<div class="col-md-3 col-sm-3 col-xs-12 rightform ">
						<span class="btn btn-primary " style="margin-top: 13px;">가격
							범위</span>
					</div>
					<div
						class="col-md-8 col-sm-8 col-xs-8 col-xs-offset-1 col-md-offset-0"
						style="padding-left: 0px;">
						<p>
							<label for="amount" style="padding-left: 0px;">Price
								range:</label> <input type="text" id="amount" readonly
								style="border: 0; color: #f6931f; font-weight: bold;">
						</p>

						<div id="slider-range"></div>
					</div>
				</div>
			</div>

			<div class="row row-condensed space-4">
				<div class="col-md-12">
					<!-- data-toggle="modal" data-target="#addfilterdialog" -->
					<button class="btn btn-primary addfilterBtn">추가 필터</button>
					<!-- <a href="#"></a> -->
				</div>
			</div>

			<div class="row row-condensed space-4 addfilter"
				style="display: none;">
				<div class="col-md-12">

					<div class="col-md-2 col-sm-2 col-xs-12"
						style="margin-bottom: 15px;">
						<span class="btn btn-primary">규모</span>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-4">
						<div class="form-group">
							<select class="form-control">
								<option>침실수</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
							</select>
						</div>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-4">
						<div class="form-group">
							<select class="form-control">
								<option>욕실수</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
							</select>
						</div>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-4">
						<div class="form-group">
							<select class="form-control">
								<option>침대수</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
							</select>
						</div>
					</div>

					<div class="row panel-MT">
						<div class="col-md-12">
							<div class="col-md-12">a</div>
						</div>

					</div>
					<div class="row panel-MT">
						<div class="col-md-12">
							<div class="col-md-12">b</div>
						</div>

					</div>
					<div class="col-md-12">
						<div class="modal-footer">
							<div class="row panel-MT">
								<div
									class="col-md-offset-5 col-sm-offset-5 col-xs-offset-5 col-md-3 col-sm-3 col-xs-3">

									<button class="btn btn-primary" style="width: 100%">취소</button>
								</div>
								<div class="col-md-3 col-sm-3 col-xs-3">
									<button type="submit" class="btn btn-primary">필터 적용</button>
								</div>
							</div>
						</div>
					</div>











				</div>
			</div>

			<div class="row row-condensed space-4">
				<div class="col-md-12">
					<a href="${initParam.rootPath}/house/houseDetail.do?houseSerial=1"><button
							class="btn btn-primary">숙소 상세 페이지</button></a>
				</div>
			</div>

			<div class="row " style="margin-right: 20px">
				<div class="col-md-12"
					style="overflow: scroll; border: 2px solid #ccc; height: 255px">

					<!-- 목록 하나 -->
					<div class="col-md-3 col-sm-4 col-xs-4"
						style="margin: 12px 24px 12px 24px;">
						<div class="row con1">
							<div class="row con1">
								<div class="col-md-12" style="padding: 0px;">
									<img src="/Perplus/css/image/photo0.jpg" alt="asd"
										style="width: 100%; height: 150px" />
								</div>
							</div>

							<div class="row subcon1" style="border: 1px solid #ccc;">
								<div class="row con2">
									<div class="col-md-12">
										<span class="col-md-12"
											style="text-align: center; padding: 5px; font-size: 12px;">숙소
											이름 request</span>
									</div>
								</div>
							</div>

							<div class="row subcon2" style="border: 1px solid #ccc;">
								<div class="row con3">
									<div class="col-md-12">
										<span class="col-md-12"
											style="text-align: center; padding: 5px; font-size: 12px;">가격
											request</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 목록 하나 -->

					<!-- 목록 하나 -->
					<div class="col-md-3 col-sm-4 col-xs-4"
						style="margin: 12px 24px 12px 24px;">
						<div class="row con1">
							<div class="row con1">
								<div class="col-md-12" style="padding: 0px;">
									<img src="/Perplus/css/image/photo0.jpg" alt="asd"
										style="width: 100%; height: 150px" />
								</div>
							</div>

							<div class="row subcon1" style="border: 1px solid #ccc;">
								<div class="row con2">
									<div class="col-md-12">
										<span class="col-md-12"
											style="text-align: center; padding: 5px; font-size: 12px;">숙소
											이름 request</span>
									</div>
								</div>
							</div>

							<div class="row subcon2" style="border: 1px solid #ccc;">
								<div class="row con3">
									<div class="col-md-12">
										<span class="col-md-12"
											style="text-align: center; padding: 5px; font-size: 12px;">가격
											request</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 목록 하나 -->


					<!-- 목록 하나 -->
					<div class="col-md-3 col-sm-4 col-xs-4"
						style="margin: 12px 24px 12px 24px;">
						<div class="row con1">
							<div class="row con1">
								<div class="col-md-12" style="padding: 0px;">
									<img src="/Perplus/css/image/photo0.jpg" alt="asd"
										style="width: 100%; height: 150px" />
								</div>
							</div>

							<div class="row subcon1" style="border: 1px solid #ccc;">
								<div class="row con2">
									<div class="col-md-12">
										<span class="col-md-12"
											style="text-align: center; padding: 5px; font-size: 12px;">숙소
											이름 request</span>
									</div>
								</div>
							</div>

							<div class="row subcon2" style="border: 1px solid #ccc;">
								<div class="row con3">
									<div class="col-md-12">
										<span class="col-md-12"
											style="text-align: center; padding: 5px; font-size: 12px;">가격
											request</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 목록 하나 -->

					<!-- 목록 하나 -->
					<div class="col-md-3 col-sm-4 col-xs-4"
						style="margin: 12px 24px 12px 24px;">
						<div class="row con1">
							<div class="row con1">
								<div class="col-md-12" style="padding: 0px;">
									<img src="/Perplus/css/image/photo0.jpg" alt="asd"
										style="width: 100%; height: 150px" />
								</div>
							</div>

							<div class="row subcon1" style="border: 1px solid #ccc;">
								<div class="row con2">
									<div class="col-md-12">
										<span class="col-md-12"
											style="text-align: center; padding: 5px; font-size: 12px;">숙소
											이름 request</span>
									</div>
								</div>
							</div>

							<div class="row subcon2" style="border: 1px solid #ccc;">
								<div class="row con3">
									<div class="col-md-12">
										<span class="col-md-12"
											style="text-align: center; padding: 5px; font-size: 12px;">가격
											request</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 목록 하나 -->

					<!-- 목록 하나 -->
					<div class="col-md-3 col-sm-4 col-xs-4"
						style="margin: 12px 24px 12px 24px;">
						<div class="row con1">
							<div class="row con1">
								<div class="col-md-12" style="padding: 0px;">
									<img src="/Perplus/css/image/photo0.jpg" alt="asd"
										style="width: 100%; height: 150px" />
								</div>
							</div>

							<div class="row subcon1" style="border: 1px solid #ccc;">
								<div class="row con2">
									<div class="col-md-12">
										<span class="col-md-12"
											style="text-align: center; padding: 5px; font-size: 12px;">숙소
											이름 request</span>
									</div>
								</div>
							</div>

							<div class="row subcon2" style="border: 1px solid #ccc;">
								<div class="row con3">
									<div class="col-md-12">
										<span class="col-md-12"
											style="text-align: center; padding: 5px; font-size: 12px;">가격
											request</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 목록 하나 -->

					<!-- 목록 하나 -->
					<div class="col-md-3 col-sm-4 col-xs-4"
						style="margin: 12px 24px 12px 24px;">
						<div class="row con1">
							<div class="row con1">
								<div class="col-md-12" style="padding: 0px;">
									<img src="/Perplus/css/image/photo0.jpg" alt="asd"
										style="width: 100%; height: 150px" />
								</div>
							</div>

							<div class="row subcon1" style="border: 1px solid #ccc;">
								<div class="row con2">
									<div class="col-md-12">
										<span class="col-md-12"
											style="text-align: center; padding: 5px; font-size: 12px;">숙소
											이름 request</span>
									</div>
								</div>
							</div>

							<div class="row subcon2" style="border: 1px solid #ccc;">
								<div class="row con3">
									<div class="col-md-12">
										<span class="col-md-12"
											style="text-align: center; padding: 5px; font-size: 12px;">가격
											request</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 목록 하나 -->

				</div>
			</div>
		</div>
	</div>
</div>