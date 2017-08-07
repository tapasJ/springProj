  // 좌우의 공백을 제거하는 함수
  String.prototype.trim = function(){
	  var TRIM_PATTERN = /(^\s*)|(\s*$)/g;
	  return this.replace(TRIM_PATTERN, "");
  };
  function check() {
        var f = document.boardForm;
    	var str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return false;
        }
	    str = f.name.value;
        if(!str) {
            alert("이름을 입력하세요. ");
            f.name.focus();
            return false;
        }
    	str = f.content.value;
        if(!str) {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return false;
        }
    	str = f.pwd.value;
        if(!str) {
            alert("패스워드를 입력하세요. ");
            f.pwd.focus();
            return false;
        }
    	
        var mode="${mode}";
        if(mode=="created")
            f.action = "<%=cp%>/bbs/created";
        else if(mode=="update")
            f.action = "<%=cp%>/bbs/update";
            
        return true;
  }
