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
<script type="text/javascript" src="<%=cp%>/js/list.js"></script>
</head>

<body>

<table style="width: 700px; margin: 30px auto 0px; border-spacing: 0px;">
<tr height="40">
	<td align="left" class="title">
		게시판
	</td>
</tr>
</table>

<table style="width: 700px; margin: 20px auto 0px; border-spacing: 0px;">
   <tr height="35">
      <td align="left" width="50%">
          <form name="searchForm" action="" method="post">
              <select name="searchKey" class="selectField">
                  <option value="subject">제목</option>
                  <option value="name">작성자</option>
                  <option value="content">내용</option>
                  <option value="created">등록일</option>
            </select>
            <input type="hidden" name="rows" value="${rows}">
            <input type="text" name="searchValue" class="boxTF">
            <button type="button" class="btn" onclick="searchList()"> 검 색 </button>
        </form>
      </td>
      <td align="right">
          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/bbs/created';"> 글올리기 </button>
      </td>
   </tr>
</table>

<table style="width: 700px; margin: 0px auto; border-spacing: 0px;">
  <tr align="center" bgcolor="#507CD1" height="30"> 
      <td width="60" style="color: #ffffff;">번호</td>
      <td width="400" style="color: #ffffff;">제목</td>
      <td width="100" style="color: #ffffff;">작성자</td>
      <td width="80" style="color: #ffffff;">작성일</td>
      <td width="60" style="color: #ffffff;">조회수</td>
  </tr>
 
  <c:forEach var="dto" items="${list}">
  <tr align="center" bgcolor="#ffffff" height="30"> 
      <td align="center">${dto.listNum}</td>
      <td align="left" style="padding-left: 10px;">
          <a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
      </td>
      <td align="center">${dto.name}</td>
      <td align="center">${dto.created}</td>
      <td align="center">${dto.hitCount}</td>
  </tr>
  <tr><td height="1" colspan="5" bgcolor="#e4e4e4"></td></tr> 
  </c:forEach> 
 
</table>
 
<table style="width: 700px; margin: 0px auto; border-spacing: 0px;">
   <tr height="35">
	<td align="center">
        <c:if test="${dataCount==0 }">
                   등록된 게시물이 없습니다.
         </c:if>
        <c:if test="${dataCount!=0 }">
           ${paging}
         </c:if>
	</td>
   </tr>
</table>

</body>
</html>

</body>
</html>