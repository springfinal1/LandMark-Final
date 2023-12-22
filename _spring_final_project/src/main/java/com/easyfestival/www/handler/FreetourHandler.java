package com.easyfestival.www.handler;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;

import com.easyfestival.www.domain.AirArrInfoVO;
import com.easyfestival.www.domain.AirInfoVO;
import com.easyfestival.www.domain.AirplaneInfoVO;
import com.google.gson.Gson;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class FreetourHandler {
	
	// 해외에서 인천공항으로 도착하는 
	
	public List<AirArrInfoVO> getArrivalInfo(String airportCode, AirplaneInfoVO aivo) throws IOException, ParseException {
		//도착
		final String myKey = "ijQL0nu774ZPOX%2B4O4A1liiipYbCGKpoAGKZfExa6pDSbgqb4r1kI33P%2Byoz1pZ3MuNh4YuLM8SH%2BHI57KBwEQ%3D%3D";
		
		String thisYear = "";
		String year = "";
		String month = "";
		String day = "";
		String fullYear = "";
		
		if(aivo.getVerification().equals("왕복")) {
			thisYear = aivo.getDate().substring(aivo.getDate().indexOf("~")+1,aivo.getDate().length()); // 년-월-일
			year = thisYear.substring(0,thisYear.indexOf("-")); // 년
			month = thisYear.substring(thisYear.indexOf("-")+1, thisYear.lastIndexOf("-")); // 월
			if(month.length() == 1) {
				month = "0"+month;
			}
			day = thisYear.substring(thisYear.lastIndexOf("-")+1,thisYear.length()); // 일
			if(day.length() == 1) {
				day = "0"+day;
			}
			
			fullYear = year+month+day;
		}else if(aivo.getVerification().equals("편도")){
			fullYear = aivo.getDate();
		}

		
		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/B551177/StatusOfPassengerFlightsDeOdp/getPassengerArrivalsDeOdp"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + myKey); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); // 페이지 수
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("100000", "UTF-8")); // 한페이지 수																													// 수
		urlBuilder.append("&" + URLEncoder.encode("type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); // 타입
		urlBuilder.append("&" + URLEncoder.encode("searchday", "UTF-8") + "=" + URLEncoder.encode(fullYear,"UTF-8")); // 조회일자		
		urlBuilder.append("&" + URLEncoder.encode("airport_code", "UTF-8") + "=" +URLEncoder.encode(airportCode,"UTF-8")); // airportCode -> 인천
		
		
		
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();

		String result = sb.toString();
		JSONParser parser = new JSONParser();

		JSONObject obj = (JSONObject) parser.parse(result);
		JSONObject value = (JSONObject) obj.get("response");
		JSONObject body = (JSONObject) value.get("body");


		JSONArray items = (JSONArray) body.get("items");

		Gson gson = new Gson();

		List<AirArrInfoVO> airList = new ArrayList<AirArrInfoVO>();

		if(items.size() > 0) {
			for(int i=0; i<items.size(); i++) { 
				JSONObject a = (JSONObject)items.get(i);
				airList.add(gson.fromJson(a.toJSONString(), AirArrInfoVO.class)) ;
			}			
			return airList;
		}else {
			return null;
		}
		 

		
	}
	// 인천공항에서 해외로 출발하는
	public List<AirInfoVO> getDepartureInfo(String airportCode, AirplaneInfoVO aivo) throws IOException, ParseException {
		//출발
		final String myKey = "ijQL0nu774ZPOX%2B4O4A1liiipYbCGKpoAGKZfExa6pDSbgqb4r1kI33P%2Byoz1pZ3MuNh4YuLM8SH%2BHI57KBwEQ%3D%3D";
		String thisYear = "";
		String year = "";
		String month = "";
		String day = "";
		String fullYear = "";
		
		// 필요한거 출발 날짜 , 
		if(aivo.getVerification() == "왕복") {
			thisYear = aivo.getDate().substring(0,aivo.getDate().indexOf("~")); // 년-월-일
			
			year = thisYear.substring(0,thisYear.indexOf("-")); // 년
			
			month = thisYear.substring(thisYear.indexOf("-")+1, thisYear.lastIndexOf("-")); // 월
			if(month.length() == 1) {
				month = "0"+month;
			}
			day = thisYear.substring(thisYear.lastIndexOf("-")+1,thisYear.length()); // 일
			if(day.length() == 1) {
				day = "0"+day;
			}
			fullYear = year+month+day;
			
		}else if(aivo.getVerification().equals("편도")){
			fullYear = aivo.getDate();
		}
		
		
		
		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/B551177/StatusOfPassengerFlightsDeOdp/getPassengerDeparturesDeOdp"); /* URL */
		//urlBuilder.append("?serviceKey="+myKey+"&pageNo=1&numOfRows=100000&type=json&searchday="+fullYear+"&airport_code="+airportCode);
		
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + myKey); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); // 페이지 수
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("100000", "UTF-8")); // 한페이지 수																													// 수
		urlBuilder.append("&" + URLEncoder.encode("type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); // 타입
		urlBuilder.append("&" + URLEncoder.encode("searchday", "UTF-8") + "=" + URLEncoder.encode(fullYear,"UTF-8"));// 조회일자
		urlBuilder.append("&" + URLEncoder.encode("airport_code", "UTF-8") + "=" + URLEncoder.encode(airportCode,"UTF-8")); // 인천 -> airportCode 
		
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();

		String result = sb.toString();

		JSONParser parser = new JSONParser();

		JSONObject obj = (JSONObject) parser.parse(result);
		JSONObject value = (JSONObject) obj.get("response");
		JSONObject body = (JSONObject) value.get("body");


		JSONArray items = (JSONArray) body.get("items");
		
		Gson gson = new Gson();

		List<AirInfoVO> airList = new ArrayList<AirInfoVO>();

		if(items.size() > 0) {
			for(int i=0; i<items.size(); i++) { 
				JSONObject a = (JSONObject)items.get(i);
				airList.add(gson.fromJson(a.toJSONString(), AirInfoVO.class)) ;
			}
			return airList;
		}else {
			return null;
		}
		 

	}
}
