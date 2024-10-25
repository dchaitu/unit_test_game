
class Insect {
  final int damage;
  int health;
  final String name;
  final String imagePath;

  Insect({required this.imagePath, required this.damage, required this.health, this.name="Insect"});

  Insect copyWith({String? imagePath, int? health, int? damage, int? food}) {
    return Insect(
        imagePath: imagePath ?? this.imagePath,
        health: health ?? this.health,
        damage: damage ?? this.damage,
    );
  }


  void reduceHealth()
  {
    print("Ant Health $health");
    health -=1;
  }

}