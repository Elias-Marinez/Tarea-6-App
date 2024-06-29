import 'package:flutter/material.dart';

class ContactInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactInfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Espacio vertical entre filas
      child: Row(
        children: [
          Icon(icon, size: 28, color: Colors.white), // Tamaño de icono aumentado y color cambiado a blanco
          const SizedBox(width: 20), // Espacio horizontal entre icono y texto aumentado
          Text(
            text,
            style: const TextStyle(fontSize: 16), // Color de texto cambiado a blanco
          ),
        ],
      ),
    );
  }
}