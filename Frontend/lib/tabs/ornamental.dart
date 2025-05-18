import 'package:flutter/material.dart';
import '../styles/styles.dart';

class OrnamentalScreen extends StatelessWidget {
  const OrnamentalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Añade algo de espacio
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Alineación vertical a la izquierda
        children: [
          // Fila con botón e input
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Acción del botón
                },
                style: AppStyles.buttonStyle,
                child: const Text('Botón'),
              ),
              const SizedBox(width: 16), // Espacio entre el botón y el input
              Expanded(
                child: TextField(
                  decoration: AppStyles.inputDecoration(
                    label: 'Buscar',
                    icon: Icons.search,
                  ),
                  style: AppStyles.inputText,
                  keyboardType: TextInputType.text,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24), // Espacio debajo

          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagen
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.asset(
                    'assets/tu_imagen.jpg', // Reemplaza con tu imagen
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Nombre de la planta',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      ElevatedButton(
                        onPressed: () {
                          // Acción del botón
                        },
                        style: AppStyles.buttonStyle,
                        child: const Text('Editar'),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Cantidad: 24',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
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
