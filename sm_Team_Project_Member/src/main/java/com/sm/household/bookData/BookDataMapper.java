package com.sm.household.bookData;

import java.util.List;


public interface BookDataMapper {
	public abstract List<PayBean> getPayType(String User_Email);
	public abstract List<CateBean> getCateValue(CateBean ca);
	public abstract int getPayId(String pay_Value);
	public abstract String getCateId(String ca_Value);
	public abstract int insertData(BookDataBean bd); 
	public abstract int deleteData(BookDataBean bd);
	/*public abstract List<BookDataBean> getBookData(BookDataBean bd);*/
	public abstract String getBookData(BookDataBean bd);
	public abstract int updateData(BookDataBean bd);
	
}
