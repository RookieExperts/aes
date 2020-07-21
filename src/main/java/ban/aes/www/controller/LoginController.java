package ban.aes.www.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import ban.aes.www.common.AESTool;

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
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		map.put("statu", "0");// 0代表成功

		return map;
	}
}
