import 'package:flutter/material.dart';

import 'package:prolog_app/presentation/components/container_seleciona_modulo.dart';
import 'package:prolog_app/presentation/screen/tire_module/tires_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      appBar: AppBar(
        title: const Text('Prolog', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF3C5ED9),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(12.0),
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              children: [
                //Componentizado para caso tivesse outros modulos
                GestureDetector(
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TiresScreen()),
                      ),
                  child: ContainerSelecionaModulo(
                    title: 'Gestão de pneus',
                    imagePath: 'assets/imgs/gestao_pneu/icon_home_screen.png',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
