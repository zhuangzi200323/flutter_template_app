import 'package:flutter_template_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_template_app/json/Author.dart';
import 'package:json_annotation/json_annotation.dart';


Author $AuthorFromJson(Map<String, dynamic> json) {
	Author author = Author();
	var name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		author.name = name;
	}
	var title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		author.title = title;
	}
	var id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		author.id = id;
	}
	return author;
}

Map<String, dynamic> $AuthorToJson(Author entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['title'] = entity.title;
	data['id'] = entity.id;
	return data;
}