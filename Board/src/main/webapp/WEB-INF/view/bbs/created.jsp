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
<link rel="stylesheet" href="<%=cp%>/css/style.css" type="text/css">
<script type="text/javascript" src="<%=cp%>/js/created.js"></script>
</head>
<body>
<table style="width: 600px; margin: 30px auto 0px; border-spacing: 0px;">
<tr height="40">
	<td align="left" class="title">
		게시판
	</td>
</tr>
</table>
<form name="boardForm" method="post" onsubmit="return check();">
  <table style="width: 600px; margin: 20px auto 0px; border-spacing: 0px;">
  <tr><td colspan="2" height="3" bgcolor="#507CD1"></td></tr>
  <tr align="left" height="40"> 
      <td width="100" bgcolor="#EEEEEE" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
      <td width="500" style="padding-left:10px;"> 
        <input type="text" name="subject" size="75" maxlength="100" class="boxTF" value="${dto.subject}">
      </td>
  </tr>
   <tr><td colspan="2" height="1" bgcolor="#DBDBDB"></td></tr>
  <tr align="left" height="40"> 
      <td width="100" bgcolor="#EEEEEE" style="text-align: center;">작성자</td>
      <td width="500" style="padding-left:10px;"> 
        <input type="text" name="name" size="35" maxlength="20" class="boxTF" value="${dto.name}">
      </td>
  </tr>
   <tr><td colspan="2" height="1" bgcolor="#DBDBDB"></td></tr>
  <tr align="left"> 
      <td width="100" bgcolor="#EEEEEE" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
      <td width="500" valign="top" style="padding:5px 0px 5px 10px;"> 
        <textarea name="content" cols="75" rows="12" class="boxTA">${dto.content}</textarea>
      </td>
  </tr>
   <tr><td colspan="2" height="1" bgcolor="#DBDBDB"></td></tr>
  <tr align="left" height="40" >
      <td width="100" bgcolor="#EEEEEE" style="text-align: center;">패스워드</td>
      <td width="500" style="padding-left:10px;"> 
           <input type="password" name="pwd" size="35" maxlength="7" class="boxTF">&nbsp;(게시물 수정 및 삭제시 필요 !!!)
       </td>
  </tr> 
  <tr><td colspan="2" height="3" bgcolor="#507CD1"></td></tr>
  </table>
  <table style="width: 600px; margin: 0px auto; border-spacing: 0px;">
     <tr height="45"> 
      <td align="center" >
        <button type="submit" class="btn" onclick="sendBoard();"> ${mode=='created'?'등록하기':'수정완료'} </button>
        <button type="reset" class="btn"> 다시입력 </button>
        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/bbs/list';"> ${mode=='created'?'등록취소':'수정취소'} </button>
         <c:if test="${mode=='update'}">
         	 <input type="hidden" name="num" value="${dto.num}">
        	 <input type="hidden" name="page" value="${page}">
        </c:if>
      </td>
    </tr>
  </table>
</form>
</body>
</html>