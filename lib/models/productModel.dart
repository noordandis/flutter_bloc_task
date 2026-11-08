class Product{
  final String id;
  final String name;
  final String price;
  final bool isSelected;

  Product({required this.id, required this.name, required this.price, required this.isSelected});
  Product copyWith({
    String? id,
    String? name,
    String? price,
    bool? isSelected,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}