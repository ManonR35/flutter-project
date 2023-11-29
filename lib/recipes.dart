import 'package:flutter/material.dart';

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
    Recipe('Hache', {'bois': 2, 'Ironrod': 2}, 'Récolte le bois 3 par 3',
        'Outil', 'Un outil utile'),
    Recipe('Pioche', {'bois': 2, 'Ironrod': 3}, 'Récolte les minerais 5 par 5',
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Recettes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (BuildContext context, int index) {
          return RecipeWidget(recipe: recipes[index]);
        },
      ),
    );
  }
}

class RecipeWidget extends StatelessWidget {
  final Recipe recipe;

  const RecipeWidget({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Text('Coût: ${formatCost(recipe.cost)}'),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              child: Text('Produire'),
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
}
