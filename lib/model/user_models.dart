abstract class PlayerModel {
  final int id;
  final String name;

  PlayerModel(this.id, this.name);

  @override
  bool operator ==(Object other) {
    return other is PlayerModel && other.id == id;
  }

  @override
  int get hashCode => id;
}

class UserModel extends PlayerModel {
  final String? email;
  TeamModel? team;

  UserModel(id, name, this.email, [this.team]) : super(id, name);
}

class TeamModel extends PlayerModel {
  final List<UserModel> players;

  TeamModel(id, name, this.players) : super (id, name);

  void addPlayer(UserModel player) {
    players.add(player);
  }
}

class Session {
  static final Session _singleton = Session._internal();

  factory Session() {
    return _singleton;
  }

  Session._internal();

  UserModel currentUser = UserModel(1, "YF", "yahor.fralou@itechart-group.com");
}
