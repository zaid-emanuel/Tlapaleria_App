import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_theme.dart';
import '../../core/widgets/cart_badge.dart';
import '../../core/widgets/custom_button.dart';
import '../../models/product.dart';
import '../cart/cart_provider.dart';
import '../cart/cart_screen.dart';

// Recibe el producto como argumento por constructor.
class ProductDetailScreen extends StatelessWidget {
  final Product producto;

  const ProductDetailScreen({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(producto.nombre),
        actions: const [CartBadge()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del producto sobre fondo crema
            Container(
              width: double.infinity,
              height: 250,
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.primarioClaro,
                borderRadius: BorderRadius.circular(AppRadius.banner),
              ),
              child: Image.asset(producto.rutaImagen, fit: BoxFit.contain),
            ),
            const SizedBox(height: AppSpacing.md),
            // Información
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.primarioClaro,
                borderRadius: BorderRadius.circular(AppRadius.tarjeta),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    producto.nombre,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textoPrincipal,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    producto.precioTexto,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primario,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Chip(label: Text(producto.categoria)),
                  const SizedBox(height: AppSpacing.sm),
                  const Text(
                    'Descripción',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textoPrincipal,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    producto.descripcion,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            CustomButton(
              texto: 'Agregar al carrito',
              icono: Icons.add_shopping_cart,
              onPressed: () {
                context.read<CartProvider>().agregar(producto);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${producto.nombre} agregado al carrito')),
                );
              },
            ),
            const SizedBox(height: AppSpacing.sm),
            CustomButton(
              texto: 'Ir al carrito',
              icono: Icons.shopping_cart_outlined,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
