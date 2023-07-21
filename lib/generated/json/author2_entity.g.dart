import 'package:flutter_template_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_template_app/json/author2_entity.dart';

Author2Entity $Author2EntityFromJson(Map<String, dynamic> json) {
	Author2Entity author2Entity = Author2Entity();
	var name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		author2Entity.name = name;
	}
	var title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		author2Entity.title = title;
	}
	var id = jsonConvert.convert<int>(json['id']);
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