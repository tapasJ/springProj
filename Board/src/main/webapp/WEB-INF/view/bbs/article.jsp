<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring</title>

<style type="text/css">
*{
	margin: 0px; padding: 0px;
}
body {
	font-size: 9pt; font-family: 돋움;
}
a{
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}
a:active, a:hover {
	text-decoration: underline;
	color: tomato;
}
.title {
	font-weight: bold;
	font-size:13pt;
	margin-bottom:10px;
	font-family: 나눔고딕, 맑은 고딕, 돋움, sans-serif;
}
.btn {
	 font-size: 12px;
	 color:#333;
 	 font-weight:500;
	 font-family: 나눔고딕, 맑은 고딕, 돋움, sans-serif;
	 border:1px solid #ccc;
	 background-color:#FFF;
	 vertical-align:middle;
	 text-align:text-align;
	 cursor:cursor;
	 padding:4px 8px;
	 border-radius:4px;
	 margin-bottom: 3px;
}
.btn:active, .btn:focus, .btn:hover {
	 background-color:#e6e6e6;
	 border-color: #adadad;
	 color: #333;
}
</style>

<script type="text/javascript">
function deleteBoard(num) {
	if(confirm("위 자료를 삭제 하시겠습니까 ?")) {
		var url="<%=cp%>/bbs/delete?num="+num+"&page=${page}";
		location.href=url;
	}
}
</script>


</head>

<body>

<table style="width: 600px; margin: 30px auto 0px; border-spacing: 0px;">
<tr height="40"> 
	<td align="left" class="title">
		<img src="<%=cp%>/res/images/arrow.gif" alt="" style="padding-left: 5px; padding-right: 5px;">게시판
	</td>
</tr>
</table>

<table style="width: 600px; margin: 20px auto 0px; border-spacing: 0px;">
<tr><td colspan="4" height="3" bgcolor="#507CD1"></td></tr>

<tr height="35">
    <td colspan="4" align="center">
	   ${dto.subject}
    </td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#507CD1" ></td></tr>

<tr height="30">
    <td width="80" bgcolor="#EEEEEE" align="center">작성자</td>
    <td width="220" align="left" style="padding-left:10px;">
         ${dto.name}
    </td>
    <td width="80" bgcolor="#EEEEEE" align="center">줄&nbsp;&nbsp;수</td>
    <td width="220" align="left" style="padding-left:10px;">
         ${linesu}
     </td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#DBDBDB"></td></tr>

<tr height="30">
    <td width="80" bgcolor="#EEEEEE" align="center">등록일</td>
    <td width="220" align="left" style="padding-left:10px;">
        ${dto.created}
    </td>
    <td width="80" bgcolor="#EEEEEE" align="center">조회수</td>
    <td width="220" align="left" style="padding-left:10px;">
        ${dto.hitCount}
    </td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#507CD1"></td></tr>

<tr>
  <td colspan="4" align="left" style="padding: 20px 50px 20px 50px; white-space: pre;" valign="top" height="200">${dto.content}</td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#507CD1"></td></tr>

<tr height="30">
    <td width="80" bgcolor="#EEEEEE" align="center">이전글</td>
    <td width="520" align="left" style="padding-left:10px;" colspan="3">
       <c:if test="${not empty preReadDto}">
              <a href="<%=cp%>/bbs/article?${params}&num=${preReadDto.num}">${preReadDto.subject}</a>
		</c:if>
	</td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#DBDBDB"></td></tr>

<tr height="30">
    <td width="80" bgcolor="#EEEEEE" align="center">다음글</td>
    <td width="520" align="left" style="padding-left:10px;" colspan="3">
       <c:if test="${not empty nextReadDto}">
              <a href="<%=cp%>/bbs/article?${params}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
		</c:if>
    </td>
</tr>
<tr><td colspan="4" height="3" bgcolor="#507CD1" align="center"></td></tr>

<tr height="30">
   <td colspan="4" align="right">
       From : ${dto.ipAddr}
   </td>
</tr>
</table>

<table style="width: 600px; margin: 0px auto; border-spacing: 0px;">
<tr height="35">
    <td width="50%" align="left">
        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/bbs/update?num=${dto.num}&page=${page}';"> 수정 </button>
        <button type="button" class="btn" onclick="deleteBoard('${dto.num}');"> 삭제 </button>
    </td>

    <td align="right">
        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/bbs/list?${params}';"> 리스트 </button>
    </td>
</tr>
</table>

</body>

</html>