import 'package:flutter/material.dart'; // Importa el paquete principal de Flutter para UI
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../styles/styles.dart';

// Widget sin estado para la pantalla de login
class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController _controller = TextEditingController();
  String? _selectedCategory;

  final List<String> _categories = [
    'Ornamental',
    'Medicinal',
    'Forestal',
    'Tierra',
  ];

  Future<void> addDB() async {
    final text1 = _controller.text;

    try {
      final response = await http.post(
        Uri.parse(
          'http://192.168.1.6:4000/add',
        ), 
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'name': text1}),
      );

      if (response.statusCode == 200) {
        print('Respuesta del backend: ${response.body}');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error de conexión: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: AppStyles.primaryColor,
        elevation: 1,
      ),
      backgroundColor: const Color(0xFFFAF9F6),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.forest, size: 80, color: Color(0xFF388E3C)),
              const SizedBox(height: 15),
              const Text('INDI', style: AppStyles.title),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                  if (result != null) {
                    String filePath = result.files.single.path!;
                    print('Archivo seleccionado: $filePath');
                  }
                },
                child: const Text('Seleccionar Imagen'),
              ),

              const SizedBox(height: 16),
              TextField(
                controller: _controller,
                decoration: AppStyles.inputDecoration(
                  label: 'Nombre',
                  icon: Icons.eco,
                ),
                style: AppStyles.inputText,
                keyboardType: TextInputType.text,
              ),

              const SizedBox(height: 16),
              TextField(
                decoration: AppStyles.inputDecoration(
                  label: 'Cantidad',
                  icon: Icons.looks_3,
                ),
                style: AppStyles.inputText,
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: AppStyles.inputDecoration(
                  label: 'Categoría',
                  icon: Icons.category,
                ),
                value: _selectedCategory,
                items:
                    _categories.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
              ),

              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: addDB,
                  style: AppStyles.buttonStyle,
                  child: const Text('Enviar'),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
