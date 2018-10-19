import 'package:rxdart/rxdart.dart';
// Provider
import 'bloc_provider.dart';
// Логика
import '../models/user.dart';
import '../resources/repository.dart';
import 'bloc_payment.dart';
import 'bloc_dictionary.dart';
export 'bloc_payment.dart';
export 'bloc_dictionary.dart';

class ApplicationBloc implements BlocBase {
  // VARS +
  Repository repository = new Repository();
  // VARS -

  // STREAMS +
  final BehaviorSubject<User> userSubject = BehaviorSubject<User>();
  Stream<User> get userStream => userSubject.stream;
  // STREAMS -

  // LOGIC +
  final BlocPayment blocPayment = new BlocPayment();
  //final BlocDictionary blocDictionary = new BlocDictionary();
  //final BlocCurrentPayment blocCurrentPayment = new BlocCurrentPayment();
  // LOGIC -

  //
  // Constructor
  //
  ApplicationBloc() {
    // Подписываем на потоки
    userStream.listen((user) => blocPayment.getPayments(user));

    // Функции при старте

    // Прежде чем авторизоваться надо подождать, пока будет установлено подключение к базе данных
    new Future.delayed(const Duration(seconds: 2), () => login());
  }

  // Авторизуюсь
  login() async {
    User user = await repository.fetchUser();
    if (user == null) return;
    userSubject.add(user);
  }

  changeAccount() async {
    // TODO: уничтожение сеанса пользователя
    logout();
    // TODO: подождать, пока не разлогинимся
    login();
  }

  logout() async {
    repository.logout(userSubject.value);
  }

  dispose() {
    userSubject.close();
  }

}