package ptm.team.service;

import java.util.List;
import java.util.Map;

import ptm.team.vo.ExerciseVO;
import ptm.team.vo.M_ListVO;
import ptm.team.vo.M_PtVO;
import ptm.team.vo.RoundVO;
import ptm.team.vo.TrainerVO;



public interface M_ManagementService 
{
	public List<M_PtVO> selectList(M_ListVO vo)    throws Exception; //PT등록된 트레이너 리스트
	public TrainerVO 	selectDetail(String t_no)  throws Exception; //PT등록된 트레이너 상세보기
	public M_PtVO      	selectPtm(M_PtVO vo)	   throws Exception; //PT등록된 회원의 정보
	public Map<String, Object> selectPtm2(ExerciseVO vo) throws Exception; //PT등록된 회원의 운동 정보
	public List<RoundVO> selectMround(RoundVO vo) throws Exception; //PT 등록된 운동 회차
	public List<ExerciseVO> selectMexercise(ExerciseVO vo);
}
