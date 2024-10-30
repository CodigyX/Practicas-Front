import 'package:flutter/material.dart';
import 'package:spendify/pallete.dart';

class Button extends StatelessWidget {
  final Function onPressed;
  final String label;
  final bool enabled;

  const Button({
    Key? key,
    required this.onPressed,
    required this.label,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(30), // Radio grande para el borde izquierdo
          right: Radius.circular(30), // Radio grande para el borde derecho
        ),
      ),
      child: ElevatedButton(
        onPressed: enabled ? () => onPressed() : null,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(400, 45),
          backgroundColor: Pallete
              .primary, // Ahora se usa `backgroundColor` en lugar de `primary`
          shadowColor: Colors.transparent, // Sin sombra
          foregroundColor: Colors.white, // Color del texto del botón
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
