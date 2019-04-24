package kr.co.dao;

import java.util.HashMap;
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
	public UserDTO getUser(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+".getUser", dto);
	}
	
	@Override
	public UserDTO viewDetail(String id) {
		return sqlSession.selectOne(NS+".viewDetail", id);
	}

	@Override
	public UserDTO updateui(String id) {
		// TODO Auto-generated method stub
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
		sqlSession.delete(NS+".delete", id);
	}

	

	@Override
	public String getUserPw(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+".getUserPw", id);
	}

	@Override
	public UserDTO updatePw(Map map, HttpSession session) {
		// TODO Auto-generated method stub
		sqlSession.update(NS+".updatePw", map);
		return null;
	}

	@Override
	public int idCheck(String u_id) {
		System.out.println("여긴 dao imp. userid값은 : "+u_id);
		return sqlSession.selectOne(NS+".idcheck", u_id);
	}

	@Override
	public int emailCheck(String u_email) {
		System.out.println("여긴 dao imp. email값은 : "+u_email);
		return sqlSession.selectOne(NS+".emailcheck", u_email);
	}





		

}
