class BarangModel {
  final dynamic image;
  final String? namaBarang;
  final String? description;
  final int? price;
  final String? category;
  final String? documentId;
  final double? rating;

  BarangModel(
      {this.image,
      required this.namaBarang,
      required this.description,
      required this.price,
      this.category,
      this.documentId,
      this.rating});
}
