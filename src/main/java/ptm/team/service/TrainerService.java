package ptm.team.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ptm.team.vo.MemberVO;
import ptm.team.vo.SessionVO;
import ptm.team.vo.TrainerVO;

public interface TrainerService 
{
	public int insertTrainer(TrainerVO vo) throws Exception; 							//트레이너 회원가입
	public int selectIdCheck(String t_id) throws Exception;								//트레이너 아이디 중복확인
	public int selectEmailCheck(String t_email) throws Exception; 						//트레이너 이메일 중복확인
	public int selectPhoneCheck(String t_phone) throws Exception; 						//트레이너 전화번호 중복확인
	public boolean selectLogin(TrainerVO vo, HttpSession session) throws Exception; 	//로그인 체크
	public SessionVO selectInfo(TrainerVO vo) throws Exception;							//세션에 가져올 로그인 정보 불러오기
	public void logout(HttpSession session); 											//로그아웃
	public String selectFindId(HttpServletResponse response, String t_email) throws Exception;	//아이디 찾기
	public int selectFindPw(TrainerVO vo) throws Exception; 
	public int updatePw(TrainerVO vo)  throws Exception;
	public TrainerVO selectTainerInfo(int t_no) throws Exception; 
	public void updateInfo(TrainerVO vo) throws Exception;
	public void updateInfo2(TrainerVO vo) throws Exception;
	public void updateAccount(TrainerVO vo) throws Exception;
	public void updatePW(TrainerVO vo) throws Exception;
	public void updateOut(int t_no) throws Exception;
}

