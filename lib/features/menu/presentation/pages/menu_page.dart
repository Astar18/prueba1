import 'package:flutter/material.dart';


class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('¡Bienvenido!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text('Alex',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}