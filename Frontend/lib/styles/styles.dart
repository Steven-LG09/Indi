import 'package:flutter/material.dart';

class AppStyles {
  // Color principal
  static const Color primaryColor = Color(0xFF388E3C);

  // Texto "INDI"
  static const TextStyle title = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.bold,
    fontFamily: 'TimesNewRoman',
  );

  // Estilo del texto de entrada
  static const TextStyle inputText = TextStyle(
    color: Colors.black,
    fontFamily: 'TimesNewRoman',
    fontSize: 16,
  );

  // Estilo del label (dentro del input)
  static const TextStyle labelText = TextStyle(
    color: primaryColor,
    fontFamily: 'TimesNewRoman',
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
      fontFamily: 'TimesNewRoman',
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    foregroundColor: Colors.white,
  );
}
