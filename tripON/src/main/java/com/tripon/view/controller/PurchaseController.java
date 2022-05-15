package com.tripon.view.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tripon.biz.purchase.Detail;
import com.tripon.biz.purchase.PurchaseService;
import com.tripon.biz.purchase.PurchaseVO;
import com.tripon.biz.purchase.userinfoVO;

@Controller
public class PurchaseController {
	// Service를 이용하는 Controller
	@Autowired
	PurchaseService purchaseService;
	
	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	public static final String IMPORT_PAYMENTINFO_URL = "https://api.iamport.kr/payments/find/";
	public static final String IMPORT_PAYMENTLIST_URL = "https://api.iamport.kr/payments/status/all";
	public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	public static final String IMPORT_PREPARE_URL = "https://api.iamport.kr/payments/prepare";
	//"아임포트 Rest Api key";
	public static final String KEY = "2287397399198330";
	//"아임포트 Rest Api Secret"; 
	public static final String SECRET = "988ac6a45ee52fea6bacddb77366d3b44c999fb717fcd3b2adac4ad862b60bbe5cf833bb628fddcd";
		
	//상품결제 폼 호출
	@RequestMapping(value="/purchase", method=RequestMethod.POST)
	public String pay(HttpServletRequest request, Model model, Detail detail, userinfoVO vo, HttpSession session) {
		// 테스트 시 100원 결제 희망하면 사용
//		detail.setPriceint("100");
		
		
		vo.setMem_id((String)session.getAttribute("userId"));
		
		model.addAttribute("userinfo", purchaseService.getUserinfoList(vo));
		model.addAttribute("detail", detail);
		model.addAttribute("impKey", "imp19729932"); /* 가맹점 식별코드 */
		return "purchase";
	}
	
	// Map을 사용해서 Http요청 파라미터를 만들어 주는 함수 private
	List<NameValuePair> convertParameter(Map<String,String> paramMap){
		List<NameValuePair> paramList = new ArrayList<NameValuePair>(); 
		Set<Entry<String,String>> entries = paramMap.entrySet();
		for(Entry<String,String> entry : entries) {
		 paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue())); 
		} 
		return paramList; 
	} 
	
	// 아임포트 결제금액 변조는 방지하는 함수 
	 public void setHackCheck(String amount,String uId,String token) { 
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_PREPARE_URL);
		Map<String,String> m =new HashMap<String,String>();
		post.setHeader("Authorization", token);
		m.put("amount", amount); 
		m.put("merchant_uid", uId);
		try { 
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			System.out.println(rootNode); 
		} catch (Exception e) {
			e.printStackTrace(); 
		} 
	} 
	 
	// 아임포트 인증(토큰)을 받아주는 함수 
	public String getImportToken() {
		String result = "";
		HttpClient client = HttpClientBuilder.create().build(); 
		HttpPost post = new HttpPost(IMPORT_TOKEN_URL); 
		Map<String,String> m =new HashMap<String,String>(); 
		m.put("imp_key", KEY);
		m.put("imp_secret", SECRET); 
		try { 
			post.setEntity( new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post); 
			ObjectMapper mapper = new ObjectMapper(); 
			String body = EntityUtils.toString(res.getEntity()); 
			JsonNode rootNode = mapper.readTree(body); 
			JsonNode resNode = rootNode.get("response"); 
			result = resNode.get("access_token").asText(); 
		} catch (Exception e) { 
			e.printStackTrace(); 
		} 
		return result;
	}
	
	
	//결제 진행 폼=> 이곳에서 DB저장 로직도 추가하기
	@RequestMapping(value="/purchaseok", method=RequestMethod.POST)
	public String payment(HttpServletRequest request, HttpServletResponse response, Model model, PurchaseVO vo) throws IOException {
		purchaseService.insertPurchase(vo);
		return "purchaseok";
	}
	
	@RequestMapping(value="/purchaseMobile", method=RequestMethod.GET)
	public String payfail(HttpServletRequest request, HttpServletResponse response, PurchaseVO vo) {
		if(request.getParameter("imp_success").equals("true")) {
			vo.setPur_impId(request.getParameter("imp_uid"));
			vo.setPur_merchantId(request.getParameter("merchant_uid"));
			purchaseService.insertPurchase(vo);
			return "purchaseok";
		} else {
			return "redirect:getUser_detailsPage?act_num=" + request.getParameter("act_num");
		}
		
	}
}
