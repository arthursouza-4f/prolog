import 'package:flutter/material.dart';

import 'package:prolog_app/app/components/container_module_selection.dart';
import 'package:prolog_app/tires/presentation/screen/tires_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: ContainerModuleSelection(
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
