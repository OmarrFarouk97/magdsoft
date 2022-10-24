import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsofttask/presentation/styles/colors.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'inter',
  textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 34.0.sp,
      ),
      bodySmall: TextStyle(
        fontSize: 13.0.sp,
      ),
      bodyMedium: TextStyle(fontSize: 24.sp, color: AppColors.white)),
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
);
