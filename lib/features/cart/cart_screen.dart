import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_theme.dart';
import '../../core/widgets/custom_button.dart';
import '../../models/product.dart';
import 'cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carrito = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Carrito')),
      body: carrito.estaVacio ? _CarritoVacio() : _CarritoLleno(carrito: carrito),
    );
  }
}

class _CarritoVacio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.shopping_cart_outlined,
            size: 72,
            color: AppColors.textoSecundario,
          ),
          const SizedBox(height: AppSpacing.md),
          const Text(
            'Tu carrito está vacío',
            style: TextStyle(fontSize: 15, color: AppColors.textoPrincipal),
          ),
          const SizedBox(height: AppSpacing.lg),
          CustomButton(
            texto: 'Seguir comprando',
            anchoCompleto: false,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

class _CarritoLleno extends StatelessWidget {
  final CartProvider carrito;

  const _CarritoLleno({required this.carrito});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: carrito.items.length,
            separatorBuilder: (context, index) =>
                const SizedBox(height: AppSpacing.sm + 4),
            itemBuilder: (context, index) =>
                _ItemCarrito(item: carrito.items[index]),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
          ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textoPrincipal,
                      ),
                    ),
                    Text(
                      '\$${carrito.total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primario,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                CustomButton(
                  texto: 'Simular compra',
                  icono: Icons.check_circle_outline,
                  onPressed: () => _simularCompra(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _simularCompra(BuildContext context) {
    final carrito = context.read<CartProvider>();
    final mensajero = ScaffoldMessenger.of(context);
    final total = carrito.total;

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Confirmar compra'),
        content: Text('Se simulará una compra por \$${total.toStringAsFixed(2)}.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text(
              'Cancelar',
              style: TextStyle(color: AppColors.acento),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              carrito.vaciar();
              Navigator.pop(dialogContext);
              mensajero.showSnackBar(
                const SnackBar(content: Text('¡Compra simulada con éxito!')),
              );
            },
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}

class _ItemCarrito extends StatelessWidget {
  final CartItem item;

  const _ItemCarrito({required this.item});

  @override
  Widget build(BuildContext context) {
    final Product producto = item.producto;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm + 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.tarjeta),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.primarioClaro,
              borderRadius: BorderRadius.circular(AppRadius.chico),
            ),
            child: Image.asset(producto.rutaImagen, fit: BoxFit.contain),
          ),
          const SizedBox(width: AppSpacing.sm + 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  producto.nombre,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textoPrincipal,
                  ),
                ),
                Text(
                  producto.precioTexto,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textoSecundario,
                  ),
                ),
                Text(
                  '\$${item.subtotal.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primario,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            visualDensity: VisualDensity.compact,
            color: AppColors.acento,
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () => context.read<CartProvider>().quitar(producto),
          ),
          Text(
            '${item.cantidad}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textoPrincipal,
            ),
          ),
          IconButton(
            visualDensity: VisualDensity.compact,
            color: AppColors.acento,
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () => context.read<CartProvider>().agregar(producto),
          ),
        ],
      ),
    );
  }
}
