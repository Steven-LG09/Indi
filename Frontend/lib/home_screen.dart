import 'package:flutter/material.dart';
// Importamos la segunda pantalla para poder navegar a ella
import 'second_screen.dart';

// Este widget representa la pantalla principal de la app
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold proporciona una estructura visual con barra superior, cuerpo, etc.
      appBar: AppBar(
        title: Text('Pantalla Principal'), // Título de la AppBar
      ),
      body: Center(
        // Center centra el contenido dentro de la pantalla
        child: ElevatedButton(
          // Botón que al presionar navega a la segunda pantalla
          child: Text('Ir a la segunda pantalla'),
          onPressed: () {
            // Navigator.push navega a una nueva pantalla
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondScreen(), // Aquí se define la nueva pantalla
              ),
            );
          },
        ),
      ),
    );
  }
}
