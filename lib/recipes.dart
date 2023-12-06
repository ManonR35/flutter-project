import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';
import 'inventory.dart';

class Recipe {
  final String name;
  final Map<String, int> cost;
  final String description;
  final String type;
  final String details;

  Recipe(this.name, this.cost, this.description, this.type, this.details);
}

class RecettesScreen extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe('Hache', {'Bois': 2}, 'Récolte le bois 3 par 3', 'Outil',
        'Un outil utile'),
    Recipe('Pioche', {'Bois': 2, 'Ironrod': 3}, 'Récolte les minerais 5 par 5',
        'Outil', 'Un outil utile'),
    Recipe('Lingot de fer', {'Ironrod': 1}, 'Débloque d\'autres recettes',
        'Matériau', 'Un lingot de fer pur'),
    Recipe(
        'Plaque de fer',
        {'Ironrod': 3, 'Plaque de métal': 2},
        'Débloque d\'autres recettes',
        'Matériau',
        'Une plaque de fer pour la construction'),
    Recipe('Lingot de cuivre', {'Copperrod': 1}, 'Débloque d\'autres recettes',
        'Matériau', 'Un lingot de cuivre pur'),
    Recipe(
        'Tige en métal',
        {'Ironrod': 1},
        'Débloque d\'autres recettes',
        'Matériau',
        'Une tige de métal pour fabriquer des composants électroniques'),
    Recipe(
        'Fil électrique',
        {'Copperrod': 1},
        'Débloque d\'autres recettes',
        'Composant',
        'Un fil électrique pour fabriquer des composants électroniques'),
    Recipe(
        'Mineur',
        {'Plaque de fer': 10, 'Fil électrique': 5},
        'Permet de transformer automatiquement du minerai de fer ou cuivre',
        'Bâtiment',
        'Un bâtiment qui permet d\'automatiser le minage'),
    Recipe(
        'Fonderie',
        {'Fil électrique': 5, 'Tige en métal': 8},
        'Permet de transformer automatiquement du minerai de fer ou cuivre en lingot de fer ou cuivre',
        'Bâtiment',
        'Un bâtiment qui permet d\'automatiser la production'),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ResourceCounter>(
      builder: (context, resourceCounter, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Recettes'),
          ),
          body: ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (BuildContext context, int index) {
              return RecipeWidget(
                  recipe: recipes[index], resourceCounter: resourceCounter);
            },
          ),
        );
      },
    );
  }
}

class RecipeWidget extends StatelessWidget {
  final Recipe recipe;
  final ResourceCounter resourceCounter;

  const RecipeWidget(
      {Key? key, required this.recipe, required this.resourceCounter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool enoughResources = _checkIfEnoughResources(recipe, resourceCounter);

    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recipe.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text('Description: ${recipe.description}'),
            SizedBox(height: 4),
            Text('Type: ${recipe.type}'),
            SizedBox(height: 4),
            Text('Détails: ${recipe.details}'),
            SizedBox(height: 4),
            Text(' ${formatCost(recipe.cost)}'),
            SizedBox(height: 8),
            enoughResources
                ? ElevatedButton(
                    onPressed: () {
                      _produceRecipe(context);
                    },
                    child: Text('Produire'),
                  )
                : ElevatedButton(
                    onPressed: null,
                    child: Text('Produire'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.black,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  String formatCost(Map<String, int> cost) {
    String formattedCost = 'Coût: ';
    cost.forEach((key, value) {
      formattedCost += '$key($value) ';
    });
    return formattedCost;
  }

//compare les besoins en ressources de la recette avec les ressources existantes
  bool _checkIfEnoughResources(Recipe recipe, ResourceCounter resourceCounter) {
    for (var entry in recipe.cost.entries) {
      final resourceName = entry.key;

      if (resourceCounter.resourceCounters.containsKey(resourceName)) {
        if (resourceCounter.resourceCounters[resourceName]! < entry.value) {
          return false;
        }
      } else {
        return false;
      }
    }
    return true;
  }

  // ajouter la création de la recette dans la page inventaire
  void _produceRecipe(BuildContext context) {
    Inventory inventory = Provider.of<Inventory>(context, listen: false);
    inventory.addItem(InventoryItem(name: recipe.name, quantity: 1));
  }
}
