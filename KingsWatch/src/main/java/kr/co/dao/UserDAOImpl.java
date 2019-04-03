package kr.co.dao;

import java.util.List;

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
		System.out.println("sql insert하기 전");
		sqlSession.insert(NS+".join", dto);
		System.out.println("sql insert한 후");
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
		System.out.println("=====DAOImple update메서드===== 세션 :  "+ session.getAttribute("login"));	//안바뀜
		System.out.println("=====DAOImple update메서드===== dto :  "+ dto);		//바뀜
		sqlSession.update(NS+".update", session.getAttribute("login"));
		return dto;	//바뀐 dto를 리턴.   이거하기전에 dto를 session에 넣고 session을 리턴하면 될듯.
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		System.out.println("DAOImple delete메서드");
		sqlSession.insert(NS+".delete", id);
	}

	

	@Override
	public UserDTO get(UserDTO dto) {
		// TODO Auto-generated method stub
		System.out.println("DAO임플의 dto입니다."+dto);
		return sqlSession.selectOne(NS+".loginCheck", dto);
	}

		

}
