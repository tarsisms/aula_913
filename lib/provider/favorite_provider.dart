import 'package:aula_913/domain/Propriedade.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Propriedade> favoritos = [];

  addFavorite(Propriedade propriedade) {
    favoritos.add(propriedade);
    notifyListeners();
  }

  isFavorite(Propriedade propriedade) {
    for (var fav in favoritos) {
      if (fav.id == propriedade.id) {
        return true;
      }
    }

    return false;
  }
}
