// Each flow/logic has data. Data (models) come here

class FlowerModel {
  final int id;
  final String name;
  final int age;
  bool isWatered;
  final String imagePath;

  FlowerModel({
    required this.age,
    required this.id,
    this.isWatered = false,
    required this.name,
    required this.imagePath,
  });
}
