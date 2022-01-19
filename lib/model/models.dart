class UserModel {
  int id;
  String name;
  String? email;
  TeamModel? team;

  UserModel(this.id, this.name, this.email, [this.team]);

  @override
  bool operator ==(Object other) {
    return other is UserModel && other.id == id;
  }

  @override
  int get hashCode => id;
}

class TeamModel {
  int id;
  String title;
  List<UserModel> players;

  TeamModel(this.id, this.title, this.players);

  void addPlayer(UserModel player) {
    players.add(player);
  }

  @override
  bool operator ==(Object other) {
    return other is TeamModel && other.id == id;
  }

  @override
  int get hashCode => id;
}

class Session {
  static final Session _singleton = Session._internal();

  factory Session() {
    return _singleton;
  }

  Session._internal();

  UserModel currentUser = UserModel(1, "YF", "yahor.fralou@itechart-group.com");
}
