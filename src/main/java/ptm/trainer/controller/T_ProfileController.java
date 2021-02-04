         package ptm.trainer.controller;


import java.io.File;
import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ptm.team.service.TrainerService;
import ptm.team.vo.TrainerVO;

@Controller
@RequestMapping(value="/Trainer") 
public class T_ProfileController 
{	
	private static final String UPLOAD_PATH = "D:\\jsh\\PTM\\src\\main\\webapp\\resources\\TrainerImages";
	@Inject
	private TrainerService trainerService; 
	
	@RequestMapping(value = "/T-Profile")
	public String info( Model model, HttpServletRequest request) throws Exception
	{	
		HttpSession session = request.getSession();
		
		int t_no = (Integer)session.getAttribute("t_no");
			
		TrainerVO vo =  trainerService.selectTainerInfo(t_no);	
		//vo.setT_realP(UPLOAD_PATH+"\\"+vo.getT_realP());
		model.addAttribute("vo", vo);
		//model.addAttribute("list", list);				
		return "Trainer/T-Profile";
	}
	// 수정버튼 클릭시 보여줘야함
	@RequestMapping(value = "/TrainerModify")
	public String TrainerModify( Model model, HttpServletRequest request) throws Exception
	{	
		HttpSession session = request.getSession();
		
		int t_no = (Integer)session.getAttribute("t_no");
			
		TrainerVO vo =  trainerService.selectTainerInfo(t_no);	
		model.addAttribute("vo", vo);
		//model.addAttribute("list", list);				
		return "Trainer/T-ProfileOK";
	}
	@RequestMapping(value = "/TrainerModifyOK", method=RequestMethod.POST)
	public String TrainerModifyOK(Model model, TrainerVO vo, MultipartHttpServletRequest request) throws Exception
	{	
		HttpSession session = request.getSession();	
		int t_no = (Integer)session.getAttribute("t_no");
		vo.setT_no(t_no);		
		
		MultipartFile mf = request.getFile("fileUp");	
		vo.setT_originP(mf.getOriginalFilename()); // 실제 파일 이름 담았음  보여줄때도 실제 저장된값을 보여줘야
		long fileSize = mf.getSize();
		if(fileSize != 0)
		{ 
			String realP = System.currentTimeMillis() + vo.getT_originP();
		     
			String safeFile = UPLOAD_PATH +"\\" + realP;
				   safeFile = safeFile.replaceAll("\\","");
			//기존의 DB 필드의 file 명을 새로 업로드한 file의 이름으로 변경
			vo.setT_realP(realP);
	        try
	        {
	            mf.transferTo(new File(safeFile));
	            trainerService.updateInfo(vo);
	            
	        }catch (IllegalStateException e)
	        {
	            e.printStackTrace();
	        }catch (IOException e)
	        {
	            e.printStackTrace();
	        }
		       
		 }else 
		 {
			 try
		 	{
			 System.out.println("여기로 들어왔습니다");
	            trainerService.updateInfo2(vo);
	            
	        }catch (IllegalStateException e)
		 	{
	            e.printStackTrace();
	        }catch (IOException e)
		 	{
	            e.printStackTrace();
	        } 
		 }

		 return "redirect:/Trainer/T-Profile";
	}
}