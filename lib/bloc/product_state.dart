part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductLoded extends ProductState {
  final List<Product> product;
  ProductLoded(this.product);
}
final class ProductSelected extends ProductState {}
final class ProductEmpty extends ProductState {}