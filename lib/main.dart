import 'package:flutter/foundation.dart';
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
          Text(
            "Food Menu",
            style: TextStyle(
                fontFamily: "DeliciousHandrawn-Regular", fontSize: 30),
          )
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
        IconData iconData;
        EdgeInsets margin;

        switch (index) {
          case 0:
            category = 'Breakfast';
            iconData = Icons.breakfast_dining;
            margin = EdgeInsets.only(top: 20);
            break;
          case 1:
            category = 'Lunch';
            iconData = Icons.restaurant;
            margin = EdgeInsets.zero;
            break;
          case 2:
            category = 'Snack';
            iconData = Icons.local_dining;
            margin = EdgeInsets.zero;
            break;
          case 3:
            category = 'Dinner';
            iconData = Icons.local_dining;
            margin = EdgeInsets.zero;

            break;
          case 4:
            category = 'Beverages';
            iconData = Icons.local_cafe;
            margin = EdgeInsets.zero;
            break;
          default:
            category = '';
            iconData = Icons.error;
            margin = EdgeInsets.zero;
        }
        return ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                category,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontFamily: "DeliciousHandrawn-Regular",
                    letterSpacing: 3),
              )
            ],
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FoodItemsScreen(
                          category: category,
                        )));
          },
          contentPadding: margin,
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
        title: Text(
          widget.category,
          style:
              TextStyle(fontFamily: "DeliciousHandrawn-Regular", fontSize: 30),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(
              "https://i.pinimg.com/736x/96/7d/b6/967db683e191acc49969bfd49a0c1056.jpg",
            ),
            fit: BoxFit.cover,
          )),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.food_bank,
                      color: Colors.white,
                    ),
                    title: Text(
                      item.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "DeliciousHandrawn-Regular",
                          fontSize: 30),
                    ),
                    onTap: () {
                      setState(() {
                        showImageMap[item.name] =
                            !(showImageMap[item.name] ?? false);
                      });
                    },
                  ),
                  if (showImageMap[item.name] ?? false)
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Image.network(
                        item.imageUrl,
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.contain,
                      ),
                    )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
