import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class ContainerNoConection extends StatelessWidget {
  const ContainerNoConection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            child: Image.asset(
              'assets/imgs/conexao/icone_conexao.png',
              width: 250,
              height: 250,
            ),
          ),
          Text(
            "Sem conexão com a internet",
            style: TextStyle(
              color: Color(0xFFFF4747),
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            width: 80.w,
            child: Text(
              "Verifique sua conexão com a internet e tente novamente.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF666666), fontSize: 16),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
