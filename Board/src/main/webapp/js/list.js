function searchList() {
	var f=document.searchForm;
	f.action="<%=cp%>/bbs/list";
	f.submit();
}