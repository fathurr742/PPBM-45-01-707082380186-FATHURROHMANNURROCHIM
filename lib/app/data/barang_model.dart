class BarangModel {
  final int? id;
  final String? imageBase64;
  final String? namaBarang;
  final String? description;
  final int? price;

  BarangModel(
      {required this.id,
      required this.imageBase64,
      required this.namaBarang,
      required this.description,
      required this.price});
}
