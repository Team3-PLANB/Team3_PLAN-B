package com.planb_jeju.service;


import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.Document;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import java.io.BufferedReader;
import java.io.IOException;

public class TourApiService {
    public static List<String> getListOfSite(StringBuilder baseUrl, StringBuilder urlParam) throws IOException, SAXException, ParserConfigurationException {
        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); /*URL*/ 
        //http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList : 지역 기반 관광지 목록 조회 url
        
        //http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?
        //ServiceKey=sINbtYMpCw1C2%2BFZOiN%2FbJjqUn42vfFvg0%2BkN1NbFHjDt3JfU4U7gLkSOf16L07YIBDBLElP%2FLCJYIiqNBH5dQ%3D%3D&
        //contentTypeid=12&
        //areaCode=39&
        //cat2=A0101&
        //MobileOS=ETC&
        //MobileApp=AppTesting
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=sINbtYMpCw1C2%2BFZOiN%2FbJjqUn42vfFvg0%2BkN1NbFHjDt3JfU4U7gLkSOf16L07YIBDBLElP%2FLCJYIiqNBH5dQ%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("contentTypeid","UTF-8") + "=" + URLEncoder.encode("12", "UTF-8")); /*관광지 코드 : 12*/
        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode("39", "UTF-8")); /*관광지 지역 제주도 코드 : 39*/
        urlBuilder.append("&" + URLEncoder.encode("cat2","UTF-8") + "=" + URLEncoder.encode("A0101", "UTF-8")); /*중분류 : 자연*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*기본 required 코드 */
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTesting", "UTF-8")); /*기본 required 코드 */
        
        //contentTypeid=12&areaCode=39&cat2=A0101&MobileOS=ETC&MobileApp=AppTesting
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
  
        	System.out.println("line값은??"+line);
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        
        
        //xml 파싱문
        DocumentBuilderFactory factory  =  DocumentBuilderFactory.newInstance();
        DocumentBuilder builder    =  factory.newDocumentBuilder();
        //문서를 파싱하려면 : Document document     =  builder.parse("c:/person.xml");
        
        org.w3c.dom.Document document     = builder.parse(new InputSource(new StringReader(sb.toString())));
        
        NodeList itemlist     =  ((org.w3c.dom.Document) document).getElementsByTagName("item");
        //태그 (< >)의 이름으로 불러오는 내용
        
        
        //nodelist의 크기를 구하려면 getLength()라는 메소드가 있음
        
        System.out.println(itemlist.getLength());
        
        List<String> siteList = new ArrayList<String>();
        
        
        for (int i = 0; i < itemlist.getLength(); i++) {//태그가 item인 노드들의 리스트 길이만큼
        	//String nodeName = node.getNodeName();
        	NodeList chideofitem = itemlist.item(i).getChildNodes();//item 리스트의 아이템을 순서대로 읽어와서 그 각각의 자식 노드 읽어오기
        	for(int j =0; j<chideofitem.getLength(); j++){
        		//System.out.println(chideofitem.item(j).getNodeName());
        		Node childNode = chideofitem.item(j); //노드 리스트 안의 각 노드 읽어오기
        		if(childNode.getNodeName().equals("title")){
        			
        			//System.out.println(childNode.getTextContent());
        			siteList.add(childNode.getTextContent());
        		}
        	}
		}
              
       /* for (String string : siteList) {
			System.out.println(string);//장소 이름 값 담긴 List 출력
		}*/
        
        return siteList;
        
    }
}