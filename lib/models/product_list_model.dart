
class ProductListModel {
  dynamic status;
  String? statusText;
  String? message;
  List<Data>? data;
  dynamic exeTime;

  ProductListModel({this.status, this.statusText, this.message, this.data, this.exeTime});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    statusText = json["statusText"];
    message = json["message"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    exeTime = json["exeTime"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["statusText"] = statusText;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["exeTime"] = exeTime;
    return _data;
  }
}

class Data {
  List<dynamic>? image;
  String? thumbnail;
  String? description;
  dynamic partNumber;
  dynamic partType;
  String? sku;
  String? serialNumber;
  String? addedBy;
  dynamic price;
  dynamic minPrice;
  dynamic maxPrice;
  dynamic orderCount;
  dynamic parentId;
  dynamic vendorId;
  dynamic variantNumber;
  String? marketCategory;
  dynamic dealExpiryTime;
  dynamic yearModelStart;
  dynamic yearModelEnd;
  List<int>? years;
  dynamic vatRate;
  dynamic vatAmount;
  List<String>? tags;
  List<Attribute>? attribute;
  List<AllAttribute>? allAttribute;
  bool? isFeatured;
  bool? isActive;
  bool? isDelete;
  bool? isLive;
  String? id;
  String? arName;
  String? name;
  BrandId? brandId;
  String? categoryId;
  ModelId? modelId;
  String? createdAt;
  String? updatedAt;
  dynamic v;

  Data({this.image, this.thumbnail, this.description, this.partNumber, this.partType, this.sku, this.serialNumber, this.addedBy, this.price, this.minPrice, this.maxPrice, this.orderCount, this.parentId, this.vendorId, this.variantNumber, this.marketCategory, this.dealExpiryTime, this.yearModelStart, this.yearModelEnd, this.years, this.vatRate, this.vatAmount, this.tags, this.attribute, this.allAttribute, this.isFeatured, this.isActive, this.isDelete, this.isLive, this.id, this.arName, this.name, this.brandId, this.categoryId, this.modelId, this.createdAt, this.updatedAt, this.v});

  Data.fromJson(Map<String, dynamic> json) {
    image = json["image"] == null ? null : List<dynamic>.from(json["image"]);
    thumbnail = json["thumbnail"];
    description = json["description"];
    partNumber = json["part_number"];
    partType = json["part_type"];
    sku = json["sku"];
    serialNumber = json["serial_number"];
    addedBy = json["added_by"];
    price = json["price"];
    minPrice = json["min_price"];
    maxPrice = json["max_price"];
    orderCount = json["order_count"];
    parentId = json["parent_id"];
    vendorId = json["vendor_id"];
    variantNumber = json["variant_number"];
    marketCategory = json["market_category"];
    dealExpiryTime = json["deal_expiry_time"];
    yearModelStart = json["year_model_start"];
    yearModelEnd = json["year_model_end"];
    years = json["years"] == null ? null : List<int>.from(json["years"]);
    vatRate = json["vat_rate"];
    vatAmount = json["vat_amount"];
    tags = json["tags"] == null ? null : List<String>.from(json["tags"]);
    attribute = json["attribute"] == null ? null : (json["attribute"] as List).map((e) => Attribute.fromJson(e)).toList();
    allAttribute = json["all_attribute"] == null ? null : (json["all_attribute"] as List).map((e) => AllAttribute.fromJson(e)).toList();
    isFeatured = json["is_featured"];
    isActive = json["is_active"];
    isDelete = json["is_delete"];
    isLive = json["is_live"];
    id = json["_id"];
    arName = json["ar_name"];
    name = json["name"];
    brandId = json["brand_id"] == null ? null : BrandId.fromJson(json["brand_id"]);
    categoryId = json["category_id"];
    modelId = json["model_id"] == null ? null : ModelId.fromJson(json["model_id"]);
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(image != null) {
      _data["image"] = image;
    }
    _data["thumbnail"] = thumbnail;
    _data["description"] = description;
    _data["part_number"] = partNumber;
    _data["part_type"] = partType;
    _data["sku"] = sku;
    _data["serial_number"] = serialNumber;
    _data["added_by"] = addedBy;
    _data["price"] = price;
    _data["min_price"] = minPrice;
    _data["max_price"] = maxPrice;
    _data["order_count"] = orderCount;
    _data["parent_id"] = parentId;
    _data["vendor_id"] = vendorId;
    _data["variant_number"] = variantNumber;
    _data["market_category"] = marketCategory;
    _data["deal_expiry_time"] = dealExpiryTime;
    _data["year_model_start"] = yearModelStart;
    _data["year_model_end"] = yearModelEnd;
    if(years != null) {
      _data["years"] = years;
    }
    _data["vat_rate"] = vatRate;
    _data["vat_amount"] = vatAmount;
    if(tags != null) {
      _data["tags"] = tags;
    }
    if(attribute != null) {
      _data["attribute"] = attribute?.map((e) => e.toJson()).toList();
    }
    if(allAttribute != null) {
      _data["all_attribute"] = allAttribute?.map((e) => e.toJson()).toList();
    }
    _data["is_featured"] = isFeatured;
    _data["is_active"] = isActive;
    _data["is_delete"] = isDelete;
    _data["is_live"] = isLive;
    _data["_id"] = id;
    _data["ar_name"] = arName;
    _data["name"] = name;
    if(brandId != null) {
      _data["brand_id"] = brandId?.toJson();
    }
    _data["category_id"] = categoryId;
    if(modelId != null) {
      _data["model_id"] = modelId?.toJson();
    }
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}

class ModelId {
  String? name;
  String? id;

  ModelId({this.name, this.id});

  ModelId.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    id = json["_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["_id"] = id;
    return _data;
  }
}

class BrandId {
  String? name;
  String? image;
  String? id;

  BrandId({this.name, this.image, this.id});

  BrandId.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    image = json["image"];
    id = json["_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["image"] = image;
    _data["_id"] = id;
    return _data;
  }
}

class AllAttribute {
  String? name;
  String? type;
  String? value;

  AllAttribute({this.name, this.type, this.value});

  AllAttribute.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    type = json["type"];
    value = json["value"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["type"] = type;
    _data["value"] = value;
    return _data;
  }
}

class Attribute {
  String? name;
  String? type;
  String? value;

  Attribute({this.name, this.type, this.value});

  Attribute.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    type = json["type"];
    value = json["value"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["type"] = type;
    _data["value"] = value;
    return _data;
  }
}