<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/aes.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pad-zeropadding.js"></script>
</head>
<body>
<h2>登录!</h2>
<form method="post">
账号：<input type="text" placeholder="请输入账号" value="" id="account" name="account" /><br />
密码：<input type="password" placeholder="请输入密码" value="" id="password" name="password"  /><br />
<button type="button" id="loginButton">登录</button>
<button type="reset">重置</button>
</form>
<script>
$(document).ready(function() {
	
	document.getElementById('loginButton').onclick = function() {
		var account = $('#account').val();
		var password = $('#password').val();
		//加密
		account = encryptAES(account);
		password = encryptAES(password);
		$.ajax({
			url: "${pageContext.request.contextPath}/rest/login",
			data: {account:account,password:password},
			type: "POST",
			dataType:"json",
			success: function(res) {
				if(res.statu == '0') {
					alert("登录成功！");
				}
				
			}
		})
	}

})
//js aes加密
function encryptAES(str) {
	var key = CryptoJS.enc.Latin1.parse('abcdef0123456789');
    var iv = CryptoJS.enc.Latin1.parse('0123456789abcdef');
  //加密
    var encrypted = CryptoJS.AES.encrypt(data, key, {
        iv: iv,
        mode: CryptoJS.mode.CBC,
        padding: CryptoJS.pad.ZeroPadding
    });
    console.log(encrypted.toString())
}
//js aes解密
function decryptAES(str) {
	
}
</script>
</body>
</html>
