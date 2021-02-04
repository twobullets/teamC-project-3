package ptm.team.dao;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


//VO 전부 import 했으니 쓸것만 쓰시고 안쓰면 지워주세요
import ptm.team.vo.PtVO;
import ptm.team.vo.RoundVO;
import ptm.team.vo.ExerciseVO;
import ptm.team.vo.ListVO;

@Repository
public class T_ManagementDAO 
{
	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "ptm.team.mapper.T_ManagementMapper";

	//PT등록된 회원 리스트
	public List<PtVO> selectList(ListVO vo) 
	{
		return sqlSession.selectList(Namespace+".selectList",vo);
	}
	
	//PT등록된 회원의 정보
	public PtVO selectPtm(RoundVO vo) 
	{
		return sqlSession.selectOne(Namespace+".selectPtm", vo);
	}
	
	//PT 등록된 회원의 운동 정보
	public Map<String,Object> selectPtm2(ExerciseVO vo) 
	{
		return sqlSession.selectOne(Namespace+".selectPtm2", vo);
	}
	
	//인바디 입력
	public int updateInbody(PtVO vo) 
	{
		return sqlSession.update(Namespace+".updateInbody", vo);
	}
	
	//트레이너 소견
	public int updateComment(PtVO vo) 
	{
		return sqlSession.update(Namespace+".updateComment", vo);
	} 
	
	//PT받고있는 회원의 회차
	public List<RoundVO> selectRoundcnt(RoundVO vo) 
	{
		return sqlSession.selectList(Namespace+".selectRoundcnt", vo);
	}
	
	//PT받고있는 회원의 회차 추가
	public int insertRound(RoundVO vo) 
	{
		return sqlSession.insert(Namespace+".insertRound", vo);
	}

	//PT받고있는 회원의 회차 추가 후 가장 마지막 회차 불러올때
	public RoundVO selectRound(int r_no) 
	{
		return sqlSession.selectOne(Namespace+".selectRound", r_no);
	}
	
	//PT 리스트에서 회원 삭제처리
	public int updateList(RoundVO vo) 
	{
		return sqlSession.update(Namespace+".updateList", vo);
	}
	
	//PT받고있는 회원의 운동 입력
	public int insertExercise(ExerciseVO vo) 
	{
		return sqlSession.insert(Namespace+".insertExercise", vo);
	}
	
	//PT받고있는 회원의 운동 기록 수정
	public int updateExercise(ExerciseVO vo) 
	{
		return sqlSession.update(Namespace+".updateExercise", vo);
	}
	
	//운동 상세 기록 리스트로 불러오기
	public List<ExerciseVO> selectExercisecnt(ExerciseVO vo) 
	{
		return sqlSession.selectList(Namespace+".selectExercisecnt", vo);
	}
	
	//운동 상세 기록 후 마지막 운동 기록 가져오기
	public ExerciseVO selectExercise(int e_no) 
	{
		return sqlSession.selectOne(Namespace+".selectExercise", e_no);
	}
}
