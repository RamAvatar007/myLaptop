class CategoryListModel {
  dynamic status;
  String? statusText;
  String? message;
  List<Data>? data;
  dynamic page;
  dynamic pageSize;
  dynamic total;
  dynamic exeTime;

  CategoryListModel({this.status, this.statusText, this.message, this.data, this.page, this.pageSize, this.total, this.exeTime});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    statusText = json["statusText"];
    message = json["message"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    page = json["page"];
    pageSize = json["pageSize"];
    total = json["total"];
    exeTime = json["exeTime"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["statusText"] = statusText;
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["page"] = page;
    _data["pageSize"] = pageSize;
    _data["total"] = total;
    _data["exeTime"] = exeTime;
    return _data;
  }
}

class Data {
  String? name;
  String? arName;
  dynamic order;
  String? image;
  String? addedBy;
  bool? isActive;
  bool? isDelete;
  String? id;
  String? createdAt;
  String? updatedAt;
  dynamic v;

  Data({this.name, this.arName, this.order, this.image, this.addedBy, this.isActive, this.isDelete, this.id, this.createdAt, this.updatedAt, this.v});

  Data.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    arName = json["ar_name"];
    order = json["order"];
    image = json["image"];
    addedBy = json["added_by"];
    isActive = json["is_active"];
    isDelete = json["is_delete"];
    id = json["_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["ar_name"] = arName;
    _data["order"] = order;
    _data["image"] = image;
    _data["added_by"] = addedBy;
    _data["is_active"] = isActive;
    _data["is_delete"] = isDelete;
    _data["_id"] = id;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}
