import 'package:flutter/material.dart';

class AppStyles {
  // Color principal
  static const Color primaryColor = Color(0xFF388E3C);

  // Fuente base
  static const String fontFamily = 'TimesNewRoman';

  // Texto "INDI"
  static const TextStyle title = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
  );

  // Estilo del texto de entrada
  static const TextStyle inputText = TextStyle(
    color: Colors.black,
    fontFamily: fontFamily,
    fontSize: 16,
  );

  // Estilo del label (dentro del input)
  static const TextStyle labelText = TextStyle(
    color: primaryColor,
    fontFamily: fontFamily,
    fontSize: 16,
  );

  // Borde de campos de texto
  static OutlineInputBorder inputBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1.5),
      borderRadius: BorderRadius.circular(12),
    );
  }

  // InputDecoration base para campos
  static InputDecoration inputDecoration({
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle: labelText,
      prefixIcon: Icon(icon, color: primaryColor),
      enabledBorder: inputBorder(primaryColor),
      focusedBorder: inputBorder(Colors.black),
    );
  }

  // Estilo de botón
  static final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    padding: const EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    textStyle: const TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    foregroundColor: Colors.white,
  );

  // Estilo de título para AppBar
  static const TextStyle appBarTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  // Estilo para pestañas seleccionadas
  static const TextStyle tabSelected = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  // Estilo para pestañas no seleccionadas
  static const TextStyle tabUnselected = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  // Estilo para contenido dentro de TabBarView
  static const TextStyle tabContentText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    color: Colors.black,
  );


}
