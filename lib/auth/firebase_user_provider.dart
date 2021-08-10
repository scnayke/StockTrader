import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class Stocktrade12FirebaseUser {
  Stocktrade12FirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

Stocktrade12FirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<Stocktrade12FirebaseUser> stocktrade12FirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<Stocktrade12FirebaseUser>(
            (user) => currentUser = Stocktrade12FirebaseUser(user));
