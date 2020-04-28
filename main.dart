import 'screens/tabs_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Color.fromRGBO(255, 223, 0, 1),
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Comic Sans',
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                body2: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                title: TextStyle(
                    fontFamily: 'Comic Sans',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
//      home: CategoriesScreen(),
      initialRoute: '/',
      // default is '/'
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      onGenerateRoute: (settings) {
        return (settings.arguments);
        /*if (settings.name == '/meal-detail') {
          return ...;
        } else if (settings.name == '/something-else'){
          return ...;
        }
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());*/
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
