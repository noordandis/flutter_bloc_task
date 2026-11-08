import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_task/bloc/product_bloc.dart';

import '../models/productModel.dart';
import '../widget/cardWidget.dart';
import '../widget/emptyWidget.dart';

class Homescreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Homescreen();
}

class _Homescreen extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(LoadProduct());
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Products",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),
      backgroundColor: Color.fromARGB(255, 0, 4, 74)),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if(state is ProductInitial)
              {
                return const Center(child: CircularProgressIndicator(),);
              }else if(state is ProductEmpty){
              return EmptyWidget();
            }else if(state is ProductLoded){
            return ListView.builder(itemCount: state.product.length,
                itemBuilder: (context, index) {
 return CardWidget(product:state.product[index]);
            });
          }return const SizedBox();

          }
        ),
floatingActionButton: FloatingActionButton(backgroundColor: Color.fromARGB(255, 0, 4, 74),
  onPressed: ()=>_showInputDialog(context),child: Icon(Icons.add,color: Colors.white,),),
    );
  }
  void _showInputDialog(BuildContext context) {

    final TextEditingController nameController = TextEditingController();
    final TextEditingController priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            backgroundColor: Color.fromARGB(255, 0, 4, 74),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: const Text('add product',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: nameController,
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'product name',
                      labelStyle: TextStyle(color: Colors.white),
                      alignLabelWithHint: true,
                      suffixIcon: Icon(Icons.shopping_cart, color: Colors.white),


                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.5),
                      ),


                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  TextField(
                    controller: priceController,
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(   enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.5),
                    ),
                      focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                      labelText: 'price',
                      labelStyle: TextStyle(color: Colors.white,),
                      iconColor: Colors.white,
                      suffixIcon: Icon(Icons.money_sharp,color: Colors.white,),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            actions: [

              // TextButton(
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //   },
              //   child: const Text('cancle', style: TextStyle(color: Colors.red)),
              // ),
SizedBox(width: 80,),
              ElevatedButton(

                onPressed: () {


                  if (nameController.text.isNotEmpty && priceController.text.isNotEmpty) {

context.read<ProductBloc>().add(AddProduct(name: nameController.text, Price: priceController.text));
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('add',style: TextStyle(color: Colors.indigo),),
              ),
            ],
          ),
        );
      },
    );
}
}