package ptm.trainer.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptm.team.service.T_ManagementService;
import ptm.team.vo.ExerciseVO;
import ptm.team.vo.PtVO;
import ptm.team.vo.RoundVO;


@Controller
@RequestMapping(value="/Trainer") 
public class T_ChartController 
{	
	@Inject
	T_ManagementService t_managementService;
	
	// 차트 페이지
	@RequestMapping(value = "/T-Chart")
	public String chart(Model model, RoundVO vo, ExerciseVO exvo, HttpServletRequest request) throws Exception
	{	
		//session t_no
		HttpSession session = request.getSession();
		
		int T_no = (Integer)session.getAttribute("t_no");
		
		//session t_no 값을 RoundVO vo에 set해줌
		vo.setT_no(T_no);
		//exvo에 세션값을 안넣어줘서 차트 값 계속 못가져옴 그래서 넣어줌
		exvo.setT_no(T_no);
		//PT 등록된 회원정보 불러옴
		PtVO ptVO = t_managementService.selectPtm(vo);

		Map<String,Object> evo = t_managementService.selectPtm2(exvo);
		
		model.addAttribute("ptVO", ptVO);
		model.addAttribute("evo", evo);
		
		return "Trainer/T-Chart";
	}
	
	//인바디 입력
	@RequestMapping(value = "/T-Inbody", method = RequestMethod.POST) 
	public String chartInsert(PtVO vo, Model model) throws Exception 
	{
		//인바디 기존에 있는 pt테이블에서 p_kg/p_bone/p_fat을 update로 처리
		t_managementService.updateInbody(vo);
		model.addAttribute("m_qr", vo.getM_qr());
		model.addAttribute("p_no", vo.getP_no());
		
		return "redirect:/Trainer/T-Chart"; 
	}
	
	//트레이너 소견 입력
	@RequestMapping(value = "/T-Comment", method = RequestMethod.POST)
	public String commentInsert(PtVO vo, Model model) throws Exception
	{
		//인바디 기존에 있는 pt테이블에서 p_comment를 update로 처리
		t_managementService.updateComment(vo);
		model.addAttribute("m_qr", vo.getM_qr());
		model.addAttribute("p_no", vo.getP_no());
		return "redirect:/Trainer/T-Chart";
	}
	 
}