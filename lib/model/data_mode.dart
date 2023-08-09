// To parse this JSON data, do
//
//     final DataModel = DataModelFromJson(jsonString);

class DataModel {
  String name;
  String description;
  int price;
  int stars;
  int people;
  String img;
  String location;

  DataModel({
    required this.name,
    required this.description,
    required this.price,
    required this.stars,
    required this.people,
    required this.img,
    required this.location,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stars: json["stars"],
        people: json["people"],
        img: json["img"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "price": price,
        "stars": stars,
        "people": people,
        "img": img,
        "location": location,
      };
}
