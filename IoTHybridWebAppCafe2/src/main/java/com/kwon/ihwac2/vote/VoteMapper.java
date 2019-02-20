package com.kwon.ihwac2.vote;

import java.util.List;

public interface VoteMapper {
	public abstract int delVoteItem();

	public abstract int delVoteVote();

	public abstract Vote getVote();

	public abstract List<VoteItem> getVoteItem();

	public abstract int regVote(Vote v);

	public abstract int regVoteItem(VoteItem vi);

	public abstract int updateVoteCount();

	public abstract int updateVoteItemCount(VoteVote vv);

	public abstract int vote(VoteVote vv);
}
