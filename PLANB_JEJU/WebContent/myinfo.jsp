<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
  <%
    String access_token = request.getParameter("access_token");
    String token_type = request.getParameter("token_type");
    String redirectURI = URLEncoder.encode("http://127.0.0.1:8090/PLANB_JEJU/myinfo.jsp", "UTF-8");
    String apiURL;
    apiURL = "https://openapi.naver.com/v1/nid/me";
    //apiURL += "Authorization=" + token_type +" "+ access_token;
    out.println(token_type +" "+ access_token);
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      con.setRequestProperty("Authorization", token_type +" "+ access_token);
      int responseCode = con.getResponseCode();
      BufferedReader br;
      System.out.println("myinfo responseCode="+responseCode);
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
        
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  %>
  </body>
</html>