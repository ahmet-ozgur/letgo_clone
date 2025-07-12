import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:letgo_clone/views/bottom_navigation_views/ilanlarim_pages/ilanlarim_page.dart';
import 'package:letgo_clone/views/login_pages/login_page_verification.dart';
import 'package:letgo_clone/views/starter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          home: StarterPage(),
        );
      },
    );
  }
}
