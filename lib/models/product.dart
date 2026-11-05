class Product {
  final String id;
  final String nombre;
  final double precio;
  final String rutaImagen;
  final String categoria;
  final String descripcion;

  const Product({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.rutaImagen,
    required this.categoria,
    required this.descripcion,
  });

  String get precioTexto => '\$${precio.toStringAsFixed(2)}';
}
