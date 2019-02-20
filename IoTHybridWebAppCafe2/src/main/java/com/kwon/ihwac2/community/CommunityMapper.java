package com.kwon.ihwac2.community;

import java.util.List;

import com.kwon.ihwac2.member.Member;

public interface CommunityMapper {
	public abstract int delMsg(Msg m);

	public abstract List<Member> getAllMember();

	public abstract List<Msg> getMsg(Msg m);

	public abstract int sendMsg(Msg m);
}
