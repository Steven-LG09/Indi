import 'package:flutter/material.dart'; // Importa el paquete principal de Flutter para UI
import 'styles/styles.dart';
import 'tabmain.dart';

// Widget sin estado para la pantalla de login
class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  }); // Constructor con clave opcional para usar en navegación

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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TabScreen(),
                      ),
                    );
                  },
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
