import 'package:flutter/material.dart';

// 一个通用的InheritedWidget，保存任需要跨组件共享的状态
class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({required this.data, required Widget child}) : super(child: child);

  //共享状态使用泛型
  final T data;

//  static T of<T>(BuildContext context) {
//    final provider = context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>();
//    return provider;
//  }

  @override
  bool updateShouldNotify(InheritedProvider<T> old) {
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
    return true;
  }
}