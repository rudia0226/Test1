package com.sm.household.todo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TodoController {
	
	@Autowired
	private TodoDao dao;
	
	@RequestMapping(value="/todoList", method =RequestMethod.GET)
	public String todoList(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage) {
		
		dao.todoList(request, response, nowPage);
		
		request.setAttribute("menuPage", "loginMenu.jsp");
		request.setAttribute("contentPage", "todo/todoList.jsp");
		
		return "indexMem";
	}

	@RequestMapping(value="/todoWrite", method =RequestMethod.POST)
	public String todoWrite(HttpServletRequest request, HttpServletResponse response, TodoBean todo) {
		
		dao.todoWrite(request, todo);
		
		return "redirect:/todoList?nowPage="+request.getParameter("nowPage");
	}

	@RequestMapping(value="/todoDelete", method =RequestMethod.GET)
	public String todoDelete(HttpServletRequest request, int Todo_Id,
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage) {
		
		dao.todoDelete(Todo_Id);
		
		return "redirect:/todoList?nowPage="+request.getParameter("nowPage");
	}
}
