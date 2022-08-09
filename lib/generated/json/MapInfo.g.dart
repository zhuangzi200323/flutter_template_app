import 'package:flutter_template_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_template_app/json/MapInfo.dart';
import 'dart:ui';


MapInfo $MapInfoFromJson(Map<String, dynamic> json) {
	final MapInfo mapInfo = MapInfo();
	final DataBean? data = jsonConvert.convert<DataBean>(json['data']);
	if (data != null) {
		mapInfo.data = data;
	}
	final String? module = jsonConvert.convert<String>(json['module']);
	if (module != null) {
		mapInfo.module = module;
	}
	final int? result_code = jsonConvert.convert<int>(json['result_code']);
	if (result_code != null) {
		mapInfo.result_code = result_code;
	}
	final String? result_msg = jsonConvert.convert<String>(json['result_msg']);
	if (result_msg != null) {
		mapInfo.result_msg = result_msg;
	}
	final String? result_serial_number = jsonConvert.convert<String>(json['result_serial_number']);
	if (result_serial_number != null) {
		mapInfo.result_serial_number = result_serial_number;
	}
	final String? result_stamp = jsonConvert.convert<String>(json['result_stamp']);
	if (result_stamp != null) {
		mapInfo.result_stamp = result_stamp;
	}
	return mapInfo;
}

Map<String, dynamic> $MapInfoToJson(MapInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	data['module'] = entity.module;
	data['result_code'] = entity.result_code;
	data['result_msg'] = entity.result_msg;
	data['result_serial_number'] = entity.result_serial_number;
	data['result_stamp'] = entity.result_stamp;
	return data;
}

DataBean $DataBeanFromJson(Map<String, dynamic> json) {
	final DataBean dataBean = DataBean();
	final List<ProjectsBean>? projects = jsonConvert.convertListNotNull<ProjectsBean>(json['projects']);
	if (projects != null) {
		dataBean.projects = projects;
	}
	return dataBean;
}

Map<String, dynamic> $DataBeanToJson(DataBean entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['projects'] =  entity.projects?.map((v) => v.toJson()).toList();
	return data;
}

ProjectsBean $ProjectsBeanFromJson(Map<String, dynamic> json) {
	final ProjectsBean projectsBean = ProjectsBean();
	final String? map_data = jsonConvert.convert<String>(json['map_data']);
	if (map_data != null) {
		projectsBean.map_data = map_data;
	}
	final MapInfoBeanX? map_info = jsonConvert.convert<MapInfoBeanX>(json['map_info']);
	if (map_info != null) {
		projectsBean.map_info = map_info;
	}
	final ObstaclesBeanX? obstacles = jsonConvert.convert<ObstaclesBeanX>(json['obstacles']);
	if (obstacles != null) {
		projectsBean.obstacles = obstacles;
	}
	final PositionsBeanX? positions = jsonConvert.convert<PositionsBeanX>(json['positions']);
	if (positions != null) {
		projectsBean.positions = positions;
	}
	final ProjectInfoBean? project_info = jsonConvert.convert<ProjectInfoBean>(json['project_info']);
	if (project_info != null) {
		projectsBean.project_info = project_info;
	}
	final ScriptsBeanX? scripts = jsonConvert.convert<ScriptsBeanX>(json['scripts']);
	if (scripts != null) {
		projectsBean.scripts = scripts;
	}
	return projectsBean;
}

Map<String, dynamic> $ProjectsBeanToJson(ProjectsBean entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['map_data'] = entity.map_data;
	data['map_info'] = entity.map_info?.toJson();
	data['obstacles'] = entity.obstacles?.toJson();
	data['positions'] = entity.positions?.toJson();
	data['project_info'] = entity.project_info?.toJson();
	data['scripts'] = entity.scripts?.toJson();
	return data;
}

MapInfoBeanX $MapInfoBeanXFromJson(Map<String, dynamic> json) {
	final MapInfoBeanX mapInfoBeanX = MapInfoBeanX();
	final MapInfoBean? map_info = jsonConvert.convert<MapInfoBean>(json['map_info']);
	if (map_info != null) {
		mapInfoBeanX.map_info = map_info;
	}
	final String? pgm_name = jsonConvert.convert<String>(json['pgm_name']);
	if (pgm_name != null) {
		mapInfoBeanX.pgm_name = pgm_name;
	}
	final String? png_name = jsonConvert.convert<String>(json['png_name']);
	if (png_name != null) {
		mapInfoBeanX.png_name = png_name;
	}
	return mapInfoBeanX;
}

Map<String, dynamic> $MapInfoBeanXToJson(MapInfoBeanX entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['map_info'] = entity.map_info?.toJson();
	data['pgm_name'] = entity.pgm_name;
	data['png_name'] = entity.png_name;
	return data;
}

