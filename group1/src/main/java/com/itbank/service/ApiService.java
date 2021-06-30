package com.itbank.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

//jsh 0621 네이버 검색 api 예제 코드 변경해서 적용
@Service
public class ApiService {

	public String getNews(String team, String type) {
		 String clientId = "ocuaRdThtEFIOpp9kMXH"; 		//애플리케이션 클라이언트 아이디값"
	        String clientSecret = "Ya8T_ulDBZ"; 	  	//애플리케이션 클라이언트 시크릿값"
	        String apiURL;

	        String text = null;
	        String search_team  = null;
	        
	        switch(team) {	// team 매개변수 받아서 검색 단어 지정
            case "liv" :
            	search_team = "리버풀";
                break;
            case "mu" :
            	search_team = "맨유";
            	break;
            case "mc" :
            	search_team = "맨시티";
            	break;
            case "che" :
            	search_team = "첼시";
            	break;
            case "ars" :
            	search_team = "아스널";
            	break;
            
            case "tto" :
            	search_team = "토트텀";
            	break;
            	
            case "euro" :
            	search_team = "유로 2020";
            	break;
        }
	    
	        try {
	            text = URLEncoder.encode(search_team, "UTF-8"); // [리버풀],[맨유],[맨시티] 등으로 검색 단어 지정
	        } catch (UnsupportedEncodingException e) {
	            throw new RuntimeException("검색어 인코딩 실패",e);
	        }

	        if(type.equals("correct"))	// 관련도순
	        	apiURL = "https://openapi.naver.com/v1/search/news.json?sort=sim&display=10&query=" + text;   
	        else if(type.equals("latest"))	// 최신순
	        	apiURL = "https://openapi.naver.com/v1/search/news.json?sort=date&display=10&query=" + text;   
	        else
	        	apiURL = "";
	        	
	        
	        Map<String, String> requestHeaders = new HashMap<>();
	        requestHeaders.put("X-Naver-Client-Id", clientId);
	        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	        String responseBody = get(apiURL,requestHeaders); 


		return responseBody; // String, Map<String, String>
	}
	
	
	
	// 검색 API 함수들 (참고만)
	private static String get(String apiUrl, Map<String, String> requestHeaders) {
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }


    private static HttpURLConnection connect(String apiUrl) {
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }


    private static String readBody(InputStream body) {
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }

}
