import 'package:langaw/langaw-game.dart';
import 'package:langaw/components/fly.dart';

class FlYSpawner {
  final LangawGame game;
  final int maxSpawnInterval = 3000;
  final int minSpawnInterval = 250;
  final int intervalChange = 3;
  final int maxFliesOnScreen = 7;

  int currentInterval;
  int nextSpawn;

  FlYSpawner(this.game) {
    start();
    game.spawFly();
  }

  void start(){
    killAll();
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }

  void killAll(){
    game.flies.forEach((Fly fly) =>  fly.isDead = true);
  }

  void update(double t) {
    int nowTimestamp = DateTime.now().millisecondsSinceEpoch;
    
    int livingFlies = 0;
    game.flies.forEach((Fly fly){
      if(!fly.isDead) livingFlies += 1;
    });
    if(nowTimestamp > nextSpawn && livingFlies < maxFliesOnScreen){
      game.spawFly();
      if(currentInterval > minSpawnInterval){
        currentInterval -= intervalChange;
        currentInterval -= (currentInterval * .02).toInt();
      }
      nextSpawn = nowTimestamp + currentInterval;
    }
  }
}