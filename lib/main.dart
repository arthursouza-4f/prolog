import 'package:dio/dio.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prolog_app/core/network/dio_suport.dart';
import 'package:prolog_app/app/screen/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<Dio>(
      create: (_) => DioSuport().dio,
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: Color(0xFFF0F0F0),
              textTheme: GoogleFonts.montserratTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
