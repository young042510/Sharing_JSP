<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Sharing</title>
<link href="css/main.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script language="JavaScript">

	$(document).ready(function() {
		var $banner = $(".banner").find("ul");

		var $bannerWidth = $banner.children().outerWidth();//이미지의 폭
		var $bannerHeight = $banner.children().outerHeight(); // 높이
		var $length = $banner.children().length;//이미지의 갯수
		var rollingId;

		//정해진 초마다 함수 실행
		rollingId = setInterval(function() { rollingStart(); }, 5000);//다음 이미지로 롤링 애니메이션 할 시간차
    
		function rollingStart() {
			$banner.css("width", $bannerWidth * $length + "px");
			$banner.css("height", $bannerHeight + "px");
			//alert(bannerHeight);
			//배너의 좌측 위치를 옮겨 준다.
			$banner.animate({left: - $bannerWidth + "px"}, 1500, function() { //숫자는 롤링 진행되는 시간이다.
				//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
				$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
				//뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
				$(this).find("li:first").remove();
				//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
				$(this).css("left", 0);
				//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
			});
		}
	}); 
	function count(type)  {
  // 결과를 표시할 element
  const resultElement = document.getElementById('result');
  
  // 현재 화면에 표시된 값
  let number = resultElement.innerText;
  
  // 더하기/빼기
  if(type === 'plus') {
    number = parseInt(number) + 1;
  }else if(type === 'minus')  {
    number = parseInt(number) - 1;
  }
  
  // 결과 출력
  resultElement.innerText = number;
}
 function count1(type)  {
  // 결과를 표시할 element
  const resultElement = document.getElementById('result1');
  
  // 현재 화면에 표시된 값
  let number = resultElement.innerText;
  
  // 더하기/빼기
  if(type === 'plus1') {
    number = parseInt(number) + 1;
  }else if(type === 'minus')  {
    number = parseInt(number) - 1;
  }
  
  // 결과 출력
  resultElement.innerText = number;
}

 function count2(type)  {
  // 결과를 표시할 element
  const resultElement = document.getElementById('result2');
  
  // 현재 화면에 표시된 값
  let number = resultElement.innerText;
  
  // 더하기/빼기
  if(type === 'plus2') {
    number = parseInt(number) + 1;
  }else if(type === 'minus')  {
    number = parseInt(number) - 1;
  }
  
  // 결과 출력
  resultElement.innerText = number;
}

 function count3(type)  {
  // 결과를 표시할 element
  const resultElement = document.getElementById('result3');
  
  // 현재 화면에 표시된 값
  let number = resultElement.innerText;
  
  // 더하기/빼기
  if(type === 'plus3') {
    number = parseInt(number) + 1;
  }else if(type === 'minus')  {
    number = parseInt(number) - 1;
  }
  
  // 결과 출력
  resultElement.innerText = number;
}

 
</script>
</head>

<body>
<%
     //   로그인 상태를 유지하기 위하여, sid에 저장되었던 접속한 ID값을 
     //   session 객체로부터 가져와서 변수 id에 저장시킴 (loginOK.jsp의 43행부분 확인요망!)
	String id = (String)session.getAttribute("sid");  
	// String id = session.getAttribute("sid").toString(); 와  동일함
                                                                                         
%>
<header>
  <div id="logo">
		<a href="main2.jsp"><img src="images/logo.png" width="250" height="100" alt=""/></a>
	</div>
	<div class="up-menu">|<a href="main2.jsp" target=_parent>&nbsp;Home&nbsp;</a></div>
	<div class="up-menu">|<a href="Login.jsp">&nbsp;로그인&nbsp;</a></div>
	<div class="up-menu">|<a href="mypage_main.jsp">&nbsp;MY PAGE&nbsp;</a></div>
	<div class="up-menu">|<a href="inCart.jsp">&nbsp;장바구니&nbsp;</a></div>
	<div class="up-menu"><a href="InsertMember.jsp">&nbsp;회원가입&nbsp;</a></div>
  <!--메뉴-->
  <div id="menu">
		<ul>
			<li><a href="about.jsp">ABOUT</a></li>
			<li><a href="viewProduct.jsp?prdctg=category1">스튜디오</a></li>
			<li><a href="viewProduct.jsp?prdctg=category2">파티룸</a></li>
			<li><a href="viewProduct.jsp?prdctg=category3">회의실</a></li>
		</ul>
	</div>
	

</header>

<div id="main">
	<!--배너-->
<div class="banner">
	  <ul>
		  <li>
			  <div class="banner-text">
			  <div class="banner-text1">Sharing</div><br>
			  <div class="banner-text2">상상 가능한 모든 공간을 한눈에<br>
			  지금 바로 Sharing에서!
			  </div>
			  </div>
			  <img src="images/banner1.jpg" width="1520" height="500" alt=""/>
		  </li>
		  <li>
			  <div class="banner-text">
			  <div class="banner-text1">오직 Sharing에서만</div><br>
			  <div class="banner-text2">Sharing에서만 만나볼 수 있는 공간들을 <br>
			  지금 바로 확인해보세요!</div>
			  </div>
		    <img src="images/banner2.jpg" width="1520" height="500" alt=""/>
		  </li>
		  <li>
			  <div class="banner-text">
			  <div class="banner-text1">연말 모임 기획전</div><br>
			  <div class="banner-text2">연말 파티는 여기서!<br>
			  연말에 진심인 얼리버드를 위한 파티룸
			  </div>
			  </div>
		    <img src="images/banner3.jpg" width="1520" height="500" alt=""/>
		  </li>
	  </ul>
  </div>

