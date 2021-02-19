package com.untoon.member.controller;

import java.io.IOException;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.untoon.member.model.service.MemberService;
import com.untoon.member.model.vo.Dice;

@Controller
public class EmailController {

	@Autowired
	private MemberService mService;
	
	//이메일 인증 비밀번호
	@Autowired
	private Dice diceObj;
	
	
	//이메일 전송
	@Inject  // 생성한 클래스 없이 바로 객체 주입
	JavaMailSender mailSender;
	
	@ResponseBody
	@RequestMapping(value="emailNum.do", method=RequestMethod.POST)
	public String mailSending(String email)throws IOException{
		
		int result = mService.emailCheck(email);
		
		//이메일 중복 존재 할때 
		if(result > 0) {
			return "duplicate";
		}else {
			String t="회원가입 인증 이메일 입니다.";
			return sendEmail(email, t);
		}
		
	}

	private String sendEmail(String email, String t) {
		// 인증번호 난수(랜덤 숫자)
		Random r = new Random();
		
		//이메일로 받는 인증코드 부분(난수)(0 ~ 4589361) + 49311;
		int diceInt = r.nextInt(4589362) + 49311;
		
		//String으로 바꿔준다
		String dice = Integer.toString(diceInt);
		
		diceObj.setDice(dice);
		
		//보내는 사람 email
		String setfrom = "jeewon294@gmail.com";
		
		//받는사람 email
		String tomail = email;
		
		//제목 
		String title = t;
		
		//내용
		 String content =
			        
			        System.getProperty("line.separator") + // 현재 OS에 맞는 개행 문자를 사용할 수 있다.
			        
			        System.getProperty("line.separator") +
			                
			        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다" +
			        
			        System.getProperty("line.separator") +
			        
			        System.getProperty("line.separator") +

			        "인증번호는 " + dice + " 입니다. " +
			        
			        System.getProperty("line.separator") +
			        
			        System.getProperty("line.separator") +
			        
			        "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다.";
		 
		  try {
	           // 이메일 메세지 보낼 수 있는 객체 라이브러리
	            MimeMessage message = mailSender.createMimeMessage();
	            
	            // MimeMessage를 도와주는 객체 라이브러리
	            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

	            // MimeMessageHelper 양식
	            messageHelper.setFrom(setfrom);  // 보내는 사람 E-mail
	            messageHelper.setTo(tomail);     // 받는 사람    E-mail
	            messageHelper.setSubject(title); // 메일 제목   (생략 가능)
	            messageHelper.setText(content);  // 메일 내용
	            
	            // 인증번호 출력용
	            System.out.println("랜덤 생성된 인증번호 :" + dice);

	        // MimeMessage 전송
	            mailSender.send(message);
	            
	            return "member/emailAuthentication";
	        } catch (Exception e) {
	            System.out.println(e);
	            return "common/errorPage";
	        }
	    }
	
	//email 인증번호 비교 메소드
	@ResponseBody
	@RequestMapping(value="email.do", method = RequestMethod.POST)
	public String emailAuthentication(String confirm_number) {
		
		String dice = diceObj.getDice();
			System.out.println("인증번호 : " + dice);
			System.out.println("사용자가 입력한 인증번호 :" + confirm_number);
		
		//인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
			if(dice != null) {
				//확인버튼 누를때 
				if(confirm_number.equals(dice)) {
					//확인버튼 눌렀는지 체크용
					diceObj.setBtn("ok");
					return "ok";
					//확인 버튼 안누르면 getBtn()이 null
				}else {
					return "fail";
				}
			}
			return "fail";
		}
	
		/*
		 * //이메일 인증번호 리셋 메소드
		 * 
		 * @ResponseBody
		 * 
		 * @RequestMapping()
		 */
	
	}





















