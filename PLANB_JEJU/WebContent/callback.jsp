<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.util.*" %>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONValue"%>
<%@ page import="org.json.simple.parser.*"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
  <%
    String clientId = "q6YKhoTAKENem9wjtax9";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "Sc0RgWqz0W";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://127.0.0.1:8090/PLANB_JEJU/myinfo.jsp", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
    System.out.println("apiURL="+apiURL);
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      
      int responseCode = con.getResponseCode();
      BufferedReader br;
      System.out.print("responseCode="+responseCode);
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuffer res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      
      if(responseCode==200) {
        out.println(res.toString());
        //{"access_token":"AAAAN6q5qh4M5yMsJ5bN5f5ECDWEJl9Qmq+Sck8QjRiGT43zKwYKW1I0PWrzgChjV8D7loQNJ4YRcFxkAYjjO4+JeHg=","refresh_token":"dMLTDii1ipcxrRHZdAO3ipX3t7LZHyUY019YjUAxip3sMqqPqiiWDs9IR7A1uisv57gpkgVUR794Thztb6G7Zfbiid3t9DFD5F3ZtV7lHvCjBGDykipkCz2HKUu86nCdLFEsLcSe","token_type":"bearer","expires_in":"3600"}
        
        //access_token의 값을 가져왔으니까 로그인한 정보를 네이버api에서 찾을수가 있음.
        JSONParser parser = new JSONParser(); //JSONParser 생성
        Object obj = parser.parse( res.toString() ); //string 형태를 object로 변환
        JSONObject jsonObject =  new JSONObject(); //JSONObject 생성
        if (obj instanceof Map){
        	//Object 형태가 Map으로 형변환이 가능할때 결과값 true
        	//**instanceof는 객체타입을 확인하는데 사용
            jsonObject.putAll((Map)obj); //mappings to be stored in this map 
        }
        
        access_token = jsonObject.get("access_token").toString(); //AAAAN6q5qh4M5yMsJ5bN5f5ECDWEJl9Qmq+Sck8QjRiGT43zKwYKW1I0PWrzgChjV8D7loQNJ4YRcFxkAYjjO4+JeHg=
        String token_type = jsonObject.get("token_type").toString(); //bearer 
        
        
        //로그인한 정보 가져오기
        
        URL url2 = new URL("https://openapi.naver.com/v1/nid/me");
        HttpURLConnection con2 = (HttpURLConnection)url2.openConnection();
        con2.setRequestMethod("GET");
        //해더에 담는다. token_type +" "+ access_token 이렇게 한거는 api 참조
        con2.setRequestProperty("Authorization", token_type +" "+ access_token);
        out.println(token_type +" "+ access_token);
        
        int responseCode2 = con2.getResponseCode();
        BufferedReader br2;
        
        if(responseCode2==200) { // 정상 호출
          br2 = new BufferedReader(new InputStreamReader(con2.getInputStream(),"UTF-8"));
        
        
        
        } else {  // 에러 발생
          br2 = new BufferedReader(new InputStreamReader(con2.getErrorStream(),"UTF-8"));
        }
        String inputLine2;
        StringBuffer res2 = new StringBuffer();
        while ((inputLine2 = br2.readLine()) != null) {
          res2.append(inputLine2);
        }
        br2.close();
        if(responseCode2==200) {
          //로그인한 정보를 가져와서 뿌려준다.
          //{"nickname":"\uacf0","enc_id":"e4e52043ae106f1c48e8e33b1615364049fa009d2ea355990ce37cdf4097b0a0","profile_image":"https:\/\/ssl.pstatic.net\/static\/pwe\/address\/img_profile.png","age":"20-29","gender":"M","id":"14069936","name":"\uc774\uc900\uc131","email":"ljs7814@naver.com","birthday":"07-28"}}
          out.println(res2.toString());
          System.out.println(res2.toString());
          //nickname:"곰" 이라고 나와야하는데 한글이 꺠져서 인코딩 관련해서 찾아 보자
        } 
      
        
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  %>
  </body>
</html>