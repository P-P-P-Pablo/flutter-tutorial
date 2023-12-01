import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: "Salad",
        iconPath: "placeholder",
        boxColor: Colors.pink,
      ),
    );

    categories.add(
      CategoryModel(
        name: "Cake",
        iconPath: "placeholder",
        boxColor: Colors.orange,
      ),
    );

    categories.add(
      CategoryModel(
        name: "Pie",
        iconPath: "placeholder",
        boxColor: Colors.purple,
      ),
    );

    categories.add(
      CategoryModel(
        name: "Smoothie",
        iconPath: "placeholder",
        boxColor: Colors.amber,
      ),
    );

    categories.add(
      CategoryModel(
        name: "Cereals",
        iconPath: "placeholder",
        boxColor: Colors.brown,
      ),
    );

    return categories;
  }
}
