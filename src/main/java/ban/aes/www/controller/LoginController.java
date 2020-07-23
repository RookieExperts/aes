package ban.aes.www.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import ban.aes.www.common.AESTool;
import ban.aes.www.common.Constant;

@RestController
@RequestMapping(value = "/rest")
public class LoginController {

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public Map<String, Object> login(String account, String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 解密
		try {
			account = AESTool.decryptAES(account).trim();
			password = AESTool.decryptAES(password).trim();
			// 判断解密后的账号和密码
			// 真实的业务场景需要去数据库中查询，这里我为了简单定义成常量
			if (Constant.ACCOUNT.equals(account) && Constant.PASSWORD.equals(password)) {
				map.put("statu", "0");// 0代表成功
			} else {
				map.put("statu", "1");// 1代表失败
				map.put("msg", "用户名或密码错误");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return map;
	}
}
