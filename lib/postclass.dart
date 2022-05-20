class User {
  String? _userId;
  String? _userPw;
  String? _userNickname;

  User(
        String? userId,
        String? userPw,
        String? userNickname,
        ) {
    if (userId != null) {
      this._userId = userId;
    }
    if (userPw != null) {
      this._userPw = userPw;
    }
    if (userNickname != null) {
      this._userNickname = userNickname;
    }
  }

  String? get userId => _userId;
  set userId(String? userId) => _userId = userId;
  String? get userPw => _userPw;
  set userPw(String? userPw) => _userPw = userPw;
  String? get userNickname => _userNickname;
  set userNickname(String? userNickname) => _userNickname = userNickname;

  User.fromJson(Map<String, dynamic> json) {
    _userId = json['user_id'];
    _userPw = json['user_pw'];
    _userNickname = json['user_nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this._userId;
    data['user_pw'] = this._userPw;
    data['user_nickname'] = this._userNickname;
    return data;
  }
}