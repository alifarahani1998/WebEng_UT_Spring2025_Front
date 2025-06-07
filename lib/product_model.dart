class ProductModel {
  List<Data>? data;
  String? lastEdit;
  String? lastEditor;

  ProductModel({this.data, this.lastEdit, this.lastEditor});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    lastEdit = json['last_edit'];
    lastEditor = json['last_editor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['last_edit'] = this.lastEdit;
    data['last_editor'] = this.lastEditor;
    return data;
  }
}

class Data {
  String? name;
  String? category;
  String? brand;
  String? color;
  int? id;

  Data({this.name, this.category, this.brand, this.color, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    category = json['category'];
    brand = json['brand'];
    color = json['color'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['category'] = this.category;
    data['brand'] = this.brand;
    data['color'] = this.color;
    data['id'] = this.id;
    return data;
  }
}
