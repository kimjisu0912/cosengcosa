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
import javax.servlet.http.HttpSession;

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
	
	// 지식공유 리스트
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
	// 상세 페이지 
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
		
		Study study = studyService.getStudy(no, true);
		
		model.addAttribute("study", study);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("searchOption", searchOption);
		
		// 검색 요청이면 type과 keyword를 모델에 저장한다.
		if(searchOption) {
			model.addAttribute("type", type);
			model.addAttribute("keyword", keyword);
		}
		
		if(study.getsFile() != null) {
			model.addAttribute("fileName", 
				URLEncoder.encode(study.getsFile(), "utf-8"));
		}
		
		return "/study/studyDetail";
		
	}
	
	// 등록폼으로 전달
	@RequestMapping("/writeForm")
	public String writeForm() {
		return "/study/writeForm";
	}
	
	// 등록하기
	@RequestMapping(value="/writeProcess", method=RequestMethod.POST)
	public String insertStudy(
			HttpServletRequest request,
			String sTitle, String sAskid, String sAskcontent, String sOpen, String sClear, String sYn,String sError,
			@RequestParam(value="qimg", required=false) MultipartFile multipartFile,
			@RequestParam(value="sFile", required=false) MultipartFile multipartFile2
			) 
					throws IOException {		
		
		System.out.println("originName : " + multipartFile.getOriginalFilename());
		System.out.println("name : " + multipartFile.getName());	
		
		sOpen = "Y"; 
		sClear = "Y"; 
		sYn = "Y"; 
		
		Study study= new Study();
		study.setsTitle(sTitle);
		study.setsError(sError);
		study.setsAskid(sAskid);
		study.setsAskcontent(sAskcontent);
		study.setsOpen(sOpen);
		study.setsClear(sClear);
		study.setsYn(sYn);
		
		if(!multipartFile.isEmpty()) { // 업로드된 파일 데이터가 존재하면
			
			// Request 객체를 이용해 파일이 저장될 실제 경로를 구한다.
			String filePath = 
					request.getServletContext().getRealPath(DEFAULT_PATH);
			
			UUID uid = UUID.randomUUID();
			String saveName = 
					uid.toString() + "_" + multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("insertStudy - newName : " + file.getName());			
			
			// 업로드 되는 파일을 upload 폴더로 저장한다.
			multipartFile.transferTo(file);
			
			study.setsAskimg(saveName);
		}
		
		if(!multipartFile2.isEmpty()) { // 업로드된 파일 데이터가 존재하면
			
			// Request 객체를 이용해 파일이 저장될 실제 경로를 구한다.
			String filePath = 
					request.getServletContext().getRealPath(DEFAULT_PATH);
			
			UUID uid = UUID.randomUUID();
			String saveName = 
					uid.toString() + "_" + multipartFile2.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("insertStudy - newName : " + file.getName());			
			
			// 업로드 되는 파일을 upload 폴더로 저장한다.
			multipartFile2.transferTo(file);
			
			study.setsFile(saveName);
		}
		
		studyService.insertStudy(study);
				
		
		return "redirect:studyList";
	}
	
	
	// 수정하기
	@RequestMapping(value="/studyUpdate")
	public String updateStudy(Model model, HttpServletResponse response, 
			PrintWriter out, String pass,
			@RequestParam(value="sno", required=false, 
			defaultValue="1") int sno,
			@RequestParam(value="pageNum", required=false, 
					defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false,  
					defaultValue="null") String type,
			@RequestParam(value="keyword", required=false,
					defaultValue="null") String keyword) throws Exception {
		
		boolean searchOption = (type.equals("null") 
				|| keyword.equals("null")) ? false : true; 
		
		Study study = studyService.getStudy(sno, false);
		
		model.addAttribute("study", study);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("searchOption", searchOption);
		
		// 검색 요청이면 type과 keyword를 모델에 저장한다.
		if(searchOption) {
			model.addAttribute("type", type);
			model.addAttribute("keyword", keyword);
		}
		
		return "/study/updateForm";
	}
	
	// 수정2
	@RequestMapping(value="/studyUp", method=RequestMethod.POST)
	public String studyUp(HttpServletResponse response, 
			PrintWriter out, Study study,
			RedirectAttributes reAttrs, 
			@RequestParam(value="pageNum", required=false, 
					defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false,  
					defaultValue="null") String type,
			@RequestParam(value="keyword", required=false,
					defaultValue="null") String keyword,
			@RequestParam(value="qImg", required=false) MultipartFile multipartFile) throws IOException {		
		
		// BoardService 클래스를 이용해 게시판 테이블에서 비밀번호가 맞는지 체크한다. 
		
		// 비밀번호가 맞지 않으면
		
		System.out.println("djahdjhasdjkhjk");
		
		boolean searchOption = (type.equals("null") 
				|| keyword.equals("null")) ? false : true; 
		
		// BoardService 클래스를 이용해 게시판 테이블에서 게시 글을 수정한다.
		studyService.updateStudy(study);
		
		reAttrs.addAttribute("searchOption", searchOption);
		
		// 검색 요청이면 type과 keyword를 모델에 저장한다.
		if(searchOption) {			
				
			reAttrs.addAttribute("type", type);
			reAttrs.addAttribute("keyword", keyword);		
		}
		
		reAttrs.addAttribute("pageNum", pageNum);		
		//reAttrs.addFlashAttribute("test", "1회용 파라미터 받음 - test");
		return "redirect:studyList";
	}
	
	// 삭제
	@RequestMapping("/studyDelete")
	public String deleteStudy(HttpServletResponse response, 
			PrintWriter out,  String pass,
			RedirectAttributes reAttrs,
			@RequestParam(value="sno", required=false, 
			defaultValue="1") int sno,
			@RequestParam(value="pageNum", required=false, 
				defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false,  
				defaultValue="null") String type,
			@RequestParam(value="keyword", required=false,
				defaultValue="null") String keyword) throws Exception {
		
		// BoardService 클래스를 이용해 게시판 테이블에서 비밀번호가 맞는지 체크한다. 
		System.out.println(sno+ "asdasdsad");
		// 비밀번호가 맞지 않으면
		
		boolean searchOption = (type.equals("null") 
				|| keyword.equals("null")) ? false : true; 
		
		
		// BoardService 클래스를 이용해 게시판 테이블에서 게시 글을 수정한다.
		studyService.deleteStudy(sno);
		
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
		return "redirect:studyList";
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
		
		fis = new FileInputStream(file);

		// 스프링이 제공하는 FileCopyUtils를 이용해 응답 스트림에 파일을 복사한다.
		FileCopyUtils.copy(fis,  out);
		
		if(fis != null) {
			fis.close();
		}
		
		out.flush();	
	}	
}

	

