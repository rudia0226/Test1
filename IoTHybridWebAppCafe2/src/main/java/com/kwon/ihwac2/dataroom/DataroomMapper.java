package com.kwon.ihwac2.dataroom;

import java.util.List;

public interface DataroomMapper {
	public abstract int delete(Data d);

	public abstract List<Data> getAllData();

	public abstract int upload(Data d);
}
