package com.sm.household.todo;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface TodoMapper {
	public List<TodoBean> todoList(@Param("User_Email")String User_Email,  
			@Param("startNum") int startNum, @Param("endNum")int endNum);
	
	public void todoWrite(TodoBean todo);
	public void todoDelete(int Todo_Id);
	
	public int getTodoCount(String User_Email);
}