<div class="section2">
    <div id = "middle2">
          <div class = "place-menu-container">
			<a href="viewProduct.jsp?prdctg=category1">
            <div class = "studio">
              <div class = "place_icon">
				  <img src="images/studio.jpg" width="200" height="200" alt=""/>
			  </div>
                <div class = "icon_title">스튜디오</div>
            </div>
			</a>
			<a href="viewProduct.jsp?prdctg=category2">
			<div class = "party">
              <div class = "place_icon">
		      <img src="images/party.jpg" width="200" height="200" alt=""/> </div>
                <div class = "icon_title">파티룸</div>
            </div>
			</a>
			<a href="viewProduct.jsp?prdctg=category3">
            <div class = "meeting">
              <div class = "place_icon">
		      <img src="images/meeting.jpg" width="200" height="200" alt=""/>
			  </div>
                <div class = "icon_title">회의실</div>
            </div>
			</a>
	  </div>
	</div>
  </div>
 
<div id="middle3">
	<div id="popular-place">
	<div class="popular-title">인기 공간</div>
    <div class="popular-container">
	 <div class="popular-icon">
	 <input type='button'
       onclick='count("plus")'
       value='💓'/>
<div id='result'>0</div>
	  <div class="popular-image">
		 <img src="images/popular1.jpg" width="200" height="250" alt=""/>
		 </div>

		<div class="popular-box">
			<div class="popular-text">
				THE DOT 디자이너하우스
			</div>
			<div class="popular-text2">
				경기 이천시 신둔면 도자예술로67<br>
				65,000원~/1시간 당

			</div>
		</div>
   	</div>
	<div class="popular-icon">
			<input type='button'
       onclick='count1("plus1")'
       value='💓'/>
<div id='result1'>0</div>
	  <div class="popular-image">
		  <img src="images/popular2.jpg" width="200" height="250" alt=""/>
		</div>

		<div class="popular-box">
			<div class="popular2-text">
				홈 컨셉 스튜디오 코지236
			</div>
			<div class="popular2-text2">
				인천 부평구 주부토로 236 갈산동<br>
				인천테크노벨리 605호<br>
				80,000원~/1시간 당
			</div>
		</div>
	</div>
	  <div class="popular-icon">
	  		  <input type='button'
       onclick='count2("plus2")'
       value='💓'/>
<div id='result2'>0</div>
	  <div class="popular-image">
		  <img src="images/popular3.jpg" width="200" height="250" alt=""/>
		  </div>


		<div class="popular-box">
			<div class="popular-text">
				호리존 스튜디오
			</div>
			<div class="popular-text2">
				서울 서대문구 신촌고 175 3층<br>
				20,000원~/1시간 당
			</div>
		</div>
	</div>
		<div class="popular-icon">
				  <input type='button'
       onclick='count3("plus3")'
       value='💓'/>
<div id='result3'>0</div>
	  <div class="popular-image">
		  <img src="images/popular4.jpg" width="200" height="250" alt=""/>
		  </div>

		<div class="popular-box">
			<div class="popular-text">
				드리움 공유오피스
			</div>
			<div class="popular-text2">
				서울 강남구 태해란로 138 3층<br>
				150,000원/1시간 당
			</div>
		</div>
	</div>
    </div>
	</div>
</div>
<div id="middle4">
	<div class="review-zone">
		<div class="review-title">리뷰 ZONE</div>
		<div class="review-container">
	 		<div class="review-icon">
	  			<div class="review-image">
			    <img src="images/review1.jpg" width="300" height="300" alt=""/>
				</div>
				<div class="review-box">
					<div class="review-text1">
					스튜디오 양재창고
					</div>
					<div class="review-star">
					★★★★★
					</div>
					<div class="review-text2">
					영상 촬영 때문에 이용했는데 공간이 포근하고 특색있게 잘 꾸며져 있어요! 조명도 잘 준비되어 있었고 소품도 다양하게 많아서 촬영을 할 때 소품을 바꿔가며 촬영할 수 있어서 너무 좋았어요!!
					</div>
				</div>
			</div>
	 		<div class="review-icon">
	  			<div class="review-image">
			    <img src="images/review2.jpg" width="300" height="300" alt=""/>
				</div>
				<div class="review-box">
					<div class="review-text1">
					모임공간 라온
					</div>
					<div class="review-star">
					★★★★★
					</div>
					<div class="review-text2">
					급하게 장소 대여가 필요해서 찾은 곳인데 너무 편하게 잘 이용했습니다. 내부가 정말 깔끔하고 청결하여 사용할 때 기분 좋게 사용할 수 있었습니다. 주변 사람들한테 꼭 추천하고 싶은 곳이었습니다.
					</div>
				</div>
			</div>
	 		<div class="review-icon">
	  			<div class="review-image">
			    <img src="images/review3.jpg" width="300" height="300" alt=""/>
				</div>
				<div class="review-box">
					<div class="review-text1">
					마티네 스튜디오
					</div>
					<div class="review-star">
					★★★★★
					</div>
					<div class="review-text2">
					가격이 미안할 정도로 시설에 비해 저렴하고 채광이 좋고 깔끔해요! 상품 촬영 때문에 방문했는데 덕분에 정말 좋은 사진 남기고 갑니다. 다음에도 촬영할 일이 있다면 마티네 스튜디오에 방문하고 싶습니다!!
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<footer>
상호명 주식회사 Sharing | 사업자등록번호 111-22-33333 | 고객센터 123-4567-8989<br>
주소 31020 충청남도 천안시 서북구 성환읍 대학로 91 | <a href="manager_Login.jsp">관리자 로그인</a><br>
Copyright ? 2022 Sharing. All rights reserved.
</footer>

</body>
</html>