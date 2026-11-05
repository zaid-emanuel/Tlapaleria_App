import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../../core/widgets/cart_badge.dart';
import '../../core/widgets/custom_button.dart';
import '../cart/cart_screen.dart';
import '../catalog/catalog_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _abrirCatalogo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CatalogScreen()),
    );
  }

  void _abrirCarrito(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CartScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.build, size: 22),
            SizedBox(width: 8),
            Text('Tlapalería App'),
          ],
        ),
        actions: const [CartBadge()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner con degradado
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.banner),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [AppColors.primario, AppColors.acento],
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Todo para tu obra',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Text(
                    'Herramientas, pinturas y materiales para cualquier proyecto',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            CustomButton(
              texto: 'Ver catálogo',
              icono: Icons.storefront,
              onPressed: () => _abrirCatalogo(context),
            ),
            const SizedBox(height: AppSpacing.md),
            const Text(
              'Accesos rápidos',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textoPrincipal,
              ),
            ),
            const SizedBox(height: AppSpacing.sm + 4),
            Row(
              children: [
                Expanded(
                  child: _AccesoRapido(
                    icono: Icons.storefront,
                    texto: 'Productos',
                    onTap: () => _abrirCatalogo(context),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm + 4),
                Expanded(
                  child: _AccesoRapido(
                    icono: Icons.shopping_cart_outlined,
                    texto: 'Carrito',
                    onTap: () => _abrirCarrito(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.primarioClaro,
                borderRadius: BorderRadius.circular(AppRadius.tarjeta),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, color: AppColors.primario),
                  SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Text(
                      'Busca por nombre o filtra por categoría, agrega al carrito y simula tu compra.',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textoSecundario,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccesoRapido extends StatelessWidget {
  final IconData icono;
  final String texto;
  final VoidCallback onTap;

  const _AccesoRapido({
    required this.icono,
    required this.texto,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppRadius.tarjeta),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.tarjeta),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icono, color: AppColors.primario),
              const SizedBox(height: AppSpacing.md),
              Text(
                texto,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textoPrincipal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
