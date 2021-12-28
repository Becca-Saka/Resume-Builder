import 'package:flutter/material.dart';
import 'package:resume_builder/shared/const_color.dart';
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
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: AppColor.mainAppColor,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        primaryColor: Color(0xff47c2d6),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xff47c2d6)),
      ),
      debugShowCheckedModeBanner: false,
      home: MainView(),
    );
  }
}
