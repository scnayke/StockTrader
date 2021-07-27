import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class Stocktrade1FirebaseUser {
  Stocktrade1FirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

Stocktrade1FirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<Stocktrade1FirebaseUser> stocktrade1FirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<Stocktrade1FirebaseUser>(
        (user) => currentUser = Stocktrade1FirebaseUser(user));
