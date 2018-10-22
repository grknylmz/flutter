class User {
  final String token;
  String code;
  String name;
  String email;
  String picURL;
  String picBase64;
  DateTime creationDate;

  User.fromDB(Map<String, dynamic> map)
      : token = map['token']
      , code = map['code']
      , name = map['name']
      , email = map['email']
      , picURL = map['picURL']
      , picBase64 = map['picBase64']
      , creationDate = new DateTime.fromMicrosecondsSinceEpoch(map['creationDate'] ?? new DateTime.now().millisecondsSinceEpoch);

  Map<String, dynamic> toMapForDB() {
    return <String, dynamic>{
        "token": token
      , "code": code
      , "name": name
      , "email": email
      , "picURL": picURL
      , "picBase64": picBase64
      , "creationDate": new DateTime.now().millisecondsSinceEpoch // creationDate
    };
  }


}