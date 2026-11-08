import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_task/bloc/product_bloc.dart';

import '../models/productModel.dart';

class CardWidget extends StatelessWidget{
  final Product product;

  const CardWidget({super.key,  required this.product});
  @override
  Widget build(BuildContext context) {
return Dismissible(key: Key(product.id),
    direction: DismissDirection.endToStart,
    onDismissed: (_){
  context.read<ProductBloc>().add(DeleteProduct(IdProduct: product.id));
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${product.name}deleted"),
    action: SnackBarAction(label: "Undo", onPressed: (){})

  ),);
    },
    background: Container(alignment: Alignment.centerRight,
    padding: EdgeInsets.only(right: 20),
    color: Colors.red,
    child: Icon(Icons.delete,color: Colors.white,),),
    child: InkWell(
      onTap: () {
        context.read<ProductBloc>().add(SelectedProduct(IdProduct: product.id));
      },
      child: Card(
          color: product.isSelected
              ? const Color.fromARGB(255, 168, 170, 207)
              : Colors.white,
        shadowColor: Color.fromARGB(255, 0, 4, 74),
          elevation: 1,
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text(
              product.name,
              style: const TextStyle(color:Color.fromARGB(255, 0, 4, 74),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              product.price,
              style: const TextStyle(color:Color.fromARGB(255, 0, 4, 74),
                fontSize: 18,
                // color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
             ]))),
    )

  );}
  
}