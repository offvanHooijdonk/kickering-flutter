import 'package:kickering_flutter/model/user_models.dart';

class OpenGameModel {
  final int id;
  final PlayerModel author;
  final DateTime createdDate;
  final List<PlayerModel> players;
  final List<PlayerModel> invites;
  GameType type;
  GameStatus status;

  OpenGameModel(this.id, this.author, this.createdDate, this.players, this.invites, this.type, [this.status = GameStatus.open]);
}

enum GameStatus {
  open, canceled, readyToPlay, inProgress, finished
}

enum GameType {
  free, teamNoRating, teamRating, oneOneOne
}

class GamePlayerModel extends PlayerModel {
  final OpenGameModel game;
  final DateTime updatedDate;
  GamePlayerStatus status;

  GamePlayerModel(id, name, this.game, this.updatedDate, this.status) : super(id, name);
}

enum GamePlayerStatus {
  invited, invitationAccepted, invitationRejected, requested, requestAccepted, outOfCapacity
}
