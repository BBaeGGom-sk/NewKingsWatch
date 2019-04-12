package kr.co.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private final String NS="mapper.user";	//UserMapper.xml의 namespace
	

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
	public UserDTO update(UserDTO dto, HttpSession session) {
		// TODO Auto-generated method stub
		sqlSession.update(NS+".update", dto);
		return dto;	//바뀐 dto를 리턴. 
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		System.out.println("DAOImple delete메서드");
		sqlSession.delete(NS+".delete", id);
	}

	

	@Override
	public UserDTO getUser(UserDTO dto) {
		// TODO Auto-generated method stub
		System.out.println("DAO임플의 dto입니다."+dto);
		return sqlSession.selectOne(NS+".loginCheck", dto);
	}

	@Override
	public UserDTO updatePw(Map map, HttpSession session) {
		// TODO Auto-generated method stub
		sqlSession.update(NS+".updatePw", map);
		return null;
	}

	@Override
	public int idCheck(String userid) {
		System.out.println("여긴 dao imp. userid값은 : "+userid);
		return sqlSession.update(NS+".idcheck", userid);
	}



		

}
