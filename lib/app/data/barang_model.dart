class BarangModel {
  final dynamic image;
  final String? namaBarang;
  final String? description;
  final int? price;
  final String? category;
  final int? ratingCount;

  BarangModel({
    required this.image,
    required this.namaBarang,
    required this.description,
    required this.price,
    this.category,
    this.ratingCount,
  });
}
