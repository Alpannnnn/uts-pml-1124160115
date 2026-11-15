import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/profile_page.dart';
import 'screens/about_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;

  void ubahTema(bool nilai) {
    setState(() {
      themeMode = nilai ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Alfan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/profile': (context) => ProfilePage(
              isDark: themeMode == ThemeMode.dark,
              onThemeChanged: ubahTema,
            ),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}