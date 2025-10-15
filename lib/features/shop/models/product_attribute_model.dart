class ProductAttributeModel {
  ProductAttributeModel({this.name, this.values});

  String? name;
  final List<String>? values;

  // Json Format
  toJson() {
    return {'Name': name, 'Values': values};
  }

  // Map Json Oriented Data From Firebase to Model.
  factory ProductAttributeModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductAttributeModel();

    return ProductAttributeModel(
      name: data['Name'] ?? '',
      values: List<String>.from(data['Values']),
    );
  }
}
