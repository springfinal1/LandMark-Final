package _spring_final_project;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.easyfestival.www.config.RootConfig;
import com.easyfestival.www.domain.AirplaneDTO;
import com.easyfestival.www.repository.FreetourDAO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class})
public class inputAirport {

   @Inject
   private FreetourDAO freedao;
   
   @Test
   public void getAirplaneInfo() throws IOException, ParseException {
      
      
      String key = "ijQL0nu774ZPOX%2B4O4A1liiipYbCGKpoAGKZfExa6pDSbgqb4r1kI33P%2Byoz1pZ3MuNh4YuLM8SH%2BHI57KBwEQ%3D%3D";
      String pageNo = "1";
      
      
      StringBuilder urlBuilder = new StringBuilder(
            "http://openapi.airport.co.kr/service/rest/AirportCodeList/getAirportCodeList?ServiceKey="
            + key+"&pageNo="+pageNo+"&_type=json"+"&numOfRows=1339"); /* URL */
      
      URL url = new URL(urlBuilder.toString());
      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
      //conn.setRequestMethod("GET");
      //conn.setRequestProperty("Content-type", "application/json");
      //System.out.println("Response code: " + conn.getResponseCode());
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
      
      JSONObject obj = (JSONObject)parser.parse(result);
      JSONObject value = (JSONObject) obj.get("response");
      JSONObject body = (JSONObject) value.get("body");
      JSONObject items = (JSONObject) body.get("items");
      JSONArray arr =  (JSONArray) items.get("item");
      
      Gson gson = new Gson();
      List<AirplaneDTO> list = new ArrayList<AirplaneDTO>();
      
      String strArr = arr.toJSONString();
      List<AirplaneDTO> list2 = gson.fromJson(strArr,new TypeToken<List<AirplaneDTO>>() {}.getType());
   
      
      
      
      for(int i=0; i<arr.size(); i++) {
         JSONObject a = (JSONObject)arr.get(i);
         list.add(gson.fromJson(a.toJSONString(), AirplaneDTO.class)) ;
         freedao.insertList(list.get(i));
      }   
   }
}