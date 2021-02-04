package ptm.team.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ptm.team.vo.ExerciseVO;
import ptm.team.vo.M_ListVO;
import ptm.team.vo.M_PtVO;
import ptm.team.vo.RoundVO;
import ptm.team.vo.TrainerVO;
//DAO
import ptm.team.dao.M_ManagementDAO;
@Service
public class M_ManagementServiceImpl implements M_ManagementService{
	@Inject
	M_ManagementDAO m_managementDAO;

	//PT등록된 트레이너 리스트
	@Override
	public List<M_PtVO> selectList(M_ListVO vo) throws Exception {
		return m_managementDAO.selectList(vo);
	
	}
	
	//PT등록된 트레이너 상세정보
	@Override
	public TrainerVO selectDetail(String t_no) throws Exception
	{
		return m_managementDAO.selectDetail(t_no);
	}
	
	//PT등록된 회원의 정보
	@Override
	public M_PtVO selectPtm(M_PtVO vo) throws Exception
	{
		return m_managementDAO.selectPtm(vo);
	}
	
	//PT등록된 회원의 운동 정보
	@Override
	public Map<String, Object> selectPtm2(ExerciseVO vo) throws Exception 
	{
		return m_managementDAO.selectPtm2(vo);
	}

	//PT 등록된 운동 회차
	@Override
	public List<RoundVO> selectMround(RoundVO vo) throws Exception 
	{
		return m_managementDAO.selectMround(vo);
	}

	//PT 등록된 운동
	@Override
	public List<ExerciseVO> selectMexercise(ExerciseVO vo) 
	{
		return m_managementDAO.selectMexercise(vo);
	}
	
	
}