MapInfoBean $MapInfoBeanFromJson(Map<String, dynamic> json) {
	final MapInfoBean mapInfoBean = MapInfoBean();
	final int? height = jsonConvert.convert<int>(json['height']);
	if (height != null) {
		mapInfoBean.height = height;
	}
	final int? origin_theta = jsonConvert.convert<int>(json['origin_theta']);
	if (origin_theta != null) {
		mapInfoBean.origin_theta = origin_theta;
	}
	final double? origin_x = jsonConvert.convert<double>(json['origin_x']);
	if (origin_x != null) {
		mapInfoBean.origin_x = origin_x;
	}
	final double? origin_y = jsonConvert.convert<double>(json['origin_y']);
	if (origin_y != null) {
		mapInfoBean.origin_y = origin_y;
	}
	final double? resolution = jsonConvert.convert<double>(json['resolution']);
	if (resolution != null) {
		mapInfoBean.resolution = resolution;
	}
	final int? width = jsonConvert.convert<int>(json['width']);
	if (width != null) {
		mapInfoBean.width = width;
	}
	return mapInfoBean;
}

Map<String, dynamic> $MapInfoBeanToJson(MapInfoBean entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['height'] = entity.height;
	data['origin_theta'] = entity.origin_theta;
	data['origin_x'] = entity.origin_x;
	data['origin_y'] = entity.origin_y;
	data['resolution'] = entity.resolution;
	data['width'] = entity.width;
	return data;
}

ObstaclesBeanX $ObstaclesBeanXFromJson(Map<String, dynamic> json) {
	final ObstaclesBeanX obstaclesBeanX = ObstaclesBeanX();
	final ObstaclesBean? obstacles = jsonConvert.convert<ObstaclesBean>(json['obstacles']);
	if (obstacles != null) {
		obstaclesBeanX.obstacles = obstacles;
	}
	return obstaclesBeanX;
}

Map<String, dynamic> $ObstaclesBeanXToJson(ObstaclesBeanX entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['obstacles'] = entity.obstacles?.toJson();
	return data;
}

ObstaclesBean $ObstaclesBeanFromJson(Map<String, dynamic> json) {
	final ObstaclesBean obstaclesBean = ObstaclesBean();
	final List<int>? circles = jsonConvert.convertListNotNull<int>(json['circles']);
	if (circles != null) {
		obstaclesBean.circles = circles;
	}
	final List<int>? polygons = jsonConvert.convertListNotNull<int>(json['polygons']);
	if (polygons != null) {
		obstaclesBean.polygons = polygons;
	}
	final List<int>? polylines = jsonConvert.convertListNotNull<int>(json['polylines']);
	if (polylines != null) {
		obstaclesBean.polylines = polylines;
	}
	final List<int>? rectangles = jsonConvert.convertListNotNull<int>(json['rectangles']);
	if (rectangles != null) {
		obstaclesBean.rectangles = rectangles;
	}
	return obstaclesBean;
}

Map<String, dynamic> $ObstaclesBeanToJson(ObstaclesBean entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['circles'] =  entity.circles;
	data['polygons'] =  entity.polygons;
	data['polylines'] =  entity.polylines;
	data['rectangles'] =  entity.rectangles;
	return data;
}

PositionsBeanX $PositionsBeanXFromJson(Map<String, dynamic> json) {
	final PositionsBeanX positionsBeanX = PositionsBeanX();
	final List<PositionsBean>? positions = jsonConvert.convertListNotNull<PositionsBean>(json['positions']);
	if (positions != null) {
		positionsBeanX.positions = positions;
	}
	return positionsBeanX;
}

Map<String, dynamic> $PositionsBeanXToJson(PositionsBeanX entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['positions'] =  entity.positions?.map((v) => v.toJson()).toList();
	return data;
}

PositionsBean $PositionsBeanFromJson(Map<String, dynamic> json) {
	final PositionsBean positionsBean = PositionsBean();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		positionsBean.name = name;
	}
	final PositionBean? position = jsonConvert.convert<PositionBean>(json['position']);
	if (position != null) {
		positionsBean.position = position;
	}
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		positionsBean.type = type;
	}
	return positionsBean;
}

Map<String, dynamic> $PositionsBeanToJson(PositionsBean entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['position'] = entity.position?.toJson();
	data['type'] = entity.type;
	return data;
}

