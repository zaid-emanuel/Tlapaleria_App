import '../../models/product.dart';
import '../local/products_data.dart';

// En la Etapa 2 solo se cambia este archivo para leer de Firestore;
// la UI no se modifica.
class ProductRepository {
  List<Product> obtenerProductos() {
    return productosLocales;
  }

  List<String> obtenerCategorias() {
    final categorias = productosLocales.map((p) => p.categoria).toSet().toList();
    categorias.sort();
    return categorias;
  }

  List<Product> obtenerDestacados() {
    return productosLocales.take(5).toList();
  }
}
