import 'package:flutter/material.dart';
import 'package:flutter_template_app/provider/ChangeNotifierProvider.dart';
import 'package:flutter_template_app/provider/CartModel.dart';
import 'package:flutter_template_app/provider/Consumer.dart';

class ProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("provider route"),
      ),
      body: Center(
        child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Builder(builder: (context) {
            return Column(
              children: <Widget>[
                Consumer<CartModel>(
                    builder: (context, cart)=> Text("总价: ${cart.totalPrice}"),
                ),
                Builder(builder: (context){
                  var cart=ChangeNotifierProvider.of<CartModel>(context);
                  return Text("总价: ${cart.totalPrice}");
                }),
                Builder(builder: (context){
                  print("RaisedButton build"); //在后面优化部分会用到
                  return RaisedButton(
                    child: Text("添加商品", style: TextStyle(color: Colors.blue),),
                    onPressed: () {
                      //给购物车中添加商品，添加后总价会更新
                      ChangeNotifierProvider.of<CartModel>(context, listen: false).add(Item(20.0, 1));
                    },
                  );
                }),
              ],
            );
          }),
        ),
      ),
    );
  }
}