import 'dummy-data.dart';
import 'models/meal.dart';
import 'screens/filters_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

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
                  color: Colors.black,
                ),
              )),
//      home: CategoriesScreen(),
      initialRoute: '/',
      // default is '/'
      routes: {
        '/': (_) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (_) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (_) => MealDetailScreen(
              _toggleFavorite,
              _isMealFavorite,
            ),
        FiltersScreen.routeName: (_) => FiltersScreen(
              _filters,
              _setFilters,
            ),
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
