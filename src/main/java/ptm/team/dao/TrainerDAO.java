package ptm.team.dao;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ptm.team.vo.SessionVO;
import ptm.team.vo.TrainerVO;

@Repository
public class TrainerDAO 
{
	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "ptm.team.mapper.TrainerMapper";
	
	//회원가입
	public int insertTrainer(TrainerVO vo) 
	{	
		return sqlSession.insert(Namespace+".insertTrainer", vo);
	}
	
	//아이디중복확인
	public int selectIdcheck(String t_id) 
	{	
		return sqlSession.selectOne(Namespace+".selectIdCheck", t_id);
	}
	
	//이메일중복확인
	public int selectEmailCheck(String t_email) 
	{	
		return sqlSession.selectOne(Namespace+".selectEmailCheck", t_email);
	}
	
	//전화번호중복확인
	public int selectPhoneCheck(String t_phone) 
	{	
		return sqlSession.selectOne(Namespace+".selectPhoneCheck", t_phone);
	}
	
	//로그인 체크
	public boolean selectLogin(TrainerVO vo) 
	{	
		String t_no =  sqlSession.selectOne(Namespace+".selectLogin", vo);
		return(t_no == null) ? false : true;
	}
	
	//로그인된 회원 정보
	public SessionVO selectInfo(TrainerVO vo)
	{
		return sqlSession.selectOne(Namespace+".selectInfo", vo);
	}
	
	//로그아웃
	public void logout(HttpSession session){
	}
	
	//아이디찾기
	public String selectFindId(String t_email) throws Exception
	{
		return sqlSession.selectOne(Namespace+".selectFindId",t_email);
	}

	public int selectFindPw(TrainerVO vo) {
	
		
		return sqlSession.selectOne(Namespace+".selectFindPw",vo);

	}

	public int updatePw(TrainerVO vo) {
		
		return sqlSession.update(Namespace+".updatePw",vo);
	}

	public TrainerVO selectTainerInfo(int t_no) {
		
		return sqlSession.selectOne(Namespace+".selectTainerInfo",t_no);
	}

	public int updateInfo(TrainerVO vo) {

		return sqlSession.update(Namespace+".updateInfo",vo);
	}
	public int updateInfo2(TrainerVO vo) {

		return sqlSession.update(Namespace+".updateInfo2",vo);
	}
	public int updateAccount(TrainerVO vo) {

		return sqlSession.update(Namespace+".updateAccount",vo);
	}

	public int updatePW(TrainerVO vo) {
		return sqlSession.update(Namespace+".updatePW",vo);
	}
	public void updateOut(int t_no) {
		sqlSession.update(Namespace+".updateOut",t_no);
	}
}
