package com.sm.household.calendar;

import java.util.Date;
import java.util.List;

public interface HcalendarMapper {
	public abstract List<HsumAmount> seldailySum(Hcalendar h);
	public abstract List<Hcalendar> getDataByDate(Hcalendar h);
	public abstract int setGoalAmount(Hcalendar h);
	public abstract int getGoalAmount(Hcalendar h);
	public abstract Date getJoinDate(Hcalendar h);
	

}
