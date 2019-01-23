package com.rudia.s.board;

import java.util.List;

public interface BoardMapper {
	public  abstract int regBoard(Board b);
	public  abstract List<Board>  getAllBoard();
	public  abstract  List<Board>  searchBoard(Board  b);
}
