import 'package:flutter/material.dart';
import 'recipes.dart';

void main() {
  runApp(MyApp());
}

class Resource {
  final String name;
  final Color color;
  final String description;

  Resource(this.name, this.color, this.description);
}

class MyApp extends StatelessWidget {
  final List<Resource> resources = [
    Resource('Bois', Color(0xFF967969), 'Du bois brut'),
    Resource('Minerai de fer', Color(0xFFCED4DA), 'Du minerai de fer brut'),
    Resource(
        'Minerai de cuivre', Color(0xFFD9480F), 'Du minerai de cuivre brut'),
    Resource('Charbon', Colors.black, 'Du minerai de charbon'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ressources',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(resources: resources),
        '/recettes': (context) => RecettesScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  final List<Resource> resources;

  HomeScreen({required this.resources});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 1;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ressources'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/recettes');
            },
            icon: Icon(Icons.article_outlined),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: widget.resources.length,
        itemBuilder: (BuildContext context, int index) {
          return ResourceWidget(resource: widget.resources[index]);
        },
      ),
    );
  }
}

class ResourceWidget extends StatefulWidget {
  final Resource resource;

  const ResourceWidget({Key? key, required this.resource}) : super(key: key);

  @override
  _ResourceWidgetState createState() => _ResourceWidgetState();
}

class _ResourceWidgetState extends State<ResourceWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: widget.resource.color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.resource.name,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              widget.resource.description,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Quantité récoltée : $counter',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: Text('Miner'),
            ),
          ],
        ),
      ),
    );
  }
}
