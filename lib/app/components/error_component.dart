import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ErrorComponent extends StatelessWidget {
  const ErrorComponent({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            child: Image.asset(
              'assets/imgs/gestao_pneu/death_tire.png',
              width: 300,
              height: 300,
            ),
          ),
          Text(
            "Oops!",
            style: TextStyle(
              color: Color(0xFFFF4747),
              fontSize: 36,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            width: 80.w,
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF666666), fontSize: 20),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
