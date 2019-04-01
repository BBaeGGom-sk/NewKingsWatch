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
	public UserDTO viewDetail(String id) {
		System.out.println("DAOImple viewDetail메서드");
		System.out.println("지금 id값은 : "+ id);
		return sqlSession.selectOne(NS+".viewDetail", id);	}

	@Override
	public UserDTO updateui(String id) {
		// TODO Auto-generated method stub
		System.out.println("DAOImple updateui메서드");
		return sqlSession.selectOne(NS+".updateui", id);
	}

	@Override
	public void update(UserDTO dto) {
		// TODO Auto-generated method stub
		System.out.println("DAOImple update메서드");
		sqlSession.update(NS+".update", dto);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		System.out.println("DAOImple delete메서드");
		sqlSession.insert(NS+".delete", id);
	}

	

	@Override
	public String loginCheck(UserDTO dto) {
		// TODO Auto-generated method stub
		System.out.println("logincheck메서드");
		return sqlSession.selectOne(NS+".loginCheck", dto);
	}

	
	

}
