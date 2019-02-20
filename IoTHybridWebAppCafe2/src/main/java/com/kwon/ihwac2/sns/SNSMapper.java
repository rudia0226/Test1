package com.kwon.ihwac2.sns;

import java.util.List;

public interface SNSMapper {
	public abstract int deleteSNSMsg(SNSMsg sm);

	public abstract int deleteSNSRepl(SNSRepl sr);

	public abstract int deleteSNSRepl2(SNSMsg sm);

	public abstract List<SNSMsg> getAllSNSMsg();

	public abstract List<SNSRepl> getSNSRepl(SNSMsg sm);

	public abstract int updateSNSMsg(SNSMsg sm);

	public abstract int writeSNSMsg(SNSMsg sm);

	public abstract int writeSNSRepl(SNSRepl sr);
}
