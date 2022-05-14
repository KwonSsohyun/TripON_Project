package com.tripon.view.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tripon.biz.purchaseManager.PurchaseManagerPagingVO;
import com.tripon.biz.purchaseManager.PurchaseManagerService;
import com.tripon.biz.purchaseManager.PurchaseManagerVO;

@Controller
public class PurchaseManagerController {
	// Service를 이용하는 Controller
	
	@Autowired
	PurchaseManagerService purchasemanagerservice;
	
	//아임포트 URL
	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	public static final String IMPORT_PAYMENTINFO_URL = "https://api.iamport.kr/payments/find/";
	public static final String IMPORT_PAYMENTLIST_URL = "https://api.iamport.kr/payments/status/all";
	public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	public static final String IMPORT_PREPARE_URL = "https://api.iamport.kr/payments/prepare";
	
	//"아임포트 Rest Api key";
	public static final String KEY = "2287397399198330";
	//"아임포트 Rest Api Secret"; 
	public static final String SECRET = "988ac6a45ee52fea6bacddb77366d3b44c999fb717fcd3b2adac4ad862b60bbe5cf833bb628fddcd";
	
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
		
	// Map을 사용해서 Http요청 파라미터를 만들어 주는 함수 private
	List<NameValuePair> convertParameter(Map<String,String> paramMap){
		List<NameValuePair> paramList = new ArrayList<NameValuePair>(); 
		Set<Entry<String,String>> entries = paramMap.entrySet();
		for(Entry<String,String> entry : entries) {
			paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue())); 
		} 
		return paramList; 
	} 
	
	//Purchase 관리자 list
	@RequestMapping(value="/admin/purchase_manager")
	//해당 경로로 이동, 실행문
	public String getPurchaseManagerList(PurchaseManagerPagingVO pv, PurchaseManagerVO vo, Model model) {
		System.out.println("PurchaseMAnagerController의 출력문 : 관리자 페이지 list");
		
		// 페이징 처리
		String cntPerPage = "10"; 

		//int total = purchasemanagerservice.getPurchaseManagerList(vo).size();
		int total = purchasemanagerservice.getTotal();
		System.out.println("total: "+total);
		if (pv.getNowPage() == 0)  pv.setNowPage(1);

		pv = new PurchaseManagerPagingVO(total, pv.getNowPage(), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		vo.setStart(pv.getStart()); //vo.setStart(0);
		vo.setListCnt(Integer.parseInt(cntPerPage)); //vo.setListcnt(5);
		
		//model
		model.addAttribute("puchaselist", purchasemanagerservice.getPurchaseManagerList(vo));
		return "/admin/purchase_manager";
	}
	
	// 결제취소
	@RequestMapping(value="/admin/purchase_cancel" )
	public @ResponseBody int cancelPayment(String mid, PurchaseManagerVO vo) throws Exception {
		String token = getImportToken();
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_CANCEL_URL); 
		Map<String, String> map = new HashMap<String, String>();
		post.setHeader("Authorization", token);
		map.put("merchant_uid", mid); 
		String asd = ""; 
		post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
		HttpResponse res = client.execute(post); 
		ObjectMapper mapper = new ObjectMapper(); 
		String enty = EntityUtils.toString(res.getEntity()); 
		JsonNode rootNode = mapper.readTree(enty); 
		asd = rootNode.get("response").asText(); 
		
		if (asd.equals("null")) {
			System.out.println("환불실패");
			return -1;
		} else {
			System.out.println("환불성공");
			//결제 취소 - DB update
			vo.setPur_merchantid(mid);
			purchasemanagerservice.updateState(vo);
			return 1; 
		} 
	}
		
}
