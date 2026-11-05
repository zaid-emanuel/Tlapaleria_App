import 'package:flutter/material.dart';

/// Botón principal de la app. Por defecto ocupa todo el ancho, como en las
/// pantallas de Figma.
class CustomButton extends StatelessWidget {
  final String texto;
  final IconData? icono;
  final VoidCallback? onPressed;
  final bool anchoCompleto;

  const CustomButton({
    super.key,
    required this.texto,
    this.icono,
    required this.onPressed,
    this.anchoCompleto = true,
  });

  @override
  Widget build(BuildContext context) {
    final boton = icono != null
        ? ElevatedButton.icon(
            onPressed: onPressed,
            icon: Icon(icono, size: 18),
            label: Text(texto),
          )
        : ElevatedButton(onPressed: onPressed, child: Text(texto));

    return anchoCompleto ? SizedBox(width: double.infinity, child: boton) : boton;
  }
}
