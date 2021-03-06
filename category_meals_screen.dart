import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  /*final String categoryId;
  final String categoryTitle;

  CategoryMealsScreen(
    this.categoryId,
    this.categoryTitle,
  );*/

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        textTheme: Theme.of(context).textTheme,
      ),
      body: Center(
        child: Text('The Recipes For The Category'),
      ),
    );
  }
}
