package ptm.team.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


//VO 전부 import 했으니 쓸것만 쓰시고 안쓰면 지워주세요
import ptm.team.vo.PtVO;
import ptm.team.vo.RoundVO;
import ptm.team.vo.ExerciseVO;
import ptm.team.vo.ListVO;
//DAO
import ptm.team.dao.T_ManagementDAO;

@Service
public class  T_ManagementServiceImpl implements  T_ManagementService{
	@Inject
	T_ManagementDAO T_ManagementDAO;
	
	//PT등록된 회원 리스트
	@Override
	public List<PtVO> selectList(ListVO vo) throws Exception 
	{
		return T_ManagementDAO.selectList(vo);
	}
	
	//PT등록된 회원 삭제 처리
	@Override
	public int updateList(RoundVO vo) throws Exception
	{
		return T_ManagementDAO.updateList(vo);
	}
	
	//PT등록된 회원의 정보
	@Override
	public PtVO selectPtm(RoundVO vo) throws Exception
	{
		return T_ManagementDAO.selectPtm(vo);
	}
	
	//PT 등록된 회원의 운동 정보
	@Override
	public Map<String,Object> selectPtm2(ExerciseVO vo) throws Exception
	{
		return T_ManagementDAO.selectPtm2(vo);
	}
	
	//PT등록된 회원의 인바디 입력
	@Override
	public int updateInbody(PtVO vo) throws Exception
	{
		return T_ManagementDAO.updateInbody(vo);
	}

	//PT등록된 회원의 트레이너 소견 입력
	@Override
	public int updateComment(PtVO vo) throws Exception
	{
		return T_ManagementDAO.updateComment(vo);
	}
	
	//PT받고있는 회원의 회차 추가
	@Override
	public int insertRound(RoundVO vo) throws Exception
	{
		return T_ManagementDAO.insertRound(vo);
	}
	
	//PT받고있는 회원의 회차 수
	@Override
	public List<RoundVO> selectRoundcnt(RoundVO vo) throws Exception
	{	
		return T_ManagementDAO.selectRoundcnt(vo);
	}
	
	//PT받고있는 회원의 회차 추가 후 가장 마지막 회차 불러올때
	@Override
	public RoundVO selectRound(int r_no) throws Exception
	{
		return T_ManagementDAO.selectRound(r_no);
	}
	
	//PT등록된 회원의 운동 입력
	@Override
	public int insertExercise(ExerciseVO vo) throws Exception
	{
		return T_ManagementDAO.insertExercise(vo);
	}
	
	//PT받고있는 회원의 운동 기록 수정
	@Override
	public int updateExercise(ExerciseVO vo) throws Exception
	{
		return T_ManagementDAO.updateExercise(vo);
	}
	
	//운동 상세 기록 리스트로 불러오기
	@Override
	public List<ExerciseVO> selectExercisecnt(ExerciseVO vo) throws Exception
	{
		return T_ManagementDAO.selectExercisecnt(vo);
	}
	
	//운동 상세 기록 후 마지막 운동 기록 가져오기
	@Override
	public ExerciseVO selectExercise(int e_no) throws Exception
	{
		return T_ManagementDAO.selectExercise(e_no);
	}
	
}
