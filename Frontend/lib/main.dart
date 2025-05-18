import 'package:flutter/material.dart';
// Importamos nuestra pantalla principal personalizada
import 'login.dart';

void main() {
  runApp(MyApp()); // Punto de entrada de la app, ejecuta MyApp
}

// MyApp es el widget principal de toda la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'INDI', // Título de la app (no visible en todas las plataformas)
      theme: ThemeData(
        primarySwatch: Colors.blue, // Tema visual de la app
      ),
      home: LoginScreen(), // Definimos que la pantalla inicial será HomeScreen
    );
  }
}
