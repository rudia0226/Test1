package com.sm.household.ca;

import java.util.List;


public interface CaMapper {
	// insert, update, delete : int
	// select : List<xxx>
    //	public abstract int writeBook(CaBean b);
	
	public abstract List<CaBean> getListByGroup(CaBean c);
	public abstract List<CaBean> getAllList(CaBean c);
	public abstract CaBean getCaByKey(CaBean c);
	public abstract int modifyCaByKey(CaBean ca);
	public abstract int newCaCreate(CaBean ca);
	public abstract void delCate(CaBean ca);
	public abstract void updateNull(CaBean ca);
	
}
