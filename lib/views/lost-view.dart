import 'package:flame/sprite.dart';
import 'package:langaw/langaw-game.dart';
import 'dart:ui';

class LostView {
  final LangawGame game;
  Rect rect;
  Sprite sprite;

  LostView(this.game) {
    rect = Rect.fromLTWH(
      game.tileSize, 
      (game.screenSize.height / 2) - (game.tileSize * 5), 
      game.tileSize * 7, 
      game.tileSize * 5);
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void update(double t) { }
}
