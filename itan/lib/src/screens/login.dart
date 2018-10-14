import 'package:flutter/material.dart';
import 'package:simple_auth/simple_auth.dart' as simpleAuth;
import 'package:simple_auth_flutter/simple_auth_flutter.dart';
export 'package:simple_auth_flutter/simple_auth_flutter.dart';


class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  final simpleAuth.GoogleApi googleApi = new simpleAuth.GoogleApi("google",
      "640254302662-okid34prr0gknqkj8sou5cm344f89iap.apps.googleusercontent.com", // client id
//      redirectUrl: 'com.googleusercontent.apps.640254302662-okid34prr0gknqkj8sou5cm344f89iap',
      clientSecret: "PRVHCB4F-de4PPidUlvzzrcZ", // client secrete
      scopes: [
        "https://www.googleapis.com/auth/userinfo.email",
        "https://www.googleapis.com/auth/userinfo.profile"
      ] // scopes
  );

  @override
  Widget build(BuildContext context) {
    SimpleAuthFlutter.context = context;
    return new Scaffold(
      appBar: new AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
        title: new Text("Авторизация с помощью Google"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.launch),
              title: Text('Login'),
              onTap: () async {
                try {
                  var user = await googleApi.getUserProfile();
                  String token = googleApi.currentOauthAccount.token;
                  // showMessage("${user.name} logged in");
                  // showSnackBar("${user.name} logged in");
                  Navigator.of(context).pushNamed('/list');
                } catch (e) {
                  showError(e);
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Logout'),
              onTap: () {
                logout(googleApi);
              },
            ),
          ]
        ),
      ),
    );
  }


  void showError(dynamic ex) {
    showMessage(ex.toString());
  }

  void showMessage(String text) {
    var alert = new AlertDialog(content: new Text(text), actions: <Widget>[
      new FlatButton(
          child: const Text("Ok"),
          onPressed: () {
            Navigator.pop(context);
          })
    ]);
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  void showSnackBar(String text) {
    var msg = new SnackBar(content: new Text(text),);
  }

  void login(simpleAuth.AuthenticatedApi api) async {
    try {
      var success = await api.authenticate();
      showMessage("Logged in success: $success");
    } catch (e) {
      showError(e);
    }
  }

  void logout(simpleAuth.AuthenticatedApi api) async {
    await api.logOut();
    showMessage("Logged out");
  }
}
