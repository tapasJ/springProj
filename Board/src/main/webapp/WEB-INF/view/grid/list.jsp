<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="screen" href="../jqueryui/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../jqgrid/css/ui.jqgrid.css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="../jqueryui/jquery-ui.js"></script>
<script src="../jqgrid/js/jquery.jqGrid.min.js"></script>

</head>
<body>

   
   
<table id="list"></table>
<script type="text/javascript">
$(function(){
    //가상의 local json data
    var gridData = [{seq:"1",create_date:"2007-10-01",create_name:"test",title:"note",hitnum:"11"},
                  {seq:"2",create_date:"2007-10-02",create_name:"test2",title:"note2",hitnum:"22"}];
     
    //jqGrid껍데기 생성
    $("#list").jqGrid({
        //로컬그리드이용
        datatype: "local",
        //그리드 높이
        height: 250,
        //컬럼명들
        colNames:['시퀀스','제목', '등록일', '등록자명','조회수'],
        //컬럼모델
        colModel:[
            {name:'seq'},
            {name:'title'},
            {name:'create_date'},
            {name:'create_name'},
            {name:'hitnum'}    
        ],
        //그리드타이틀
        caption: "그리드 목록"
    });
     
    // 스크립트 변수에 담겨있는 json데이터의 길이만큼
    for(var i=0;i<=gridData.length;i++){
            //jqgrid의 addRowData를 이용하여 각각의 row에 gridData변수의 데이터를 add한다
            $("#list").jqGrid('addRowData',i+1,gridData[i]);
    }
})


</script>
</body>

</html>

