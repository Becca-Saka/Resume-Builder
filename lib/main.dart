import 'package:flutter/material.dart';
import 'views/main_view.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // HiveHelper().init();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV Builder',
      theme:  ThemeData(
        appBarTheme: AppBarTheme.of(context).copyWith(
          iconTheme: IconThemeData(
            color: Colors.white
          ),
          textTheme: TextTheme(headline6: TextStyle(
            color: Colors.white,
            fontSize: 18
          ),),
        ),
        iconTheme: IconThemeData(color: Colors.white),
         primaryColor: Color(0xff47c2d6),
        accentColor: Color(0xff47c2d6),
      ),
       debugShowCheckedModeBanner: false,
      home: MainView(),
    );
  }
}