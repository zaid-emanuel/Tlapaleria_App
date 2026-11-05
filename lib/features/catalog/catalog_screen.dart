import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/cart_badge.dart';
import '../../core/widgets/product_card.dart';
import '../../data/repositories/product_repository.dart';
import '../../models/product.dart';
import '../product_detail/product_detail_screen.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final ProductRepository _repository = ProductRepository();
  String categoriaSeleccionada = 'Todas';
  String textoBusqueda = '';

  // Pide los productos al repositorio y filtra con where
  List<Product> get productosFiltrados {
    final busqueda = textoBusqueda.trim().toLowerCase();
    return _repository.obtenerProductos().where((producto) {
      final coincideCategoria =
          categoriaSeleccionada == 'Todas' || producto.categoria == categoriaSeleccionada;
      final coincideBusqueda = producto.nombre.toLowerCase().contains(busqueda);
      return coincideCategoria && coincideBusqueda;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final listaFiltrada = productosFiltrados;
    final categorias = ['Todas', ..._repository.obtenerCategorias()];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo'),
        actions: const [CartBadge()],
      ),
      body: Column(
        children: [
          // Barra de búsqueda
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: TextField(
              onChanged: (texto) {
                setState(() {
                  textoBusqueda = texto;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Buscar producto...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),

          // Filtros por categoría
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                for (final categoria in categorias) ...[
                  _botonFiltro(categoria),
                  const SizedBox(width: 8),
                ],
              ],
            ),
          ),

          // Lista de productos
          Expanded(
            child: listaFiltrada.isEmpty
                ? const Center(child: Text('No se encontraron productos'))
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.78,
                    ),
                    itemCount: listaFiltrada.length,
                    itemBuilder: (context, index) {
                      final producto = listaFiltrada[index];
                      return Hero(
                        tag: 'producto-${producto.id}',
                        child: ProductCard(
                          producto: producto,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailScreen(producto: producto),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _botonFiltro(String nombre) {
    final seleccionado = categoriaSeleccionada == nombre;
    return ChoiceChip(
      label: Text(nombre),
      labelStyle: TextStyle(
        color: seleccionado ? Colors.white : AppColors.textoPrincipal,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      selected: seleccionado,
      onSelected: (_) {
        setState(() {
          categoriaSeleccionada = nombre;
        });
      },
    );
  }
}
