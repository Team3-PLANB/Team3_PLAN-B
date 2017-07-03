package com.planb_jeju.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;

import javax.servlet.http.HttpServletRequest;


/**
 * 참고 :
 * http://netframework.tistory.com/424
 * https://www.phychode.com/sprt/blog/sprtBlogPost.pem?blogSeq=346
 * http://clearpal7.blogspot.kr/2016/07/18-websocekt-stomp_25.html
 * http://heowc.tistory.com/10
 *
 *	웹소켓 관련 설정 클래스 
 *	@Class : WebSocketController
  	@Date : 2017.06.30
  	@Author : 이준성
  	@Board : 2017. 06. 30.
  	@Desc : 웹소켓 설정 클래스
 */
  

@Configuration
@EnableWebSocketMessageBroker	
public class WebSocketConfig extends AbstractWebSocketMessageBrokerConfigurer {
									
    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        config.enableSimpleBroker("/topic");  //보내는 사람 프리픽스
        config.setApplicationDestinationPrefixes("/stomp"); // 받는사람 프리픽스 역할
    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
    	registry.addEndpoint("/websocket").withSockJS(); //웹소켓 서버 접속을 위한 url 설정 정의 [withSockJS] 라이브러리를 사용
    }
}