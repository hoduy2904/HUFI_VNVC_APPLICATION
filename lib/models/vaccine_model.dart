class VaccineModel {
  final int id;
  final int categoryId;
  final String images;
  final String name;
  final String prevention;
  final double price;
  final double priceOld;
  const VaccineModel(this.id, this.categoryId, this.images, this.name,
      this.prevention, this.price, this.priceOld);
}
