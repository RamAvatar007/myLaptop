class AddressListModel {
  dynamic status;
  String? statusText;
  String? message;
  List<AddressModel>? data;
  dynamic page;
  dynamic pageSize;
  dynamic total;
  dynamic exeTime;

  AddressListModel(
      {this.status,
      this.statusText,
      this.message,
      this.data,
      this.page,
      this.pageSize,
      this.total,
      this.exeTime});

  AddressListModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    statusText = json["statusText"];
    message = json["message"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => AddressModel.fromJson(e)).toList();
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

class AddressModel {
  String? name;
  String? houseName;
  String? street;
  String? city;
  dynamic area;
  String? state;
  dynamic province;
  String? location;
  dynamic latitude;
  dynamic longitude;
  String? country;
  dynamic countryCode;
  dynamic mobileNumber;
  String? postalCode;
  bool? isActive;
  bool? isDefault;
  String? id;
  String? userId;
  String? createdAt;
  String? updatedAt;
  dynamic v;

  AddressModel(
      {this.name,
      this.houseName,
      this.street,
      this.city,
      this.area,
      this.state,
      this.province,
      this.location,
      this.latitude,
      this.longitude,
      this.country,
      this.countryCode,
      this.mobileNumber,
      this.postalCode,
      this.isActive,
      this.isDefault,
      this.id,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.v});

  AddressModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    houseName = json["house_name"];
    street = json["street"];
    city = json["city"];
    area = json["area"];
    state = json["state"];
    province = json["province"];
    location = json["location"];
    latitude = json["latitude"];
    longitude = json["longitude"];
    country = json["country"];
    countryCode = json["country_code"];
    mobileNumber = json["mobile_number"];
    postalCode = json["postal_code"];
    isActive = json["is_active"];
    isDefault = json["is_default"];
    id = json["_id"];
    userId = json["user_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["house_name"] = houseName;
    _data["street"] = street;
    _data["city"] = city;
    _data["area"] = area;
    _data["state"] = state;
    _data["province"] = province;
    _data["location"] = location;
    _data["latitude"] = latitude;
    _data["longitude"] = longitude;
    _data["country"] = country;
    _data["country_code"] = countryCode;
    _data["mobile_number"] = mobileNumber;
    _data["postal_code"] = postalCode;
    _data["is_active"] = isActive;
    _data["is_default"] = isDefault;
    _data["_id"] = id;
    _data["user_id"] = userId;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}
