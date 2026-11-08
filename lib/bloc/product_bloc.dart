import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_task/models/productModel.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  List <Product> _product=[];
  final _uuid=const Uuid();
  ProductBloc() : super(ProductInitial()) {
 on<LoadProduct>(_onLoadProduct);
 on<AddProduct>(_onAddProduct);
 on<SelectedProduct>(_onSelectedProduct);
 on<DeleteProduct>(_onDeleteProduct);

  }
  void _onLoadProduct (LoadProduct event,Emitter<ProductState>emit){
    _product=[Product(id: _uuid.v4(),name: "egg",price: "1000", isSelected: false),
      Product(id: _uuid.v4(),name: "bread",price: "2000", isSelected: false),
      Product(id: _uuid.v4(),name: "cheese",price: "5500", isSelected: false),
    ];
    emit(ProductLoded(List.from(_product)));
  }
  void _onAddProduct (AddProduct event,Emitter<ProductState>emit){
final newProduct=Product(id: _uuid.v4(),name: event.name,price: event.Price, isSelected: false);
_product.insert(0, newProduct);
emit(ProductLoded(List.from(_product)));
  }
  void _onDeleteProduct (DeleteProduct event,Emitter<ProductState>emit){
_product.removeWhere((Product)=>Product.id==event.IdProduct);
if(_product.isEmpty){
  emit(ProductEmpty());}
  else{
    emit(ProductLoded(List.from(_product)));
}
}
void _onSelectedProduct(SelectedProduct event,Emitter<ProductState>emit){

  final index = _product.indexWhere((product) => product.id == event.IdProduct);

  if (index != -1) {
    _product[index] = _product[index].copyWith(
      isSelected: !_product[index].isSelected,
    );

    emit(ProductLoded(List.from(_product)));
  }
}
  }

