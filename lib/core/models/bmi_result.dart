class BmiResult {
  int bmi;
  String status;

  String date = DateTime.now().toString();
  int height;
  int weight;
  int age;
  String id;

  BmiResult(
      {required this.bmi,
      required this.status,
      required this.height,
      required this.weight,
      required this.age,
      required this.id});

  factory BmiResult.fromJson(json) {
    return BmiResult(
        bmi: json['bmi'],
        status: json['status'],
        height: json['height'],
        weight: json['weight'],
        age: json['age'],
        id: json['id']);
  }

  factory BmiResult.toJson(BmiResult result) {
    return BmiResult(
        bmi: result.bmi,
        status: result.status,
        height: result.height,
        weight: result.weight,
        age: result.age,
        id: result.id);
  }
}
