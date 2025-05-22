import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../styles/styles.dart';
import '../reusable/add.dart';
import '../reusable/counter.dart';

class OrnamentalScreen extends StatefulWidget {
  const OrnamentalScreen({super.key});

  @override
  State<OrnamentalScreen> createState() => _OrnamentalScreenState();
}

class _OrnamentalScreenState extends State<OrnamentalScreen> {
  List<dynamic> _plants = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    obtenerPlantas();
  }

  // 🔁 Obtener datos desde el backend
  Future<void> obtenerPlantas() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.6:4000/ornamental'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _plants = data;
          _isLoading = false;
        });
      } else {
        throw Exception('Error en la fotosíntesis');
      }
    } catch (e) {
      setState(() {
        _error = 'No se pudieron obtener las plantas.';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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

                const SizedBox(width: 16),

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
            const SizedBox(height: 24),

            // 🌀 Contenido dinámico
            Expanded(
              child:
                  _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : _error != null
                      ? Center(child: Text(_error!))
                      : _plants.isEmpty
                      ? const Center(child: Text('No hay plantas registradas'))
                      : ListView.builder(
                        itemCount: _plants.length,
                        itemBuilder: (context, index) {
                          return buildPlantCard(_plants[index]);
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPlantCard(Map<String, dynamic> planta) {
    return Card(
      color: const Color(0xFFA5D6A7),
      elevation: 4,
      shape: AppStyles.cardShape,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen dinámica
          ClipRRect(
            borderRadius: AppStyles.imageBorderRadius,
            child: Image.network(
              planta['productoimage'] ?? 'https://via.placeholder.com/300x400',
              height: 160,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),

          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  planta['name'] ?? 'Sin nombre',
                  style: AppStyles.plantName,
                ),
                Text(
                  'Cantidad: ${planta['quantity'] ?? '0'}',
                  style: AppStyles.quantityText,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const CounterScreen()),
                    );
                  },
                  style: AppStyles.buttonStyle2,
                  icon: const Icon(Icons.edit, color: Color(0xFF388E3C)),
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
    );
  }
}
