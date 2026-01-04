import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web_flutter/core/theme/app_theme.dart';
import 'package:portfolio_web_flutter/sections/main_layout.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 900),
      builder: (_, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dixita Mangroliya | Mobile Application Developer',
          theme: AppTheme.lightTheme,
          home: const MainLayout(),
        );
      },
    );
  }
}