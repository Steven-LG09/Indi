import 'package:flutter/material.dart';

// Este widget representa la segunda pantalla
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Pantalla'), // Título de la AppBar
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Volver a la pantalla principal'),
          onPressed: () {
            // Navigator.pop elimina la pantalla actual y regresa a la anterior
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
