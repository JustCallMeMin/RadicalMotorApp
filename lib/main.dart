import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'auth/custom_auth/auth_util.dart';
import 'auth/custom_auth/custom_auth_user_provider.dart';

import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();
  await initFirebase();

  await FlutterFlowTheme.initialize();

  await authManager.initialize();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late Stream<RadicalMotorAuthUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = radicalMotorAuthUserStream()
      ..listen((user) => _appStateNotifier.update(user));

    Future.delayed(
      const Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'RadicalMotor',
      localizationsDelegates: const [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('vi'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key, this.initialPage, this.page});

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'Home';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Home': const HomeWidget(),
      'Main_customerList': const MainCustomerListWidget(),
      'Main_Contracts': const MainContractsWidget(),
      'myTeam': const MyTeamWidget(),
      'Main_profilePage': const MainProfilePageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: Visibility(
        visible: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (i) => setState(() {
            _currentPage = null;
            _currentPageName = tabs.keys.toList()[i];
          }),
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          selectedItemColor: FlutterFlowTheme.of(context).primary,
          unselectedItemColor: FlutterFlowTheme.of(context).secondaryText,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.dashboard_outlined,
                size: 24.0,
              ),
              activeIcon: const Icon(
                Icons.dashboard_rounded,
                size: 32.0,
              ),
              label: FFLocalizations.of(context).getText(
                'b4r4incm' /* __ */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.supervised_user_circle_outlined,
                size: 24.0,
              ),
              activeIcon: const Icon(
                Icons.supervised_user_circle_sharp,
                size: 32.0,
              ),
              label: FFLocalizations.of(context).getText(
                '10znzltu' /* __ */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home_work_outlined,
                size: 24.0,
              ),
              activeIcon: const Icon(
                Icons.home_work_rounded,
                size: 32.0,
              ),
              label: FFLocalizations.of(context).getText(
                'dbdtf5z5' /* __ */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.stream,
                size: 24.0,
              ),
              activeIcon: const Icon(
                Icons.stream,
                size: 24.0,
              ),
              label: FFLocalizations.of(context).getText(
                '74dybgn0' /* __ */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.account_circle_outlined,
                size: 24.0,
              ),
              activeIcon: const Icon(
                Icons.account_circle,
                size: 32.0,
              ),
              label: FFLocalizations.of(context).getText(
                '7yzhg039' /* __ */,
              ),
              tooltip: '',
            )
          ],
        ),
      ),
    );
  }
}
