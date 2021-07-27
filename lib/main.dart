import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/firebase_user_provider.dart';
import 'package:stocktrade1/login_page/login_page_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'home_index_page/home_index_page_widget.dart';
import 'my_watch_list/my_watch_list_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Stream<Stocktrade1FirebaseUser> userStream;
  Stocktrade1FirebaseUser initialUser;

  @override
  void initState() {
    super.initState();
    userStream = stocktrade1FirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'stocktrade1',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: initialUser == null
          ? const Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.primaryColor,
                ),
              ),
            )
          : currentUser.loggedIn
              ? NavBarPage()
              : LoginPageWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'HomeIndexPage';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomeIndexPage': HomeIndexPageWidget(),
      'MyWatchList': MyWatchListWidget(),
    };
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 26,
            ),
            activeIcon: Icon(
              Icons.home_sharp,
              size: 26,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.remove_red_eye_outlined,
              size: 26,
            ),
            activeIcon: Icon(
              Icons.remove_red_eye_sharp,
              size: 26,
            ),
            label: 'Home',
          )
        ],
        backgroundColor: Colors.white,
        currentIndex: tabs.keys.toList().indexOf(_currentPage),
        selectedItemColor: Color(0xFF170290),
        unselectedItemColor: FlutterFlowTheme.tertiaryColor,
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        // Temporary fix for https://github.com/flutter/flutter/issues/84556
        selectedLabelStyle: const TextStyle(fontSize: 0.001),
        unselectedLabelStyle: const TextStyle(fontSize: 0.001),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
