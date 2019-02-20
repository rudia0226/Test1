package com.sm.household.todo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sm.household.Member.Member;

@Service
public class TodoDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public void todoList(HttpServletRequest request,HttpServletResponse response , int nowPage) {
		try {
				
			Member member = (Member) request.getSession().getAttribute("loginMember");
			String User_Email = member.getUser_Email();
			
			int todoCount = sqlSession.getMapper(TodoMapper.class).getTodoCount(User_Email);
			int perPage = 5;
			
			int startPage = 1;
			int endPage = (todoCount-1)/perPage + 1;
			
			int startNum = (nowPage-1)*5+1;
			int endNum = startNum+4;
			if(endNum > todoCount)
				endNum = todoCount;
		
			List<TodoBean> todoList = 
					sqlSession.getMapper(TodoMapper.class).todoList(User_Email, startNum, endNum);
			
			request.setAttribute("todoList", todoList);
	
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("nowPage", nowPage);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void todoWrite(HttpServletRequest request, TodoBean todo) {
		try {
			Member member = (Member) request.getSession().getAttribute("loginMember");
			String User_Email = member.getUser_Email();
			
			todo.setUser_Email(User_Email);
			
			sqlSession.getMapper(TodoMapper.class).todoWrite(todo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void todoDelete(int Todo_Id) {
		try {
			sqlSession.getMapper(TodoMapper.class).todoDelete(Todo_Id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}

