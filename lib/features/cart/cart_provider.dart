import 'package:flutter/material.dart';

import '../../models/product.dart';

class CartItem {
  final Product producto;
  int cantidad;

  CartItem({required this.producto, this.cantidad = 1});

  double get subtotal => producto.precio * cantidad;
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get cantidadTotal => _items.fold(0, (suma, item) => suma + item.cantidad);

  double get total => _items.fold(0.0, (suma, item) => suma + item.subtotal);

  bool get estaVacio => _items.isEmpty;

  int cantidadDe(Product producto) {
    final indice = _items.indexWhere((i) => i.producto.id == producto.id);
    return indice == -1 ? 0 : _items[indice].cantidad;
  }

  void agregar(Product producto) {
    final indice = _items.indexWhere((i) => i.producto.id == producto.id);
    if (indice == -1) {
      _items.add(CartItem(producto: producto));
    } else {
      _items[indice].cantidad++;
    }
    notifyListeners();
  }

  void quitar(Product producto) {
    final indice = _items.indexWhere((i) => i.producto.id == producto.id);
    if (indice == -1) return;
    if (_items[indice].cantidad > 1) {
      _items[indice].cantidad--;
    } else {
      _items.removeAt(indice);
    }
    notifyListeners();
  }

  void eliminar(Product producto) {
    _items.removeWhere((i) => i.producto.id == producto.id);
    notifyListeners();
  }

  void vaciar() {
    _items.clear();
    notifyListeners();
  }
}
