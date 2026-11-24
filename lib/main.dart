import 'package:aula_913/pages/home_page.dart';
import 'package:aula_913/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FavoriteProvider())],
      child: MaterialApp(home: HomePage()),
    ),
  );
}
