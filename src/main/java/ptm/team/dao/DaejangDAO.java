package ptm.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ptm.team.vo.MemberVO;
import ptm.team.vo.SearchVO;
import ptm.team.vo.TrainerVO;

@Repository
public class DaejangDAO 
{
	@Inject
	private SqlSession sqlSession;
	private static final String Namespace = "ptm.team.mapper.DaejangMapper";
	public List<TrainerVO> listTrainer(SearchVO searchVO)
	{
		return sqlSession.selectList(Namespace+".listTrainer",searchVO);
	}
	
	public int countTrainer(SearchVO vo)
	{
		return sqlSession.selectOne(Namespace+".countTrainer",vo);
	}
	
	public int updateTrainer(TrainerVO vo) {
		
		return sqlSession.update(Namespace+".updateTrainer",vo);
	}
	
	public List<MemberVO> listMember(SearchVO searchVO)
	{
		return sqlSession.selectList(Namespace+".listMember",searchVO);
	}
	
	public int updateMember(MemberVO vo) {
		
		return sqlSession.update(Namespace+".updateMember",vo);
	}
}
