import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_task/bloc/product_bloc.dart';

import '../models/productModel.dart';

class EmptyWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("no product ...\nadd some product ",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 0, 4, 74)),),);
  }

}