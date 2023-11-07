class CheckoutModel {
  final int? id;
  final String? namaBarang;
  final String? color;
  final int? quantity;
  final int? total_harga;

  CheckoutModel(
      {required this.id,
      required this.quantity,
      required this.namaBarang,
      required this.color,
      required this.total_harga});
}
