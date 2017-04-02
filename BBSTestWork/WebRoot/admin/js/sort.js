var xmlHttpRequest;
function createXMLHttpRequest(){
  if(window.ActiveXObject){//IE
	xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
  }else{//非IE
	xmlHttpRequest = new XMLHttpRequest();
  }
}

function checkBsid(){
  var bsid = document.getElementById("bsid").value;
  /**
  * 1.创建核心对象,调用函数
  */
  createXMLHttpRequest();
  //2.异步请求
  xmlHttpRequest.open("get","small_findByBsid.action?bsid="+bsid,true);
  //3.创建回调声明
  xmlHttpRequest.onreadystatechange = callback;
  //4.发送请求
  xmlHttpRequest.send(null);
}

function callback(data){
  //readyState=4,代表服务器已经异步调用完成
  if(xmlHttpRequest.readyState == 4){
	//status代表服务器响应状态码
	if(xmlHttpRequest.status == 200){
	  var text = xmlHttpRequest.responseText;
	  var ssname = text.split(",");
	  var smallsort = document.getElementById("ssname");
	  smallsort.length = 1;
	  delete ssname[ssname.length-1]
	  for(var temp in ssname){
		smallsort.options.add(new Option(ssname[temp],ssname[temp]));
	  }
	}
  }
}