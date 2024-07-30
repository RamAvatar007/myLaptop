
class ProductDetailsModel {
  dynamic status;
  String? statusText;
  String? message;
  Data? data;
  dynamic exeTime;

  ProductDetailsModel({this.status, this.statusText, this.message, this.data, this.exeTime});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    statusText = json["statusText"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    exeTime = json["exeTime"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["statusText"] = statusText;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["exeTime"] = exeTime;
    return _data;
  }
}

class Data {
  dynamic vendorPrice;
  dynamic units;
  dynamic orderCount;
  dynamic avgRating;
  dynamic totalRating;
  List<Value>? value;
  dynamic discountPrice;
  dynamic discountPercentage;
  List<dynamic>? image;
  dynamic thumbnail;
  bool? isBuyNow;
  bool? isActive;
  bool? isSaved;
  bool? isDelete;
  bool? isOutOfStock;
  String? id;
  String? productId;
  ParentId? parentId;
  VendorId? vendorId;
  String? createdAt;
  String? updatedAt;
  dynamic v;

  Data({this.vendorPrice, this.units, this.orderCount, this.avgRating, this.totalRating, this.value, this.discountPrice, this.discountPercentage, this.image, this.thumbnail, this.isBuyNow, this.isActive, this.isSaved, this.isDelete, this.isOutOfStock, this.id, this.productId, this.parentId, this.vendorId, this.createdAt, this.updatedAt, this.v});

  Data.fromJson(Map<String, dynamic> json) {
    vendorPrice = json["vendor_price"];
    units = json["units"];
    orderCount = json["order_count"];
    avgRating = json["avg_rating"];
    totalRating = json["total_rating"];
    value = json["value"] == null ? null : (json["value"] as List).map((e) => Value.fromJson(e)).toList();
    discountPrice = json["discount_price"];
    discountPercentage = json["discount_percentage"];
    image = json["image"] ?? [];
    thumbnail = json["thumbnail"];
    isBuyNow = json["is_buy_now"];
    isActive = json["is_active"];
    isSaved = json["is_saved"];
    isDelete = json["is_delete"];
    isOutOfStock = json["is_out_of_stock"];
    id = json["_id"];
    productId = json["product_id"];
    parentId = json["parent_id"] == null ? null : ParentId.fromJson(json["parent_id"]);
    vendorId = json["vendor_id"] == null ? null : VendorId.fromJson(json["vendor_id"]);
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["vendor_price"] = vendorPrice;
    _data["units"] = units;
    _data["order_count"] = orderCount;
    _data["avg_rating"] = avgRating;
    _data["total_rating"] = totalRating;
    if(value != null) {
      _data["value"] = value?.map((e) => e.toJson()).toList();
    }
    _data["discount_price"] = discountPrice;
    _data["discount_percentage"] = discountPercentage;
    if(image != null) {
      _data["image"] = image;
    }
    _data["thumbnail"] = thumbnail;
    _data["is_buy_now"] = isBuyNow;
    _data["is_active"] = isActive;
    _data["is_saved"] = isSaved;
    _data["is_delete"] = isDelete;
    _data["is_out_of_stock"] = isOutOfStock;
    _data["_id"] = id;
    _data["product_id"] = productId;
    if(parentId != null) {
      _data["parent_id"] = parentId?.toJson();
    }
    if(vendorId != null) {
      _data["vendor_id"] = vendorId?.toJson();
    }
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}

class VendorId {
  String? name;
  String? id;

  VendorId({this.name, this.id});

  VendorId.fromJson(Map<String, dynamic> json) {
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

class ParentId {
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
  dynamic yearModel;
  String? arName;
  String? name;
  BrandId? brandId;
  CategoryId? categoryId;
  String? typeId;
  ModelId? modelId;
  String? variantId;
  String? createdAt;
  String? updatedAt;
  dynamic v;

  ParentId({this.image, this.thumbnail, this.description, this.partNumber, this.partType, this.sku, this.serialNumber, this.addedBy, this.price, this.minPrice, this.maxPrice, this.orderCount, this.parentId, this.vendorId, this.variantNumber, this.marketCategory, this.dealExpiryTime, this.yearModelStart, this.yearModelEnd, this.years, this.vatRate, this.vatAmount, this.tags, this.attribute, this.allAttribute, this.isFeatured, this.isActive, this.isDelete, this.isLive, this.id, this.yearModel, this.arName, this.name, this.brandId, this.categoryId, this.typeId, this.modelId, this.variantId, this.createdAt, this.updatedAt, this.v});

  ParentId.fromJson(Map<String, dynamic> json) {
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
    yearModel = json["year_model"];
    arName = json["ar_name"];
    name = json["name"];
    brandId = json["brand_id"] == null ? null : BrandId.fromJson(json["brand_id"]);
    categoryId = json["category_id"] == null ? null : CategoryId.fromJson(json["category_id"]);
    typeId = json["type_id"];
    modelId = json["model_id"] == null ? null : ModelId.fromJson(json["model_id"]);
    variantId = json["variant_id"];
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
    _data["year_model"] = yearModel;
    _data["ar_name"] = arName;
    _data["name"] = name;
    if(brandId != null) {
      _data["brand_id"] = brandId?.toJson();
    }
    if(categoryId != null) {
      _data["category_id"] = categoryId?.toJson();
    }
    _data["type_id"] = typeId;
    if(modelId != null) {
      _data["model_id"] = modelId?.toJson();
    }
    _data["variant_id"] = variantId;
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

class CategoryId {
  String? name;
  String? id;

  CategoryId({this.name, this.id});

  CategoryId.fromJson(Map<String, dynamic> json) {
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
  String? id;

  BrandId({this.name, this.id});

  BrandId.fromJson(Map<String, dynamic> json) {
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

class Value {
  String? name;
  String? value;
  String? type;

  Value({this.name, this.value, this.type});

  Value.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    value = json["value"];
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["value"] = value;
    _data["type"] = type;
    return _data;
  }
}