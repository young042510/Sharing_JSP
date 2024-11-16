<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>공간등록</title></head>
<body>
<center>
<font><b>[공간 등록]</b></font>
<form method="post" action="InsertGoodsResult.jsp" >
<table border="2" cellpadding="10">

		<tr>
			<td>카테고리분류 :  </td>
			<td>		
			     <select name="ctg">
			        <option value="스튜디오">스튜디오</option>
	        		<option value="파티룸" >파티룸</option>
			        <option value="회의실" >회의실</option>
		         </select><p>
			 </td>
		</tr>
		<tr>
			<td>공간등록번호 :  </td>
			<td><input type="text" name="no"></td>
		</tr>
		<tr>
			<td>공간명 :  </td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>위치 : </td>
			<td><input type="text" name="place"></td>
		</tr>
		<tr>
			<td>인원 : </td>
			<td><input type="text" name="number">명</td>
		</tr>
		<tr>
			<td>대여가격 :  </td>
			<td><input type="text" name="price"> 원</td>
		</tr>
		<tr>
			<td>주의사항 :  </td>
			<td><textarea name="rule" rows="5" cols="30"></textarea></td>	
		</tr>
		<tr>
			<td>상세설명 :  </td>
			<td><textarea name="description" rows="5" cols="30"></textarea></td>	
		</tr>
				
</table><p>
<input type="submit" value="상품등록">
<input type="reset" value="취 소">
</form>
</center>
</body>
</html>

