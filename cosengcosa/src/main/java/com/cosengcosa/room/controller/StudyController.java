package com.cosengcosa.room.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cosengcosa.room.domain.Study;
import com.cosengcosa.room.service.StudyService;


/**
 * 지식공유 컨트롤러
 * @author 김태윤
 *
 */
@Controller
public class StudyController {
	
	private final static String DEFAULT_PATH = "/resources/upload/";
	
	@Autowired
	private StudyService studyService;
	
	public void setStudyService(StudyService studyService) {
		this.studyService = studyService;
	}
	
	@RequestMapping("/studyList")
	public String StudyList(Model model,
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false, defaultValue="null") String type,
			@RequestParam(value="keyword", required=false, defaultValue="null") String keyword) {
		
		Map<String, Object> modelMap = 
				studyService.studyList(pageNum, type, keyword);
		
		model.addAllAttributes(modelMap);
		
		return "/study/studyList";
	}
	
	@RequestMapping("/studyDetail")
	public String studyDetail(Model model, int no, 
			@RequestParam(value="pageNum", required=false, 
					defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false,  
					defaultValue="null") String type,
			@RequestParam(value="keyword", required=false,
					defaultValue="null") String keyword) throws Exception {
		
		boolean searchOption = (type.equals("null") 
				|| keyword.equals("null")) ? false : true; 		
		
		/* Service 클래스를 이용해 no에 해당하는 게시 글 하나의 정보를 읽어온다.
		 * 두 번째 인수에 true를 지정해 게시 글 읽은 횟수를 1 증가 시킨다.
		 **/
		Study study = studyService.getStudy(no, true);
		
		/* 파라미터로 받은 모델 객체에 뷰로 보낼 모델을 저장한다.
		 * 모델에는 도메인 객체나 비즈니스 로직을 처리한 결과를 저장한다. 
		 **/	
		model.addAttribute("study", study);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("searchOption", searchOption);
		
		// 검색 요청이면 type과 keyword를 모델에 저장한다.
		if(searchOption) {
			model.addAttribute("type", type);
			model.addAttribute("keyword", keyword);
		}
		
		/* 게시 글 상세보기에서 링크로 파일 다운로드를 요청할 때 파일 이름에 한글이 있는
		 * 경우 IE는 URLEncoding을 해주지 않기 때문에 UTF-8로 수동 인코딩 했다.
		 **/
		if(study.getsFile() != null) {
			model.addAttribute("fileName", 
				URLEncoder.encode(study.getsFile(), "utf-8"));
		}
		
		/* servlet-context.xml에 설정한 ViewResolver에서 prefix와 suffix에
		 * 지정한 정보를 제외한 뷰 이름을 문자열로 반환하면 된다.
		 * 
		 * 아래와 같이 뷰 이름을 반환하면 포워드 되어 제어가 뷰 페이지로 이동한다. 
		 **/
		return "/study/studyDetail";
		
	}
	
	@RequestMapping("/writeForm")
	public String writeForm() {
		return "/study/writeForm";
	}
	
	
	@RequestMapping(value="/writeProcess", method=RequestMethod.POST)
	public String insertBoard(
			HttpServletRequest request,
			String title, String writer, String content, 
			@RequestParam(value="file1", required=false) MultipartFile multipartFile) 
					throws IOException {		
		
		System.out.println("originName : " + multipartFile.getOriginalFilename());
		System.out.println("name : " + multipartFile.getName());	
		
		Study study= new Study();
		study.setsTitle(title);
		study.setsAskid(writer);
		study.setsAskcontent(content);
		
		/* 업로드한 Multipart 데이터(파일)에 접근하기
		 * 스프링은 MultipartResolver를 사용해 멀티파트 데이터에
		 * 접근할 수 있는 아래와 같은 다양한 방법을 제공하고 있다.
		 * 
		 * MultipartFile 인터페이스를 이용한 접근
		 * @RequestParam 애노테이션을 이용해 MultipartFile에 접근
		 * MultipartHttpServletRequest를 이용해 MultipartFile에 접근
		 * 커맨드 객체를 이용한 접근(커맨드 객체에 MultipartFile 타입의 프로퍼티가 있어함) 
		 * 서블릿 3.0의 Part를 이용한 접근
		 * 
		 * 이 예제는 @RequestParam 애노테이션을 이용해 MultipartFile에 접근하는
		 * 파일 업로드 방법을 소개하고 있다. 
		 **/		
		if(!multipartFile.isEmpty()) { // 업로드된 파일 데이터가 존재하면
			
			// Request 객체를 이용해 파일이 저장될 실제 경로를 구한다.
			String filePath = 
					request.getServletContext().getRealPath(DEFAULT_PATH);
			
			/* UUID(Universally Unique Identifier, 범용 고유 식별자)
			 * 소프트웨어 구축에 쓰이는 식별자의 표준으로 네트워크상에서 서로 모르는
			 * 개체들을 식별하고 구별하기 위해서 사용된다. UUID 표준에 따라 이름을
			 * 부여하면 고유성을 완벽하게 보장할 수는 없지만 실제 사용상에서 중복될 
			 * 가능성이 거의 없다고 인정되기 때문에 실무에서 많이 사용되고 있다.
			 * 
			 * 파일 이름의 중복을 막고 고유한 파일 이름으로 저장하기 위해 java.util
			 * 패키지의 UUID 클래스를 이용해 랜덤한 UUID 값을 생성한다.
			 **/
			UUID uid = UUID.randomUUID();
			String saveName = 
					uid.toString() + "_" + multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("insertStudy - newName : " + file.getName());			
			
			// 업로드 되는 파일을 upload 폴더로 저장한다.
			multipartFile.transferTo(file);
			
			/* 아래와 같이 스프링이 지원하는 FileCopyUtils 클래스를
			 * 이용해 업로드 되는 파일을 upload 폴더로 저장할 수 있다.
			 **/
			//byte[] in = multipartFile.getBytes();
			//FileCopyUtils.copy(in, file);
			
			// 업로드된 파일 명을 Board 객체에 저장한다.
			study.setsFile(saveName);
		}
		
		/* BoardService 클래스를 이용해
		 * 폼에서 넘어온 게시 글 정보를 게시 글 테이블에 추가한다.
		 **/
		studyService.insertStudy(study);
				
		
		/* 클라이언트 요청을 처리한 후 리다이렉트 해야 할 경우 아래와 같이 redirect:
		 * 접두어를 붙여 뷰 이름을 반환하면 된다. 뷰 이름에 redirect 접두어가 붙으면
		 * HttpServletResponse를 사용해서 지정한 경로로 Redirect 된다. 
		 * redirect 접두어 뒤에 경로를 지정할 때 "/"로 시작하면 ContextRoot를
		 * 기준으로 절대 경로 방식으로 Redirect 된다. "/"로 시작하지 않으면 현재 
		 * 경로를 기준으로 상대 경로로 Redirect 된다. 또한 다른 사이트로 Redirect
		 * 되기를 원한다면 redirect:http://사이트 주소를 지정한다.
		 **/		
		return "redirect:studyList";
	}
	
	/* 게시 글쓰기 폼에서 들어오는 게시 글쓰기 요청을 처리하는 메서드
	 * MultipartHttpServletRequest를 이용해 MultipartFile에 접근하기
	 * 
	 * @RequestMapping 애노테이션이 적용된 메서드의 파라미터와 반환 타입에
	 * 대한 설명과 @RequestParam에 대한 설명은 boardList() 메서드의 주석을 
	 * 참고하기 바란다. 
	 */
	@RequestMapping(value="/addProcess", method=RequestMethod.POST)
	public String addBoard(MultipartHttpServletRequest request) 
			throws IOException {
		
		/* MultipartHttpServletRequest 객체를 사용하는 것도 업로드된
		 * 파일에 접근하기 위해서는 MultipartFile을 이용해 접근해야 한다. 
		 **/
		MultipartFile multipartFile = request.getFile("file");
		System.out.println("originName : " + multipartFile.getOriginalFilename());
		System.out.println("name : " + multipartFile.getName());
		
		Study study = new Study();
		study.setsTitle(request.getParameter("title"));
		study.setsAskid(request.getParameter("writer"));
		study.setsAskcontent(request.getParameter("content"));
		
		/* 업로드한 Multipart 데이터(파일)에 접근하기
		 * 스프링은 MultipartResolver를 사용해 멀티파트 데이터에
		 * 접근할 수 있는 아래와 같은 다양한 방법을 제공하고 있다.
		 * 
		 * MultipartFile 인터페이스를 이용한 접근
		 * @RequestParam 애노테이션을 이용해 MultipartFile에 접근
		 * MultipartHttpServletRequest를 이용해 MultipartFile에 접근
		 * 커맨드 객체를 이용한 접근(커맨드 객체에 MultipartFile 타입의 프로퍼티가 있어함) 
		 * 서블릿 3.0의 Part를 이용한 접근
		 * 
		 * 이 예제는 MultipartHttpServletRequest를 이용해 MultipartFile에 접근하는
		 * 파일 업로드 방법을 소개하고 있다.
		 **/	
		if(!multipartFile.isEmpty()) { // 업로드된 파일 데이터가 존재하면
			
			// Request 객체를 이용해 파일이 저장될 실제 경로를 구한다.
			String filePath = 
					request.getServletContext().getRealPath(DEFAULT_PATH);
			
			/* UUID(Universally Unique Identifier, 범용 고유 식별자)
			 * 소프트웨어 구축에 쓰이는 식별자의 표준으로 네트워크 상에서 서로 모르는
			 * 개체들을 식별하고 구별하기 위해서 사용된다. UUID 표준에 따라 이름을
			 * 부여하면 고유성을 완벽하게 보장할 수는 없지만 실제 사용상에서 중복될 
			 * 가능성이 거의 없다고 인정되기 때문에 실무에서 많이 사용되고 있다.
			 * 
			 * 파일 이름의 중복을 막고 고유한 파일 이름으로 저장하기 위해 java.util
			 * 패키지의 UUID 클래스를 이용해 랜덤한 UUID 값을 생성한다.
			 **/
			UUID uid = UUID.randomUUID();
			String saveName = 
					uid.toString() + "_" + multipartFile.getOriginalFilename(); 
			
			File file = new File(filePath, saveName);
			System.out.println("addBoard - newName : " + file.getName());
			
			// 업로드한 파일을 upload 폴더로 저장한다.
			multipartFile.transferTo(file);
			
			// 업로드된 파일 명을 Board 객체에 저장한다.
			study.setsFile(saveName);			
		}		
		
		/* BoardService 클래스를 이용해 
		 * 폼에서 넘어온 게시 글 정보를 게시 글 테이블에 추가한다.
		 **/
		studyService.insertStudy(study);	
		
		return "redirect:studyList";
	}
	
	/* 게시 글 수정 폼 요청을 처리하는 메서드
	 * 
	 * 아래는 "/update"로 들어오는 GET 방식 요청을 처리하는 메서드를 지정한
	 * 것이다. method 속성을 생략하면 기본 값은 RequestMethod.GET 이다.
	 * 
	 * @RequestMapping 애노테이션이 적용된 Controller 메서드의 파라미터에
	 * HttpServletResponse와 PrintWriter를 지정했고 요청 파라미터를 받을
	 * no와 pass도 지정했다. 이렇게 Controller 메서드의 파라미터에 필요한 
	 * 객체나 요청 파라미터 이름과 동일한 이름의 파라미터를 지정하면 스프링이 자동으로
	 * 설정해 준다. 만약 요청 파라미터와 메서드의 파라미터 이름이 다른 경우 Controller
	 * 메서드의 파라미터 앞에 @RequestParam("요청 파라미터 이름")을 사용해
	 * 요청 파라미터의 이름을 지정하면 스프링이 데이터 형에 맞게 적절히 형 변환까지
	 * 해 준다. 형 변환을 할 수 없는 경우 스프링은 400 에러를 발생 시킨다. 예를 들면
	 * Controller 메서드의 파라미터가 정수형 일 때 요청 파라미터의 값이 정수형으로
	 * 형 변환 할 수 없는 경우 400 에러를 발생 시킨다.
	 * 
	 * @RequestMapping 애노테이션이 적용된 메서드의 파라미터와 반환 타입에
	 * 대한 설명과 @RequestParam에 대한 설명은 boardList() 메서드의 주석을 
	 * 참고하기 바란다.
	 **/
	@RequestMapping(value="/update")
	public String updateBoard(Model model, HttpServletResponse response, 
			PrintWriter out, int no, String pass,
			@RequestParam(value="pageNum", required=false, 
					defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false,  
					defaultValue="null") String type,
			@RequestParam(value="keyword", required=false,
					defaultValue="null") String keyword) throws Exception {
		
		// BoardService 클래스를 이용해 게시판 테이블에서 비밀번호가 맞는지 체크한다. 
		
		// 비밀번호가 맞지 않으면
		
		/* 요청 파라미터에서 type이나 keyword가 비어 있으면 일반 
		 * 게시 글 리스트를 요청하는 것으로 간주하여 false 값을 갖게 한다.
		 * Controller에서 type이나 keyword의 요청 파라미터가 없으면
		 * 기본 값을 "null"로 지정했기 때문에 아래와 같이 체크했다.
		 **/
		boolean searchOption = (type.equals("null") 
				|| keyword.equals("null")) ? false : true; 
		
		/* Service 클래스를 이용해 no에 해당하는 게시 글 하나의 정보를 읽어온다.
		 * 두 번째 인수로 false를 지정해 게시 글 읽은 횟 수를 증가시키지 않는다. 
		 **/
		Study study = studyService.getStudy(no, false);
		
		/* 파라미터로 받은 모델 객체에 뷰로 보낼 모델을 저장한다.
		 * 모델에는 도메인 객체나 비즈니스 로직을 처리한 결과를 저장한다. 
		 **/
		model.addAttribute("study", study);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("searchOption", searchOption);
		
		// 검색 요청이면 type과 keyword를 모델에 저장한다.
		if(searchOption) {
			model.addAttribute("type", type);
			model.addAttribute("keyword", keyword);
		}
		
		/* servlet-context.xml에 설정한 ViewResolver에서 prefix와 suffix에
		 * 지정한 정보를 제외한 뷰 이름을 문자열로 반환하면 된다.
		 * 
		 * 아래와 같이 뷰 이름을 반환하면 포워드 되어 제어가 뷰 페이지로 이동한다. 
		 **/
		return "updateForm";
	}
	
	/* 게시 글 수정 폼에서 들어오는 게시 글 수정 요청을 처리하는 메서드
	 * 
	 * @RequestMapping의 ()에 value="/update", method=RequestMethod.Post를
	 * 지정해 "/update"로 들어오는 POST 방식의 요청을 처리하는 메서드를 지정한 것이다.
	 *
	 * @RequestMapping 애노테이션이 적용된 Controller 메서드의 파라미터에
	 * HttpServletResponse와 PrintWriter를 지정했고 요청 파라미터를 받을
	 * Board 객체를 지정했다. 또한 리다이렉트할 때 pageNum을 파라미터로 보내기
	 * 위해서 RedirectAttributes 객체를 메서드의 파라미터로 지정했다.
	 *  
	 * 스프링은 폼으로부터 전달된 파라미터를 객체로 처리 할 수 있는 아래와 같은
	 * 방법을 제공하고 있다. 아래와 같이 요청 파라미터를 전달받을 때 사용하는 
	 * 객체를 커맨드 객체라고 부르며 이 커맨드 객체는 자바빈 규약에 따라 프로퍼티에
	 * 대한 setter를 제공하도록 작성해야 한다. 그리고 파라미터 이름이 커맨드 객체의
	 * 프로퍼티와 동일하도록 폼 컨트롤의 name 속성을 지정해야 한다.
	 * 
	 * @RequestMapping 애노테이션이 적용된 컨트롤러 메서드에 커맨드 객체를
	 * 파라미터로 지정하면 커맨드 객체의 프로퍼티와 동일한 이름을 가진 요청 
	 * 파라미터의 데이터를 스프링이 자동으로 설정해 준다. 이때 스프링은 자바빈
	 * 규약에 따라 적절한 setter 메서드를 사용해 값을 설정한다.
	 * 
	 * 커맨드 객체의 프로퍼티와 일치하는 파라미터 이름이 없다면 기본 값으로 설정된다.
	 * 또한 프로퍼티의 데이터 형에 맞게 적절히 형 변환 해 준다. 형 변환을 할 수 없는
	 * 경우 스프링은 400 에러를 발생 시킨다. 예를 들면 프로퍼티가 정수형 일 때 매칭 되는
	 * 값이 정수형으로 형 변환 할 수 없는 경우 400 에러를 발생 시킨다.
	 * 
	 * @RequestMapping 애노테이션이 적용된 메서드의 파라미터와 반환 타입에
	 * 대한 설명과 @RequestParam에 대한 설명은 boardList() 메서드의 주석을 
	 * 참고하기 바란다. 
	 **/
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String updateBoard(HttpServletResponse response, 
			PrintWriter out, Study study,
			RedirectAttributes reAttrs, 
			@RequestParam(value="pageNum", required=false, 
					defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false,  
					defaultValue="null") String type,
			@RequestParam(value="keyword", required=false,
					defaultValue="null") String keyword) throws Exception {		
		
		// BoardService 클래스를 이용해 게시판 테이블에서 비밀번호가 맞는지 체크한다. 
		
		// 비밀번호가 맞지 않으면
		
		/* 요청 파라미터에서 type이나 keyword가 비어 있으면 일반 
		 * 게시 글 리스트를 요청하는 것으로 간주하여 false 값을 갖게 한다.
		 * Controller에서 type이나 keyword의 요청 파라미터가 없으면
		 * 기본 값을 "null"로 지정했기 때문에 아래와 같이 체크했다.
		 **/
		boolean searchOption = (type.equals("null") 
				|| keyword.equals("null")) ? false : true; 
		
		// BoardService 클래스를 이용해 게시판 테이블에서 게시 글을 수정한다.
		studyService.updateStudy(study);
		
		/* 클라이언트 요청을 처리한 후 리다이렉트 해야 할 경우 아래와 같이 redirect:
		 * 접두어를 붙여 뷰 이름을 반환하면 된다. 뷰 이름에 redirect 접두어가 붙으면
		 * HttpServletResponse를 사용해서 지정한 경로로 Redirect 된다. 
		 * redirect 접두어 뒤에 경로를 지정할 때 "/"로 시작하면 ContextRoot를
		 * 기준으로 절대 경로 방식으로 Redirect 된다. "/"로 시작하지 않으면 현재 
		 * 경로를 기준으로 상대 경로로 Redirect 된다. 또한 다른 사이트로 Redirect
		 * 되기를 원한다면 redirect:http://사이트 주소를 지정한다.
		 * 
		 * Redirect 되는 경우 주소 끝에 파라미터를 지정해 GET방식의 파라미터로
		 * 전송할 수 있지만 스프링프레임워크가 지원하는 RedirectAttributs객체를
		 * 이용하면 한 번만 사용할 임시 데이터와 지속적으로 사용할 파라미터를 구분해
		 * 지정할 수 있다.
		 * 
		 * 아래와 같이 RedirectAttributs의 addAttribute() 메서드를 사용해
		 * 지속적으로 사용할 파라미터를 지정하면 자동으로 주소 뒤에 파라미터로
		 * 추가되며 addFlashAttribute() 메서드를 사용해 파라미터로 지정하면
		 * 한 번만 사용할 수 있도록 주소 뒤에 파라미터로 추가되지 않는다.
		 * addAttribute() 메서드를 사용해 파라미터로 지정한 데이터는 페이지를
		 * 새로 고침해도 계속해서 주소 뒤에 파라미터로 남아있지만 addFlashAttribute()
		 * 메서드를 사용해 지정한 파라미터는 사라지기 때문에 1회성으로 필요한
		 * 데이터를 addFlashAttribute() 메서드를 사용해 지정하면 편리하다.
		 * 
		 * 파라미터에 한글이 포함되는 경우 URLEncoding을 코드로 구현해야 하지만
		 * web.xml에서 스프링프레임워크가 지원하는 CharacterEncodingFilter를
		 * 설정했기 때문에 Filter에 의해 UTF-8로 인코딩 되어 클라이언트로 응답된다.
		 * 
		 * 아래는 게시 글 리스트로 Redirect 되면서 같이 보내야할 searchOption을
		 * RedirectAttributs를 이용해 파라미터로 전달하는 예이다. 
		 **/
		reAttrs.addAttribute("searchOption", searchOption);
		
		// 검색 요청이면 type과 keyword를 모델에 저장한다.
		if(searchOption) {			
			
			/* Redirect 되는 경우 주소 끝에 파라미터를 지정해 GET방식의 파라미터로
			 * 전송할 수 있지만 스프링프레임워크가 지원하는 RedirectAttributs객체를
			 * 이용하면 한 번만 사용할 임시 데이터와 지속적으로 사용할 파라미터를 구분해
			 * 지정할 수 있다.
			 * 
			 * 게시 글 상세 보기 요청을 처리하는 boardDetail() 메서드에서 뷰 페이지에서
			 * 링크에 사용할 keyword를 java.net 패키지의 URLEncoder 클래스를
			 * 이용해 수동으로 인코딩한 후 모델에 담아 뷰 페이지로 전달하였다.
			 * 
			 * 리다이렉트 될 때 필요한 파라미터를 스프링이 제공하는 RedirectAttributs의
			 * addAttribute() 메서드를 사용해 파라미터를 지정하면 자동으로 주소 뒤에 
			 * 요청 파라미터로 추가되며 파라미터에 한글이 포함되는 경우 URLEncoding을
			 * java.net 패키지의 URLEncoder 클래스를 이용해 인코딩 해줘야 하지만
			 * web.xml에서 스프링프레임워크가 지원하는 CharacterEncodingFilter를
			 * 설정했기 때문에 Filter에 의해 UTF-8로 인코딩 되어 클라이언트로 응답된다.
			 * 
			 * 아래는 검색 리스트로 Redirect 되면서 같이 보내야할 keyword와 type을
			 * RedirectAttributs를 이용해 파라미터로 전달하는 예이다. 
			 **/			
			reAttrs.addAttribute("type", type);
			reAttrs.addAttribute("keyword", keyword);		
		}
		
		reAttrs.addAttribute("pageNum", pageNum);		
		//reAttrs.addFlashAttribute("test", "1회용 파라미터 받음 - test");
		return "redirect:boardList";
	}
	
	/* 게시 글 상세보기에서 들어오는 게시 글 삭제 요청을 처리하는 메서드
	 * 
	 * 아래는 "/delete", "/deleteBoard"로 들어오는 GET 방식 요청을 처리하는
	 * 메서드를 지정한 것으로 method 속성을 생략됐기 때문에 GET 방식 요청을 처리한다. 
	 * 
	 * @RequestMapping 애노테이션이 적용된 Controller 메서드의 파라미터에
	 * HttpServletResponse와 PrintWriter를 지정했고 요청 파라미터를 받을
	 * no와 pass도 지정했다. 그리고 리다이렉트 할 때 pageNum을 파라미터로 보내기
	 * 위해서 RedirectAttributes 객체를 메서드의 파라미터로 지정했다. 
	 * 이렇게 Controller 메서드의 파라미터에 필요한 객체나 요청 파라미터 이름과 동일한
	 * 이름의 파라미터를 지정하면 스프링이 자동으로 설정해 준다. 만약 요청 파라미터와
	 * 메서드의 파라미터 이름이 다른 경우 Controller 메서드의 파라미터 앞에 
	 * @RequestParam("요청 파라미터 이름")을 사용해 요청 파라미터의 이름을
	 * 지정하면 스프링이 데이터 형에 맞게 적절히 형 변환까지 해 준다. 형 변환을 할 수
	 * 없는 경우 스프링은 400 에러를 발생 시킨다. 예를 들면 Controller 메서드의
	 * 파라미터가 정수형 일 때 요청 파라미터의 값이 정수형으로 형 변환 할 수 없는 
	 * 경우 400 에러를 발생 시킨다.
	 * 
	 * @RequestMapping 애노테이션이 적용된 메서드의 파라미터와 반환 타입에
	 * 대한 설명과 @RequestParam에 대한 설명은 boardList() 메서드의 주석을 
	 * 참고하기 바란다.
	 **/
	@RequestMapping({"/delete", "deleteBoard"})
	public String deleteBoard(HttpServletResponse response, 
			PrintWriter out, int no, String pass,
			RedirectAttributes reAttrs, 
			@RequestParam(value="pageNum", required=false, 
				defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false,  
				defaultValue="null") String type,
			@RequestParam(value="keyword", required=false,
				defaultValue="null") String keyword) throws Exception {
		
		// BoardService 클래스를 이용해 게시판 테이블에서 비밀번호가 맞는지 체크한다. 
		
		// 비밀번호가 맞지 않으면
		
		/* 요청 파라미터에서 type이나 keyword가 비어 있으면 일반 
		 * 게시 글 리스트를 요청하는 것으로 간주하여 false 값을 갖게 한다.
		 * Controller에서 type이나 keyword의 요청 파라미터가 없으면
		 * 기본 값을 "null"로 지정했기 때문에 아래와 같이 체크했다.
		 **/
		boolean searchOption = (type.equals("null") 
				|| keyword.equals("null")) ? false : true; 
		
		// BoardService 클래스를 이용해 게시판 테이블에서 게시 글을 수정한다.
		studyService.deleteStudy(no);
		
		/* 클라이언트 요청을 처리한 후 리다이렉트 해야 할 경우 아래와 같이 redirect:
		 * 접두어를 붙여 뷰 이름을 반환하면 된다. 뷰 이름에 redirect 접두어가 붙으면
		 * HttpServletResponse를 사용해서 지정한 경로로 Redirect 된다. 
		 * redirect 접두어 뒤에 경로를 지정할 때 "/"로 시작하면 ContextRoot를
		 * 기준으로 절대 경로 방식으로 Redirect 된다. "/"로 시작하지 않으면 현재 
		 * 경로를 기준으로 상대 경로로 Redirect 된다. 또한 다른 사이트로 Redirect
		 * 되기를 원한다면 redirect:http://사이트 주소를 지정한다.
		 * 
		 * Redirect 되는 경우 주소 끝에 파라미터를 지정해 GET방식의 파라미터로
		 * 전송할 수 있지만 스프링프레임워크가 지원하는 RedirectAttributs객체를
		 * 이용하면 한 번만 사용할 임시 데이터와 지속적으로 사용할 파라미터를 구분해
		 * 지정할 수 있다.
		 * 
		 * 아래와 같이 RedirectAttributs의 addAttribute() 메서드를 사용해
		 * 지속적으로 사용할 파라미터를 지정하면 자동으로 주소 뒤에 파라미터로
		 * 추가되며 addFlashAttribute() 메서드를 사용해 파라미터로 지정하면
		 * 한 번만 사용할 수 있도록 주소 뒤에 파라미터로 추가되지 않는다. 
		 * addAttribute() 메서드를 사용해 파라미터로 지정한 데이터는 페이지를
		 * 새로 고침해도 계속해서 주소 뒤에 파라미터로 남아있지만 addFlashAttribute()
		 * 메서드를 사용해 지정한 파라미터는 사라지기 때문에 1회성으로 필요한
		 * 데이터를 addFlashAttribute() 메서드를 사용해 지정하면 편리하다.
		 * 
		 * 파라미터에 한글이 포함되는 경우 URLEncoding을 코드로 구현해야 하지만
		 * web.xml에서 스프링프레임워크가 지원하는 CharacterEncodingFilter를
		 * 설정했기 때문에 Filter에 의해 UTF-8로 인코딩 되어 클라이언트로 응답된다.
		 * 
		 * 아래는 게시 글 리스트로 Redirect 되면서 같이 보내야할 searchOption을
		 * RedirectAttributs를 이용해 파라미터로 전달하는 예이다. 
		 **/
		reAttrs.addAttribute("searchOption", searchOption);
		
		// 검색 요청이면 type과 keyword를 모델에 저장한다.
		if(searchOption) {
			
			/* Redirect 되는 경우 주소 끝에 파라미터를 지정해 GET방식의 파라미터로
			 * 전송할 수 있지만 스프링프레임워크가 지원하는 RedirectAttributs객체를
			 * 이용하면 한 번만 사용할 임시 데이터와 지속적으로 사용할 파라미터를 구분해
			 * 지정할 수 있다.
			 * 
			 * 게시 글 상세 보기 요청을 처리하는 boardDetail() 메서드에서 뷰 페이지에서
			 * 링크에 사용할 keyword를 java.net 패키지의 URLEncoder 클래스를
			 * 이용해 수동으로 인코딩한 후 모델에 담아 뷰 페이지로 전달하였다.
			 * 
			 * 리다이렉트 될 때 필요한 파라미터를 스프링이 제공하는 RedirectAttributs의
			 * addAttribute() 메서드를 사용해 파라미터를 지정하면 자동으로 주소 뒤에 
			 * 요청 파라미터로 추가되며 파라미터에 한글이 포함되는 경우 URLEncoding을
			 * java.net 패키지의 URLEncoder 클래스를 이용해 인코딩 해줘야 하지만
			 * web.xml에서 스프링프레임워크가 지원하는 CharacterEncodingFilter를
			 * 설정했기 때문에 Filter에 의해 UTF-8로 인코딩 되어 클라이언트로 응답된다.
			 * 
			 * 아래는 검색 리스트로 Redirect 되면서 같이 보내야할 keyword와 type을
			 * RedirectAttributs를 이용해 파라미터로 전달하는 예이다. 
			 **/			
			reAttrs.addAttribute("type", type);
			reAttrs.addAttribute("keyword", keyword);			
		}
		
		reAttrs.addAttribute("pageNum", pageNum);
		//reAttrs.addFlashAttribute("test", "1회용 파라미터 받음 - test");
		return "redirect:boardList";
	}
	
	
	// 게시 글 상세보기에서 들어오는 파일 다운로드 요청을 처리하는 메서드	
	@RequestMapping("/fileDownload")
	public void download(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {

		String fileName = request.getParameter("fileName");
		System.out.println("fileName : " + fileName);		
		
		String filePath = 
				request.getServletContext().getRealPath(DEFAULT_PATH);
		
		File file = new File(filePath, fileName);
		System.out.println("file.getName() : " + file.getName());
		
		// 응답 데이터에 파일 다운로드 관련 컨텐츠 타입 설정이 필요하다.
		response.setContentType("application/download; charset=UTF-8");
		response.setContentLength((int) file.length());
		
		// 한글 파일명을 클라이언트로 바로 내려 보내기 때문에 URLEncoding이 필요하다. 		
		fileName = URLEncoder.encode(file.getName(), "UTF-8");
		System.out.println("다운로드 fileName : " + fileName);
		
		// 전송되는 파일 이름을 한글 그대(원본파일 이름 그대로)로 보내주기 위한 설정이다.
		response.setHeader("Content-Disposition", 
				"attachment; filename=\"" + fileName + "\";");
		
		// 파일로 전송되야 하므로 전송되는 데이터 인코딩은 바이너리로 설정해야 한다.
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		// 파일을 클라이언트로 보내기 위해 응답 스트림을 구한다.
		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;
		
		/* FileInputStream을 통해 클라이언트로 보낼 파일을 읽어
		 * 스프링이 제공하는 FileCopyUtils 클래스를 통해서
		 * 데이터를 읽고 응답 스트림을 통해 클라이언트로 출력한다.
		 **/
		fis = new FileInputStream(file);

		// 스프링이 제공하는 FileCopyUtils를 이용해 응답 스트림에 파일을 복사한다.
		FileCopyUtils.copy(fis,  out);
		
		if(fis != null) {
			fis.close();
		}
		
		/* 파일 데이터를 클라이언트로 출력한다.
		 * 버퍼에 남아 있는 모든 데이터를 클라이언드로 출력한다.
		 **/
		out.flush();	
	}	
}

	

