enum GoingToVote { no, maybe, yes }

extension GoingToVoteBackend on GoingToVote {
  String get backend {
    switch (this) {
      case GoingToVote.no:
        return 'no';
      case GoingToVote.maybe:
        return 'maybe';
      case GoingToVote.yes:
        return 'yes';
    }
  }
}
