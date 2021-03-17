import 'package:flutter_template_app/json/author2_entity.dart';

author2EntityFromJson(Author2Entity data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	return data;
}

Map<String, dynamic> author2EntityToJson(Author2Entity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['title'] = entity.title;
	data['id'] = entity.id;
	return data;
}