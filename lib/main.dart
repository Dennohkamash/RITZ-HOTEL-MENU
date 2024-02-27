import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class FoodItem {
  final String category;
  final String name;
  final String imageUrl;

  FoodItem(
      {required this.category, required this.name, required this.imageUrl});
}

List<FoodItem> breakfastItems = [
  FoodItem(
      category: 'Breakfast',
      name: 'Eggs and Bacon',
      imageUrl:
          "https://lowcarbinspirations.com/wp-content/uploads/2021/08/Classic-Bacon-and-Eggs-Recipe-3.jpg"),
  FoodItem(
      category: 'Breakfast',
      name: 'Pancakes',
      imageUrl:
          "https://lowcarbinspirations.com/wp-content/uploads/2021/08/Classic-Bacon-and-Eggs-Recipe-3.jpg"),
];

List<FoodItem> lunchItems = [
  FoodItem(
      category: 'Lunch',
      name: 'Club Sandwich',
      imageUrl:
          "https://lowcarbinspirations.com/wp-content/uploads/2021/08/Classic-Bacon-and-Eggs-Recipe-3.jpg"),
  FoodItem(
      category: 'Lunch',
      name: 'Caesar Salad',
      imageUrl:
          "https://lowcarbinspirations.com/wp-content/uploads/2021/08/Classic-Bacon-and-Eggs-Recipe-3.jpg"),
];

List<FoodItem> snackItems = [
  FoodItem(
      category: 'Snack',
      name: 'Fruit Salad',
      imageUrl:
          "https://lowcarbinspirations.com/wp-content/uploads/2021/08/Classic-Bacon-and-Eggs-Recipe-3.jpg"),
  FoodItem(
      category: 'Snack',
      name: 'Veggie Sticks',
      imageUrl:
          "https://lowcarbinspirations.com/wp-content/uploads/2021/08/Classic-Bacon-and-Eggs-Recipe-3.jpg"),
];

List<FoodItem> dinnerItems = [
  FoodItem(
      category: 'Dinner',
      name: 'Spaghetti Bolognese',
      imageUrl:
          "https://lowcarbinspirations.com/wp-content/uploads/2021/08/Classic-Bacon-and-Eggs-Recipe-3.jpg"),
  FoodItem(
      category: 'Dinner',
      name: 'Grilled Chicken',
      imageUrl:
          "https://lowcarbinspirations.com/wp-content/uploads/2021/08/Classic-Bacon-and-Eggs-Recipe-3.jpg"),
];

List<FoodItem> beverageItems = [
  FoodItem(
      category: 'Beverages',
      name: 'Coffee',
      imageUrl:
          "https://lowcarbinspirations.com/wp-content/uploads/2021/08/Classic-Bacon-and-Eggs-Recipe-3.jpg"),
  FoodItem(
      category: 'Beverages',
      name: 'Tea',
      imageUrl:
          "https://lowcarbinspirations.com/wp-content/uploads/2021/08/Classic-Bacon-and-Eggs-Recipe-3.jpg"),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Menu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.restaurant_menu),
          SizedBox(
            width: 10,
          ),
          Text("Food Menu")
        ],
      )),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://i.pinimg.com/736x/96/7d/b6/967db683e191acc49969bfd49a0c1056.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          FoodCategoriesList(),
        ],
      ),
    );
  }
}

class FoodCategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        String category;
        switch (index) {
          case 0:
            category = 'Breakfast';
            break;
          case 1:
            category = 'Lunch';
            break;
          case 2:
            category = 'Snack';
            break;
          case 3:
            category = 'Dinner';
            break;
          case 4:
            category = 'Beverages';
            break;
          default:
            category = '';
        }
        return ListTile(
          title: Text(
            category,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodItemsScreen(category: category),
              ),
            );
          },
        );
      },
    );
  }
}

class FoodItemsScreen extends StatefulWidget {
  final String category;

  FoodItemsScreen({required this.category});
  @override
  _FoodItemsScreenState createState() => _FoodItemsScreenState();
}

class _FoodItemsScreenState extends State<FoodItemsScreen> {
  Map<String?, bool> showImageMap = {};

  @override
  Widget build(BuildContext context) {
    List<FoodItem> items;
    switch (widget.category) {
      case 'Breakfast':
        items = breakfastItems;
        break;
      case 'Lunch':
        items = lunchItems;
        break;
      case 'Snack':
        items = snackItems;
        break;
      case 'Dinner':
        items = dinnerItems;
        break;
      case 'Beverages':
        items = beverageItems;
        break;
      default:
        items = [];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(item.name),
                  onTap: () {
                    setState(() {
                      showImageMap[item.name] =
                          !(showImageMap[item.name] ?? false);
                    });
                  },
                ),
                if (showImageMap[item.name] ?? false)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      item.imageUrl,
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.contain,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
