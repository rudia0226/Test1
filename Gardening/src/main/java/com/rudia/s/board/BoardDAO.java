package com.rudia.s.board;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class BoardDAO {
	
	
	@Autowired
	private  SqlSession  ss;
	
	private List<Board>  boards;  // 멤버변수로.. 밖으로 나와야 다른 메소드에서도 쓸 수 있음..
	
	// 페이지 처리하는 메소드 생성  (int page : 추출할 페이지 번호)
	public  void  paging(int page, HttpServletRequest req, HttpServletResponse  res) {
/*		
		// 10/04 : 찾고자 하는게 없을 때 아예 없앰
		if (boards == null || boards.size() == 0) {
			// 데이타가 없을 때에는 빈칸 몇개 보여줌
			boards = new ArrayList<Board>();
			boards.add(new Board());
			boards.add(new Board());
			boards.add(new Board());
			
		//	return; //아예 없음
		}
		*/
		
		
		//10/04 
		// 검색한 클라이언트 or 전체조회중인 클라이언트  인지 따져보기
		List<Board>  b = (List<Board>) req.getSession().getAttribute("search");
		
		List<Board>  data  = null;  
		
		// null or 검색결과 
		if (b == null  || b.size() == 0) {  // 전체조회중 or 검색결과가 없는 사람
			data = boards;    // 전체조회중이면 boards 가 나오고
			if (boards == null || boards.size() == 0) {
				return;
			}
		}else { // 검색 된거
			data = b; // 검색 성공한 사람은 b를 가지고..
		}
		
		
		int count = 3; // 한 페이지당 보여줄 게시물의 숫자
		
		
		//10/04 : boards -> data 로 변경 (3군데)
		// 전체 데이터 수 : boards.size()
		// 전체 페이지 수 계산 : 무조건 올림 후 int 처리
		int pageCount =  (int)(Math.ceil(data.size() /(double) count));
		
		// 총 페이지의 수
		req.setAttribute("pageCount", pageCount);
		
		// 현재 페이지 번호에 맞는 게시물들 추출
		int start = 	data.size() - ((page -1)* count); // 시작번호 계산 식
		
		int end = (page == pageCount) ?   // 끝번호 계산식
							1: start -(count-1);
		
		// 새로 리스트를 만든다. 전체 boards 에서 
		ArrayList<Board>  board2 = new ArrayList<Board>();
		
		for ( int i = start-1 ; i >= end-1 ; i--){
			board2.add(data.get(i));  // 10/04 : data 에서 꺼내는걸로 변경..
		}
		req.setAttribute("boards", board2);
	}
	
	
	
	// 10/04 : search 내용은 session에 담는다.
	// 검색 결과 : 검색을 수행한 그 클라이언트의 개인 공간(session)에 담겨야
	public  void searchBoard(Board b, HttpServletRequest req, HttpServletResponse  res) {
		List<Board> bb  = ss.getMapper(BoardMapper.class).searchBoard(b);
		req.getSession().setAttribute("search", bb); //검색결과를 담음
	}
	
	
	
	
	// 10/02 : db에서 select 해와서 그걸 setAttribute로 바꾸기
	// 전체 목록을 역순으로 가져오기 
	// 전체 목록 : 공용
	public  void getAllBoard(HttpServletRequest req, HttpServletResponse  res) {
		 boards = ss.getMapper(BoardMapper.class).getAllBoard();
		req.getSession().setAttribute("search", null); // 검색결과가 null 이면 전체목록 보여줌
		// req.setAttribute("boards", boards);
	}
	
	public  void  reg(HttpServletRequest req, HttpServletResponse  res) {
		try {
			// 사용방법
			// 파일이 업로드 될 폴더 경로를 써줘 (경로는 개발자pc 기준이 아닌 WAS(실제서버) 의 경로를 써줌)
			String path = req.getSession().getServletContext().getRealPath("resources/img");
			System.out.println(path); //경로 확인차 콘솔출력해보자
			
			// cos.jar 에선 객체 만들때 이거 사용
			MultipartRequest   mr = new MultipartRequest(
																req,  //원래 쓰던 요청객체,
																path, // 파일이 업로드 될 폴더 경로(실제 서버)
																50 * 1024 * 1024, //업로드 허용 최대 파일 사이즈(단위 : Byte)
																"utf-8", //요청 인코딩 방식  원래post 방식은req.setCharacterEncoding("utf-8") 해주는데 그걸 여기에 해줌
																new DefaultFileRenamePolicy()  //파일명 중복처리
																);
			
			//<input> 파라메터 값을 읽고싶을때 mr.getParameter("name값")
			System.out.println(mr.getParameter("n"));
			System.out.println(mr.getParameter("p"));
			
			
			// 10/02   10/04
			String n = mr.getParameter("n");
			//<textarea> 엔터친 것 : \n 
			// html 에서 줄바꿈 : <br>
			// <textarea> 에서 줄바꿈 : \n
			String p = mr.getParameter("p");
			
			// 입력받은 내용을  html에서 쓸거면
			p = p.replaceAll("\n", "<br>");   // 엔터값을 html에서의 <br>로 바꿔줌
			System.out.println(p);   // 확인
			
			//  입력받은 내용을 <textarea> 에서 쓸거면
			// replace 를 하지 않았어야.
			
			
			// 받아오는 값이 숫자인경우
			// BigDecimal p = new BigDecimal(mr.getParameter("p"));
			
			// 파일명 값 받을때         : DB에 저장할 때에는 이렇게 저장해야 값을 찾아갈 수 있음
			String  fName = mr.getFilesystemName("photo");
			
			
			// 10/01 강의
			// 톰캣이 한글 파일명을 인식 못함
			// 파일명을 URLEncoding 으로
			// 새.png -> %2A%2D.png
			fName  = URLEncoder.encode(fName, "utf-8");
			
			// 띄어쓰기는 남아있어야 하므로 다시 처리해줌
			//  ㅋ ㅋ.png  -> %2A+%2A.png (X) - > %2A %2A.png
			
			fName = fName.replace("+", " ");
			
			// 10/02 : db에 넣어줌(insert - 메소드 실행해서..)
			Board  b = new Board(n, p, fName);
			ss.getMapper(BoardMapper.class).regBoard(b);
			
			System.out.println(fName);
			
			req.setAttribute("fff", fName);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
/*	// 10/04 : 검색용  메소드 생성
	public  void  searchBoard(Board b, HttpServletRequest  req, HttpServletResponse res) {
		boards = ss.getMapper(BoardMapper.class).searchBoard(b);  // 검색한것을 boards에 담음.
		
		
	}*/
	
	
}
