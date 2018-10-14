// Provider
import 'bloc_provider.dart';
// Auth
import 'package:simple_auth/simple_auth.dart' as simpleAuth;
import 'package:simple_auth_flutter/simple_auth_flutter.dart';
export 'package:simple_auth_flutter/simple_auth_flutter.dart';

class ApplicationBloc implements BlocBase {
  // Vars
  String _token;

  //
  // Stream to handle the token
  //
  StreamController<String> _tokenController = StreamController<String>();
  StreamSink<String> get _inAdd => _tokenController.sink;
  Stream<String> get outToken => _tokenController.stream;

  //
  // Stream to handle the action on the token
  //
  StreamController _actionController = StreamController();
  StreamSink get updToken => _actionController.sink;

  //
  // Constructor
  //
  ApplicationBloc(){
    _token = "";
    _actionController.stream
        .listen(_getToken);
  }

  void dispose(){
    _actionController.close();
    _tokenController.close();
  }

  void _handleLogic(data){

  }

  void _getToken(data) async {
    _token = "123";
    _inAdd.add(_token);
  }
}