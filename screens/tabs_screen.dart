import 'package:flappy_meals/screens/favorites_screen.dart';

import '../screens/categories_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  TextStyle get titleTheme {
    return Theme.of(context).textTheme.title;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
//      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Meals',
            style: titleTheme,
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.category,
                  color: Colors.black,
                  size: 30,
                ),
                child: Text(
                  'Categories',
                  style: Theme.of(context).textTheme.title.copyWith(
                        fontSize: 20,
                      ),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                  color: Colors.black,
                  size: 30,
                ),
                child: Text(
                  'Favorites',
                  style: Theme.of(context).textTheme.title.copyWith(
                        fontSize: 20,
                      ),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesScreen(),
            FavoritesScreen(),
          ],
        ),
      ),
    );
  }
}
