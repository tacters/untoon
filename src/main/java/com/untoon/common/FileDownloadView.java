//package com.ict.spring.common;
//
//import java.io.File;
//import java.io.FileInputStream;
//import java.io.OutputStream;
//import java.util.Map;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.stereotype.Component;
//import org.springframework.util.FileCopyUtils;
//import org.springframework.web.servlet.view.AbstractView;
//
//
//// 스프링에서 BeanNameViewResolver 에 의해 실행되는 뷰클래스가 되려면
//// 반드시 스프링이 제공하는 AbstractView 를 상속받은 후손클래스여야 함
//@Component("filedown")
//public class FileDownloadView extends AbstractView {	//그냥 일반클래스
//
//	@Override
//	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
//			HttpServletResponse response) throws Exception {		// 컨트롤러에서 뷰리졸버로 리턴한 model 정보가 자동 전달됨
//	
//		File downFile = (File)model.get("downFile");
//		
//		// 한글 파일명 인코딩 처리를 위해 파일명만 추출함
//		String fileName = downFile.getName();
//		
//		response.setContentType("text/plain; charset=utf-8");
//		response.addHeader("Content-Disposition", "attachment; filename=\""
//				+ new String(fileName.getBytes("utf-8"), "ISO-8859-1") + "\"");
//		response.setContentLength((int)downFile.length());
//		
//		//저장된 폴더에서 대상 파일을 읽어서, 요청한 클라이언트 브라우저로 보내기 위함
//		//입출력 스트립 생성함
//		OutputStream out = response.getOutputStream();
////		FileInputStream fin = null;
//		
//		try(FileInputStream fin = new FileInputStream(downFile);){
//			FileCopyUtils.copy(fin, out);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		out.flush();//버퍼 비우기
//		out.close();
//	}	
//}

package com.untoon.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

//스프링에서 BeanNameViewResolver에 의해 실행되는 뷰클래스가 되려면
//반드시 스프링이 제공하는 AbstractView를 상속받은 후손클래스여야 함
@Component("filedown") //클래스등록 아이디 명
public class FileDownloadView extends AbstractView { //일반 클래스임 return은 filedown으로 해야됨 //추상메소드여서 오버라이딩 해줘야한다.

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 컨트롤러에서 뷰리졸버로 리턴한 model 정보가 자동 전달됨
		File downFile = (File)model.get("downFile");
		
		// 한글 파일명 인코딩 처리를 위해 파일명만 추출함
		String fileName = downFile.getName();
		
		response.setContentType("text/plain; charset=utf-8");
		response.addHeader("Content-Disposition", "attachment; filename=\""
				+ new String(fileName.getBytes("utf-8"), "ISO-8859-1") + "\"");
		response.setContentLength((int)downFile.length());
		
		//저장된 폴더에서 대상 파일을 읽어서, 요청한 클라이언트 브라우저로 보내기 위한
		//입출력 스트림 생성
		OutputStream out = response.getOutputStream();
		//FileInputStream fin = null;
		
		try(FileInputStream fin = new FileInputStream(downFile);){
			FileCopyUtils.copy(fin, out);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		out.flush();
		out.close();
	} 
}



