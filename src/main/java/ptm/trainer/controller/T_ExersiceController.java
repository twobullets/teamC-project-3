package ptm.trainer.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ptm.team.service.T_ManagementService;
import ptm.team.vo.ExerciseVO;
import ptm.team.vo.RoundVO;

@Controller
@RequestMapping(value="/Trainer") 
public class T_ExersiceController 
{	
	@Inject
	T_ManagementService t_managementService;
	
	//운동 상세 기록창 
	@RequestMapping(value = "/T-Exercise")
	public String selectmemberinfo(Model model, ExerciseVO exerciseVO, HttpServletRequest request) throws Exception
	{	
		HttpSession session = request.getSession();
		
		int T_no = (Integer)session.getAttribute("t_no");
		
		exerciseVO.setT_no(T_no);
		
		RoundVO roundvo = t_managementService.selectRound(exerciseVO.getR_no());
		
		List<ExerciseVO> list = t_managementService.selectExercisecnt(exerciseVO);
		
		model.addAttribute("roundvo", roundvo);
		model.addAttribute("list", list);
		
		return "Trainer/T-Exercise";
	}
	
	//운동 상세 기록하는 부분
	//운동 상세 기록 후 마지막 운동 기록 가져올때
	@RequestMapping(value = "/T-ExerciseAdd", method = RequestMethod.POST)
	@ResponseBody
	public ExerciseVO insertExercise(Model model, ExerciseVO vo, HttpServletRequest request) throws Exception 
	{
		HttpSession session = request.getSession();
		
		int T_no = (Integer)session.getAttribute("t_no");
		
		vo.setT_no(T_no);
		
		if(vo.getE_no() == 0) 
		{
			//e_no가 없을 경우 insert
			t_managementService.insertExercise(vo);
		}else 
		{
			//e_no가 있을 경우 update
			t_managementService.updateExercise(vo);
		}
		
		ExerciseVO exvo = t_managementService.selectExercise(vo.getE_no());
		
		return exvo; 
	}
}