import 'package:json_annotation/json_annotation.dart';

//运行flutter packages pub run build_runner build 命令会产生Author.g.dart，目前使用FlutterJsonBeanFactory插件代替
part 'Author.g.dart';

@JsonSerializable() //注解
class Author {
  String? name;
  String? title;
  int? id;
  Author({this.name, this.title, this.id});

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson(Author instance) => _$AuthorToJson(instance);
}