PositionBean $PositionBeanFromJson(Map<String, dynamic> json) {
	final PositionBean positionBean = PositionBean();
	final double? theta = jsonConvert.convert<double>(json['theta']);
	if (theta != null) {
		positionBean.theta = theta;
	}
	final double? world_x = jsonConvert.convert<double>(json['world_x']);
	if (world_x != null) {
		positionBean.world_x = world_x;
	}
	final double? world_y = jsonConvert.convert<double>(json['world_y']);
	if (world_y != null) {
		positionBean.world_y = world_y;
	}
	final double? show_x = jsonConvert.convert<double>(json['show_x']);
	if (show_x != null) {
		positionBean.show_x = show_x;
	}
	final double? show_y = jsonConvert.convert<double>(json['show_y']);
	if (show_y != null) {
		positionBean.show_y = show_y;
	}
	final double? rect_left = jsonConvert.convert<double>(json['rect_left']);
	if (rect_left != null) {
		positionBean.rect_left = rect_left;
	}
	final double? rect_top = jsonConvert.convert<double>(json['rect_top']);
	if (rect_top != null) {
		positionBean.rect_top = rect_top;
	}
	final double? rect_width = jsonConvert.convert<double>(json['rect_width']);
	if (rect_width != null) {
		positionBean.rect_width = rect_width;
	}
	final double? rect_height = jsonConvert.convert<double>(json['rect_height']);
	if (rect_height != null) {
		positionBean.rect_height = rect_height;
	}
	final bool? isSelect = jsonConvert.convert<bool>(json['isSelect']);
	if (isSelect != null) {
		positionBean.isSelect = isSelect;
	}
	return positionBean;
}

Map<String, dynamic> $PositionBeanToJson(PositionBean entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['theta'] = entity.theta;
	data['world_x'] = entity.world_x;
	data['world_y'] = entity.world_y;
	data['show_x'] = entity.show_x;
	data['show_y'] = entity.show_y;
	data['rect_left'] = entity.rect_left;
	data['rect_top'] = entity.rect_top;
	data['rect_width'] = entity.rect_width;
	data['rect_height'] = entity.rect_height;
	data['isSelect'] = entity.isSelect;
	return data;
}

ProjectInfoBean $ProjectInfoBeanFromJson(Map<String, dynamic> json) {
	final ProjectInfoBean projectInfoBean = ProjectInfoBean();
	final String? map_name = jsonConvert.convert<String>(json['map_name']);
	if (map_name != null) {
		projectInfoBean.map_name = map_name;
	}
	final String? obstacle_name = jsonConvert.convert<String>(json['obstacle_name']);
	if (obstacle_name != null) {
		projectInfoBean.obstacle_name = obstacle_name;
	}
	final String? positions_name = jsonConvert.convert<String>(json['positions_name']);
	if (positions_name != null) {
		projectInfoBean.positions_name = positions_name;
	}
	final String? project_id = jsonConvert.convert<String>(json['project_id']);
	if (project_id != null) {
		projectInfoBean.project_id = project_id;
	}
	final String? project_name = jsonConvert.convert<String>(json['project_name']);
	if (project_name != null) {
		projectInfoBean.project_name = project_name;
	}
	final String? project_stamp = jsonConvert.convert<String>(json['project_stamp']);
	if (project_stamp != null) {
		projectInfoBean.project_stamp = project_stamp;
	}
	return projectInfoBean;
}

Map<String, dynamic> $ProjectInfoBeanToJson(ProjectInfoBean entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['map_name'] = entity.map_name;
	data['obstacle_name'] = entity.obstacle_name;
	data['positions_name'] = entity.positions_name;
	data['project_id'] = entity.project_id;
	data['project_name'] = entity.project_name;
	data['project_stamp'] = entity.project_stamp;
	return data;
}

ScriptsBeanX $ScriptsBeanXFromJson(Map<String, dynamic> json) {
	final ScriptsBeanX scriptsBeanX = ScriptsBeanX();
	final List<ScriptsBean>? scripts = jsonConvert.convertListNotNull<ScriptsBean>(json['scripts']);
	if (scripts != null) {
		scriptsBeanX.scripts = scripts;
	}
	return scriptsBeanX;
}

Map<String, dynamic> $ScriptsBeanXToJson(ScriptsBeanX entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['scripts'] =  entity.scripts?.map((v) => v.toJson()).toList();
	return data;
}

ScriptsBean $ScriptsBeanFromJson(Map<String, dynamic> json) {
	final ScriptsBean scriptsBean = ScriptsBean();
	final String? data = jsonConvert.convert<String>(json['data']);
	if (data != null) {
		scriptsBean.data = data;
	}
	final String? script_name = jsonConvert.convert<String>(json['script_name']);
	if (script_name != null) {
		scriptsBean.script_name = script_name;
	}
	return scriptsBean;
}

Map<String, dynamic> $ScriptsBeanToJson(ScriptsBean entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data;
	data['script_name'] = entity.script_name;
	return data;
}