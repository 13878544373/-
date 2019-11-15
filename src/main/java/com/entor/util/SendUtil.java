package com.entor.util;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.HtmlEmail;

import com.cloopen.rest.sdk.CCPRestSmsSDK;

/**
 * java邮箱发送工具类
 * @author HQJ
 * @date 2019年11月9日 上午8:49:52
 * @version 1.0
 */
public class SendUtil {
	/**
	 * QQ邮箱发送邮件
	 * @param to
	 * @param content
	 * @return
	 */
	public static boolean sendEmail(String to,String content){
		boolean flat = false;
		try {
			//创建网页邮箱对象
			HtmlEmail email = new HtmlEmail();
			//基本设置
			email.setSSL(true);
			email.setDebug(true);
			//设置qq邮箱为发送邮箱
			email.setHostName("SMTP.qq.com");
			email.setSmtpPort(587);
			//设置服务器身份验证
			email.setAuthentication("383391403@qq.com", "jgywtvpysegbcafi");
			//设置邮件发送人
			email.setFrom("383391403@qq.com");
			//设置发送的标题
			email.setSubject("商会系统登录密码找回");
			
			//接收人
			email.addTo(to);
			//发送内容
			email.setMsg(content);
			
			/*//拓展附件发送
			EmailAttachment ea = new EmailAttachment();
			//添加发送附件的的地址(绝对路径)
			ea.setPath("");
			ea.setDescription(EmailAttachment.ATTACHMENT);
			email.attach(ea);*/
			
			//邮件的发送
			email.send();
			flat = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flat;
	}
	
	
	public static boolean sendSms(String to,HttpServletRequest req){
		boolean flat = false;
		try {
			//声明短信发送对象
			CCPRestSmsSDK restApi = new CCPRestSmsSDK();
			Random r = new Random();
			String code = (r.nextInt(90000)+100000)+"";
			req.getSession().setAttribute("codePwd", to+"-"+code);
			
			System.out.println("手机验证码:"+code);
			//设置参数
			restApi.init("app.cloopen.com", "8883");
			String sid = "";
			String token = "";
			String appId = "";
			restApi.setAccount(sid, token);
			restApi.setAppId(appId);
			HashMap<String, Object> result = 
					restApi.sendTemplateSMS(to, "1", new String[]{code,"5"});
			System.out.println("执行发送结果:"+result);
			//判断发送成功或失败
			if("000000".equals(result.get("statusCode"))){
				flat = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flat;
	}
	
	
	public static void main(String[] args) {
		System.out.println(sendSms("18577867151",null));
	}

}
