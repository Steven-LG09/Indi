import 'package:flutter/material.dart';
import '../styles/styles.dart';
import '../reusable/add.dart';
import '../reusable/counter.dart';

class OrnamentalScreen extends StatelessWidget {
  const OrnamentalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFAF9F6),
      child: Padding(
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AddScreen(),
                      ),
                    );
                  },
                  style: AppStyles.buttonStyle,
                  child: const Text('Agregar'),
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
              color: Color(0xFFA5D6A7),
              elevation: 4,
              shape: AppStyles.cardShape,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagen
                  ClipRRect(
                    borderRadius: AppStyles.imageBorderRadius,
                    child: Image.network(
                      'https://picsum.photos/300/400',
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.fill,
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
                          style: AppStyles.plantName,
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          'Cantidad: 24',
                          style: AppStyles.quantityText,
                        ),

                        const SizedBox(height: 8),

                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const CounterScreen(),
                              ),
                            );
                          },
                          style: AppStyles.buttonStyle2,
                          icon: const Icon(
                            Icons.edit, // Cambia el ícono si quieres otro
                            color: Color(0xFF388E3C), // Color del ícono
                          ),
                          label: const Text(
                            '',
                            style: TextStyle(color: Color(0xFF388E3C)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
