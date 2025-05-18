import 'package:flutter/material.dart'; // Importa el paquete principal de Flutter para UI

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
                style: TextStyle(
                  fontSize: 38, // Tamaño de letra
                  fontWeight: FontWeight.bold, // Negrita
                  fontFamily: 'Times New Roman', // Fuente específica
                ),
              ),

              const SizedBox(height: 32), // Espacio vertical
              // Campo de texto para el correo electrónico
              TextField(
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  labelStyle: const TextStyle(
                    color: Color(0xFF388E3C), // Cambia el color del label
                    fontFamily:
                        'TimesNewRoman', // Cambia la fuente del label (si ya la cargaste)
                    fontSize: 16,
                  ),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Color(0xFF388E3C), // Cambia el color del ícono
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFF388E3C),
                    ), // Borde cuando NO está enfocado
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                    ), // Borde al enfocar
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: const TextStyle(
                  color: Colors.black, // Color del texto que escribe el usuario
                  fontFamily:
                      'TimesNewRoman', // Fuente del texto que escribe el usuario
                  fontSize: 16,
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 16), // Espacio entre campos
              // Campo de texto para la contraseña
              TextField(
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle: const TextStyle(
                    color: Color(0xFF388E3C), // Cambia el color del label
                    fontFamily:
                        'TimesNewRoman', // Cambia la fuente del label (si ya la cargaste)
                    fontSize: 16,
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Color(0xFF388E3C), // Cambia el color del ícono
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFF388E3C),
                    ), // Borde cuando NO está enfocado
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                    ), // Borde al enfocar
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: const TextStyle(
                  color: Colors.black, // Color del texto que escribe el usuario
                  fontFamily:
                      'TimesNewRoman', // Fuente del texto que escribe el usuario
                  fontSize: 16,
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 24), // Espacio antes del botón
              // Botón para iniciar sesión
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF388E3C), // Color de fondo del botón
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(
                      // Estilo del texto dentro del botón
                      fontFamily:
                          'TimesNewRoman', // Asegúrate de tenerla registrada
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    foregroundColor: Colors.white, // Color del texto
                  ),
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
