package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {

	// ↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	public static Map<String, Float> payCashType = new HashMap<String, Float>() {
		{
			put("payDiscount", 23F);
			put("payFull", 28F);
			put("payTest", 0.01F);
		}
	};

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	// public static String app_id = "2016080500170019";

	public static String app_id = "2018030902341721";

	// 商户私钥，您的PKCS8格式RSA2私钥
	// public static String merchant_private_key =
	// "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCG8vW43+re4qn18E7cf3CLcAuvmiYSBhdte/+KyjqtkXmClVpp2O2qYZfAb7pRe59voI7dr1qeSugSxbYn6MktRcevJ/5x0TA63gEhNyXOJ9XJ2273raJnatnbAI6G26LqpZ90qZsHavTDwPV0ge38G3YxyoIAjnyOHwYhZTU7xPwDZS5zhmYocs1caPnuxiMx+FMh+g3DvhcU4ZsCQWZcY/CZN8ZMbWenqIdksXP8dUuv9NRjCibtA5dsqip3cyVfwkmMcUewm4CJTw1UXn1lduB7J9H/6mHOqEovLQhlILIeDJopOSG8PefT8Ffapr5q1n6hbbKHaFRu9Wg/Vi6bAgMBAAECggEAUBqsTX9tNbyqUrjAtxZWwg5SgXwpGQ3Qnka6m7ILPrhZvm/VaXtBKKAhqjMoD/In4+UUqPbL/aZNN8dwpyQBNwRy0cAVw43+6RKa7RKFOGhg+R9uMUs6WdUNWHhuIhMCE/MYQfHjenW8sO47RVtS3xGWCVxB6v6pZNt5kh03ijA5Fk8nypCG6U6DUiyjlaHB0b9h8b3Zhcdbkyfpo8LH2YCriwcZG7LKM610v4OX4h4boAfQhgrUUHq8c1IyUyd9IVgwU7X1AdSY79S3gHc2kT4mBHLs8gk47KkJouE0RetrNB5e/OkyuhJ5shyx5j45ySvVVpUOoMFkTeIAsR9KQQKBgQC6bCL+71ea39l2eF/Cm8s49rIDqMMr8QYCKBbfNDP4TxuvBkAZUdd1CygWQY+ocM8URbjWzS8lbWAoN9IPdl3xVlxuTZ6h1wrxmpZTSTdlMH+M4e3C+NZ3R29bKV934HeVXEkLa+ZNZQVveI6gP55Go74bqxc4k9+h/TUuld8oSwKBgQC5UMPgTOqfQp1InpIv5j75vSEKLAZcgHfsvX5hOyt6ykZXRA+4b+SS5kKAjk1Syu3DSshWukbprmS9uengI1sj8rm45Sc3rZ8s6uuWF6NX54v5kkw5qfKPIxd2bSqHOA0DHywafZ8q0Ko5fq18kjN3MH5HH5iGXRZYS1t/invA8QKBgHqqOuDKtjdHQf0tOb2A69jAouO7gSkBwDVdEaeu3t9tlka1cyn16zKts6PpYdCw4eFx+y0D+BjFfncYO9VGyovJiqpd0pqlOCM/19hXneasYdFevCcFu4Di9Ufj0li7z5PtFHc6eWDFryzpA9g35DqQ9b+Y9X+Z9ZXOWdcccKk/AoGAHtgOghrLQk64FwotksNj3/VWtna1aFgJneG8Uzqh9gIMyyGM7EnTZY/lqbgFrq4P/N1JkwXWH7bjFaEICEJaPRV9TAT4DhBb2gIPzB+LFGp5pcRv43kh4ikZEqEA3xi5MbfSg2Y9Q8cPThqDjaRX5JKxsezUWijMO03voL7P8kECgYEAt22GNdgtRoFngpr/ASW9fP4bORVYd9H11s3qkmKN+4hLalzP0VzRrEltgKaoVMyHISgRkLnkHf//Zj0qMky/tWSMDh+n+ZpUhyzzsxTq8lZA6MDTOF5j02SpP0mM4Xjey7WmO4sZLLu7JU/3n1oV4pQDBozla85Jaky+pob7YaA=";
	public static String merchant_private_key = "MIIEwAIBADANBgkqhkiG9w0BAQEFAASCBKowggSmAgEAAoIBAQClUfHpS/zoFXPWLsvc29vdlujmRJPU3aiuF5pWQr11OI91cr26x0OYCHas8/QOIS5Ggb3Hw9Fijmkliwzfbnqj7YVNNWE0InG0hysFwPfY3wjS46TVFNSwQcHl9zrQgbqwGjO5bbbj1OGdACwiwjWJq6j6OvU1MHF586hneao+wz5wlf8ut8dr+1pRxMDD5nqHLkol1rSBRVLqA32/Fs+qz/iZN0/KrC2brX/87orNBw5MpS2wdWdioOJeVXTDW/HDGFjvL15s1mh78I/P4FT06wH8auHLBh8+HvFSfp7NvF0ZyZUHu9tYmmm1k2hlrJiRE1S/wxo+os9h5rnd4WuFAgMBAAECggEBAJEcBYAm793y/pNQziaVYT72eIWuSih9S9NL6m+u80eSFvIbfggVYfJv82NKWr2QSGMg/Kj866xbnlWS4QC5o7KCCRDFOwYc+bthLdVGFQbqdn9Ny+AxAaOYhI7LXHeqd2ieByrK7865jDNX9GWqHH40DAVgfN1sIR7PTdFNzK57HXoGrkQpPxZkNGsRNJ6xCMOE0w42VtIYLJ35+D6qZXeJblKp4sEv8vUleFaEZSkU+OFld1I36AW3fhELT8lMpkFh6eJTlCA3yjQEoV4OG60HVzKnl+5YheesYhfoAyu8xACoKWEkUxeMkYVwSwXU4De2P8qif4e1E08G+D+feiECgYEA4dCzeu/nkGo1kaz0dRSveTcLBR5zrCri9PLP+/S5b5BEwQmGL0fLl3x6yt9dGbSiIUjxDkcWSZ2m2PXGrO1yXY1zs30vWLSx6L3l9KctX8BfsyrBRo5w35/Y+j8b4ka3GGEPmdaCj0dK4bh4f6GolfKKZ+GpU6BnoDhaOa4NOjkCgYEAu2sgZVbTFYwUjKT8BCSRt36VEY/KE+SNNfY17ChDDlyrnYrkxAWHWqFyHeV8xrvLByB36YeOdzv5S2YM8hVcqyZ/jEKlwZG6fg+el7YhRqhJMbJXuU2AM8Qya7TQLSaWsKfi1G3pvTqWkMux519I8tu9yreK4wguBllEezV1q60CgYEArdBj5lP1DO8Drs7PF7PFYWsh213WMYaNTXf86XY0qhAFLAT1uTztE/xn0/JcCiZEyZQIoDHNkPp9a/C6bW8Tobj4fwbzw7bKXliVQVzRCyvbPeDCBlorvaWfcPfUsbY2xtgnFwXLVxfMJrREZBF933ViXZWQLWOBgA0APfegDNkCgYEAqvmYrTpfCNoo6QGd8v2VfYtZ3JKLbEhlVmQNXyp/uftqiCdseTL9/v0niQSRJw+ssQy6t+11V2r8Cv/HMZWxW2WcmE04v/T86AHB0W9Svg3J8C9dfeuo2BDVWpKyE26PrAsMkHTQ9lMbhm59FrFDcGJsqyFz75fHvPz0z12+wmUCgYEAxxcw6V2EWkJ0TNpACrF1S5mdnUTISSN8g3Ncm2cuVqOw2qTyhTkthxJm13DOFX7AECf8mcuWrFkjWr7DTWPo65MPkcPTa5W9ExQnnzTu4EsAS+Xsw5qrmJUskIL0M6//PFhXAUEPIxIteppTxyxonsq5mhl9Vba+18ti0eohC1E=";
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm
	// 对应APPID下的支付宝公钥。
	// public static String alipay_public_key =
	// "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwhjDxGxCpNfGzO7pVBbyBWad+AigrX3vjRkqkk+6LhEncQj0aljQfV/kVoe7KAiRkFfvzRzhZE9O60kuxEN8soUNdM/i7Tltx7FhsWhHrZqRGtNrXebT9drd+bWhMHCVuMISZZjoo0uhrlvGzRgBW8pTLG0D2laDgkZ6qTK/UejXEX2c1LTo3xkdquEZhMTQw/XIFkuo7zX9U4xFPsroAT8KW7i1ibbZ6BtoEdQ4ySASoPTLrZJwHxbYIkSXCjl2iBoWE/0/C/IgDqOIti7hzjp/cXHzWAxE9LmPWnJvms7fdzwN1rfRIgyTXJKUBUm6DWs8JQX2FY4gH4A4qe+KXQIDAQAB";

	public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlKD30v7jnj52i2XwpqXFi9DlsQR2RmXbXFIYKKP1MfgcTKGlqSu6GCSxWQfS3zGoUwXK29Z/GoyrB54wT8oyZleeTga6R+xUk84+s+/EYw0WuSKaa3qJprkGw4yz+E3N/tr5NGX7hlmSG2DLLYFcgbOHlvoM+aSsqmtvkoZYIHEI9sS9FDIN8npi2nMn8ga0AszXqKNfZjheZHRMMtvUI2XQhc/3iffVGRO7O8fC/3pLdgoqdG4qZSie9y28U/yoVlxwEUpFJZANc8gu/RS8K0Sg+SeD5mdIpct1vuKI73C2Z6QoJUfG3P4tavsxywAaW5A1TcnM8jiBC/2xY5eAIQIDAQAB";
	// 服务器异步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	//
	// public static String notify_url =
	// "http://www.panda-newenergy.com/marathon/alipay_notify.do";
	public static String notify_url = "http://www.caa-paoyou.com/Marathon/alipay_notify.do";
	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	//

	public static String return_url = "return_url.jsp";// = "http://101.200.155.113/marathon/";
     
	// 签名方式
	public static String sign_type = "RSA2";

	// 字符编码格式
	public static String charset = "utf-8";

	// 支付宝网关https://openapi.alipay.com/gateway.do
	// https://openapi.alipaydev.com/gateway.do
	public static String gatewayUrl = "https://openapi.alipay.com/gateway.do";

	// 支付宝网关
	public static String log_path = "C:\\";

	// ↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

	/**
	 * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
	 * 
	 * @param sWord
	 *            要写入日志里的文本内容
	 */
	public static void logResult(String sWord) {
		FileWriter writer = null;
		try {
			writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis() + ".txt");
			writer.write(sWord);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (writer != null) {
				try {
					writer.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
