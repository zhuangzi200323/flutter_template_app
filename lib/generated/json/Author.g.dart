import 'package:flutter_template_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_template_app/json/Author.dart';
import 'package:json_annotation/json_annotation.dart';


Author $AuthorFromJson(Map<String, dynamic> json) {
	final Author author = Author();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		author.name = name;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		author.title = title;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
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