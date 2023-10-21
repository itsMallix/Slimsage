class Equipment {
  int? id;
  String? name;
  String? localizedName;
  String? image;

  Equipment({
    this.id,
    this.name,
    this.localizedName,
    this.image,
  });

  factory Equipment.fromjson(json) => Equipment(
        id: json['id'] as int?,
        name: json['name'] as String?,
        localizedName: json['localizedName'] as String?,
        image: json['image'] as String?,
      );

  toJson() => {
        'id': id,
        'name': name,
        'localizedName': localizedName,
        'image': image,
      };
}

class EquipmentsList {
  List<Equipment>? equipments;

  EquipmentsList({this.equipments});

  factory EquipmentsList.fromjson(List<dynamic> json) {
    return EquipmentsList(
      equipments: json.map((e) => Equipment.fromjson(e)).toList(),
    );
  }
}
