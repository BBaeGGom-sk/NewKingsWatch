package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private final String NS="mapper.user";	//UserMapeer.xml의 namespace
	

	@Override
	public void join(UserDTO dto) {
		sqlSession.insert(NS+".join", dto);
	}

	@Override
	public List<UserDTO> select() {
		return sqlSession.selectList(NS+".list");
	}

	@Override
	public UserDTO selectById(int id) {
		return sqlSession.selectOne(NS+".selectById", id);	}

	@Override
	public UserDTO updateui(int id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+".updateui", id);
	}

	@Override
	public void update(UserDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update(NS+".update", dto);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		sqlSession.insert(NS+".delete", id);
	}

	

	@Override
	public String loginCheck(UserDTO dto) {
		// TODO Auto-generated method stub
		System.out.println("logincheck메서드");
		return sqlSession.selectOne(NS+".loginCheck", dto);
	}

	
	

}
