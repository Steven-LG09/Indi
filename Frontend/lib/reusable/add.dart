import 'package:flutter/material.dart'; // Importa el paquete principal de Flutter para UI
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart'
    as p; // Para obtener el nombre del archivo (basename)
import 'dart:convert'; // Para convertir objetos a JSON y viceversa
import 'dart:io'; // Para manejar archivos locales
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
  File? _selectedFile; // Variable para guardar el archivo seleccionado

  final List<String> _categories = [
    'Ornamental',
    'Medicinal',
    'Forestal',
    'Tierra',
  ];

  Future<void> pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(); // Abre el selector de archivos

    if (result != null && result.files.single.path != null) {
      // Si el usuario seleccionó un archivo, lo guardamos en _selectedFile
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> addDB() async {
    // Validamos que se haya llenado todo
    if (_selectedFile == null ||
        _controller.text.isEmpty ||
        _selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor completa todos los campos'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    // Creamos la petición tipo Multipart (permite enviar archivos)
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('http://192.168.1.6:4000/add'),
    );

    request.fields['name'] = _controller.text;
    request.fields['category'] = _selectedCategory!;
    // Adjuntamos el archivo al formulario
    request.files.add(
      await http.MultipartFile.fromPath(
        'image', // Nombre con el que lo espera el backend
        _selectedFile!.path, // Ruta del archivo
        filename: p.basename(_selectedFile!.path), // Nombre del archivo
      ),
    );

    try {
      // Enviamos la solicitud y esperamos la respuesta
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      final data = jsonDecode(response.body);

      if (!mounted) return;

      if (data['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(data['message']),
            backgroundColor: Colors.green,
          ),
        );
      } else {
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
                onPressed: pickFile,
                child: Text(
                  _selectedFile == null
                      ? 'Seleccionar imagen'
                      : 'Imagen seleccionada',
                ),
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
