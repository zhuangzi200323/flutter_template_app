import 'package:flutter_template_app/generated/json/base/json_field.dart';
import 'package:flutter_template_app/generated/json/author2_entity.g.dart';


@JsonSerializable()
class Author2Entity {

	Author2Entity();

	factory Author2Entity.fromJson(Map<String, dynamic> json) => $Author2EntityFromJson(json);

	Map<String, dynamic> toJson() => $Author2EntityToJson(this);

	String? name;
	String? title;
	int? id;
}
