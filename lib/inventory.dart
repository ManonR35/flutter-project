import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Inventory with ChangeNotifier {
  List<InventoryItem> items = [];

  void addItem(InventoryItem item) {
    items.add(item);
    notifyListeners();
  }
}

class InventoryItem {
  String name;
  int quantity;

  InventoryItem({required this.name, required this.quantity});
}

class InventoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Inventory>(
      builder: (context, inventory, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Inventaire'),
          ),
          body: ListView.builder(
            itemCount: inventory.items.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(inventory.items[index].name),
                subtitle: Text('Quantité: ${inventory.items[index].quantity}'),
              );
            },
          ),
        );
      },
    );
  }
}
