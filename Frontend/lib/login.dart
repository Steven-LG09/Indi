import 'package:flutter/material.dart'; // Importa el paquete principal de Flutter para UI
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'styles/styles.dart';
import 'tabmain.dart';

// Widget sin estado para la pantalla de login
class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  }); // Constructor con clave opcional para usar en navegación

  @override
  State<LoginScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  Future<void> login() async {
    final text1 = _controller.text;
    final text2 = _controller2.text;

    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.6:4000/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'user': text1, 'password': text2}),
      );

      // Verifica si el widget aún está montado
      if (!mounted) return;
      final data = jsonDecode(response.body);

      if (data['success'] == true) {
        // Redirige solo si success es true
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TabScreen()),
        );
      } else {
        // Mostrar mensaje de error del backend
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(data['message'] ?? 'Error desconocido'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error de conexión: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6), // Color de fondo de la pantalla
      // El cuerpo principal de la pantalla
      body: Center(
        child: SingleChildScrollView(
          // Permite hacer scroll si el teclado tapa elementos
          padding: const EdgeInsets.all(
            24.0,
          ), // Espaciado alrededor del contenido

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
            children: [
              // Icono grande como logo o imagen representativa
              const Icon(Icons.forest, size: 80, color: Color(0xFF388E3C)),

              const SizedBox(height: 15), // Espacio vertical
              // Título de bienvenida
              const Text(
                'INDI',
                style: AppStyles.title, // Usando estilo separado
              ),

              const SizedBox(height: 32), // Espacio vertical
              // Campo de texto para el usuario
              TextField(
                controller: _controller,
                decoration: AppStyles.inputDecoration(
                  label: 'Usuario',
                  icon: Icons.person,
                ),
                style: AppStyles.inputText,
                keyboardType: TextInputType.text,
              ),

              const SizedBox(height: 16), // Espacio entre campos
              // Campo de texto para la contraseña
              TextField(
                controller: _controller2,
                decoration: AppStyles.inputDecoration(
                  label: 'Contraseña',
                  icon: Icons.lock_outline,
                ),
                style: AppStyles.inputText,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),

              const SizedBox(height: 24), // Espacio antes del botón
              // Botón para iniciar sesión
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: login,
                  style: AppStyles.buttonStyle,
                  child: const Text('Iniciar Sesión'),
                ),
              ),

              const SizedBox(height: 16), // Espacio antes de los textos
            ],
          ),
        ),
      ),
    );
  }
}
