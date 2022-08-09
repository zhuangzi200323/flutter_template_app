import 'package:flutter_template_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_template_app/json/author2_entity.dart';

Author2Entity $Author2EntityFromJson(Map<String, dynamic> json) {
	final Author2Entity author2Entity = Author2Entity();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		author2Entity.name = name;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		author2Entity.title = title;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		author2Entity.id = id;
	}
	return author2Entity;
}

Map<String, dynamic> $Author2EntityToJson(Author2Entity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['title'] = entity.title;
	data['id'] = entity.id;
	return data;
}