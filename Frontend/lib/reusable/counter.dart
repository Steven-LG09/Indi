import 'package:flutter/material.dart'; // Importa el paquete principal de Flutter para UI
import '../styles/styles.dart';

// Widget sin estado para la pantalla de login
class CounterScreen extends StatelessWidget {
  const CounterScreen({
    super.key,
  }); // Constructor con clave opcional para usar en navegación

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: AppStyles.primaryColor,
        elevation: 1,
      ),
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
              // Título de bienvenida
              const Text(
                'INDI',
                style: AppStyles.title, // Usando estilo separado
              ),

              const SizedBox(height: 16),

              ClipRRect(
                borderRadius: AppStyles.imageBorderRadius2,
                child: Image.network(
                  'https://picsum.photos/300/400',
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 32), // Espacio vertical

              const Text(
                'Nombre de la planta',
                style: AppStyles.plantName, // Usando estilo separado
              ),

              const SizedBox(height: 16), // Espacio entre campos

              const Text(
                'Cantidad: {Number}',
                style: AppStyles.quantityText, // Usando estilo separado
              ),

              const SizedBox(height: 16), // Espacio entre campos

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Acción del botón
                    },
                    style: AppStyles.buttonStyle,
                    icon: const Icon(
                      Icons.add, // Cambia el ícono si quieres otro
                    ),
                    label: const Text(
                      'Sumar',
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ), // Espacio entre el botón y el input
                  ElevatedButton.icon(
                    onPressed: () {
                      // Acción del botón
                    },
                    style: AppStyles.buttonStyle,
                    icon: const Icon(
                      Icons.remove, // Cambia el ícono si quieres otro
                    ),
                    label: const Text(
                      'Restar',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24), // Espacio antes del botón
              // Botón para iniciar sesión
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    /*
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TabScreen(),
                      ),
                    );*/
                  },
                  style: AppStyles.buttonStyle,
                  child: const Text('Confirmar'),
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
