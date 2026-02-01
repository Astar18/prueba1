import 'package:flutter/material.dart';
import 'package:prueba1/features/user/presentation/pages/user_page.dart';


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
            ElevatedButton(
              onPressed: () {
                // Navegación solicitada a la otra pantalla
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserPage()),
                );
              },
              child: const Text('Consultar Índice UV Ecuador'),
            ),
          ],
        ),
      ),
    );
  }
}