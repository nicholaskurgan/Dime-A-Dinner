import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? trunIntoURLEncoded(String? ingredient) {
  // i want this function to take the string, remove the point and what is behind, transform every - caracter into a + and, if there is part of the string that is between parentheses, get rid of that and the + sign before it
  if (ingredient == null) {
    return null;
  }

  // Remove the point and what is behind
  ingredient = ingredient.split('.').first;

  // Get rid of the part between parentheses and the + sign before it
  ingredient = ingredient.replaceAll(RegExp(r'[^a-zA-Z0-9]+'), '+');

  if (ingredient.endsWith('+')) {
    ingredient = ingredient.substring(0, ingredient.length - 1);
  }

  ingredient = ingredient + '+ingredient';

  return ingredient;
}

bool myRecipesSearchResult(
  String searchField,
  String recipeName,
) {
  // this function should check if the recipeName contains the searchField string, regardless of capital letters
  return recipeName.toLowerCase().contains(searchField.toLowerCase());
}

List<dynamic> removeDuplicateIngredients(List<dynamic> ingredients) {
  // Use a Map to remove duplicates based on 'id'
  final Map<int, Map<String, dynamic>> uniqueIngredients = {};

  for (var ingredient in ingredients) {
    uniqueIngredients[ingredient['id']] = {
      'id': ingredient['id'],
      'name': ingredient['name'],
      'image': ingredient['image'],
    };
  }

  // Convert the unique values back to a list
  return uniqueIngredients.values.toList();
}

String? buildAPIImage(String? ingredient) {
  // i want the function to build a string strating with" https://img.spoonacular.com/ingredients_100x100/ " and adding the ingredient at the end
  if (ingredient == null) {
    return null;
  }

  String baseUrl = 'https://img.spoonacular.com/ingredients_100x100/';
  return baseUrl + ingredient;
}

String? getPriceDetails(int? recipeId) {
  // replace "{id}" in the url string "https://api.spoonacular.com/recipes/{id}/priceBreakdownWidget.png?apiKey=aeeaf8647ec54115a9b7dc88c5f73d0f&mode=2" by the id passed in parameter turned into a string
  if (recipeId == null) {
    return null;
  }

  String url =
      'https://api.spoonacular.com/recipes/$recipeId/priceBreakdownWidget.png?apiKey=aeeaf8647ec54115a9b7dc88c5f73d0f&mode=2';
  return url;
}

String? getIngredientQuantity(
  String? ingredientName,
  List<dynamic>? metrics,
) {
  // modify the function to look through the JSON array
  if (ingredientName == null || metrics == null) {
    return null;
  }

  for (var metric in metrics) {
    if (metric['name'] == ingredientName) {
      return metric['amount']['us']['value'].toString();
    }
  }

  return null;
}

String? getIngredientUnit(
  String? ingredientName,
  List<dynamic>? metrics,
) {
  // modify the function to look through the JSON array
  if (ingredientName == null || metrics == null) {
    return null;
  }

  for (var metric in metrics) {
    if (metric['name'] == ingredientName) {
      return metric['amount']['us']['unit'].toString();
    }
  }

  return null;
}

bool? isRedicpeSaved(
  String? recipeName,
  List<String>? savedRecipesList,
) {
  // update the code to check through the saved recipes list which is a list of strings
  if (recipeName == null || savedRecipesList == null) {
    return null;
  }

  return savedRecipesList.contains(recipeName);
}

String? convertIntoDollar(String? price) {
  // convert price which is in cents into dollars
  if (price == null) {
    return null;
  }

  price = price.replaceAll(',', '.');

  double priceInCents = double.parse(price);
  double priceInDollars = priceInCents / 100.0;

  return priceInDollars.toStringAsFixed(2);
}
