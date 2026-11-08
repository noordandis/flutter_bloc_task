part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}
class LoadProduct extends ProductEvent{}
class AddProduct extends ProductEvent{
  final String name;
  final String Price;

  AddProduct({required this.name, required this.Price});
}
class DeleteProduct extends ProductEvent{
  final String IdProduct;

  DeleteProduct({required this.IdProduct});

}
class SelectedProduct extends ProductEvent{
  final String IdProduct;

  SelectedProduct({required this.IdProduct});

}