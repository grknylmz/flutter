import 'dart:async';
import 'package:simple_auth/simple_auth.dart' as simpleAuth;  // Auth
import '../models/constant.dart';

class AuthProvider {
  // CONSTANTS +
  final simpleAuth.GoogleApi _googleApi = new simpleAuth.GoogleApi("google",
      googleClientID, // client id
      clientSecret: googleClientSecret, // client secret
      scopes: [
        "https://www.googleapis.com/auth/userinfo.email",
        "https://www.googleapis.com/auth/userinfo.profile"
      ] // scopes
  );
  // CONSTANTS -

  // Get google token
  Future<Map<String, dynamic>> getGoogleUser() async {
    simpleAuth.GoogleUser googleUser = await _googleApi.getUserProfile();
    String token = _googleApi.currentOauthAccount.token;

    Map<String, dynamic> map = new Map<String, dynamic>();
    map['token']      = token;
    map['email']      = googleUser.email;
    map['picURL']     = googleUser.picture;
    map['picBase64']  = '';
    map['creationDate'] = new DateTime.now().millisecondsSinceEpoch;
    return map;
  }

  void logout() async {
    await _googleApi.logOut();
  }

  dispose() {

  }
}