
class NotificationListModel {
  dynamic status;
  String? statusText;
  List<Data>? data;
  dynamic exeTime;

  NotificationListModel({this.status, this.statusText, this.data, this.exeTime});

  NotificationListModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    statusText = json["statusText"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    exeTime = json["exeTime"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["statusText"] = statusText;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["exeTime"] = exeTime;
    return _data;
  }
}

class Data {
  String? title;
  String? description;
  Data1? data;
  bool? isRead;
  String? id;
  String? fromId;
  String? toId;
  String? createdAt;
  String? updatedAt;
  dynamic v;

  Data({this.title, this.description, this.data, this.isRead, this.id, this.fromId, this.toId, this.createdAt, this.updatedAt, this.v});

  Data.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    description = json["description"];
    data = json["data"] == null ? null : Data1.fromJson(json["data"]);
    isRead = json["is_read"];
    id = json["_id"];
    fromId = json["from_id"];
    toId = json["to_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["description"] = description;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["is_read"] = isRead;
    _data["_id"] = id;
    _data["from_id"] = fromId;
    _data["to_id"] = toId;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}

class Data1 {
  String? type;

  Data1({this.type});

  Data1.fromJson(Map<String, dynamic> json) {
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["type"] = type;
    return _data;
  }
}