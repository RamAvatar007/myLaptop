
class VendorListModel {
  dynamic status;
  String? statusText;
  String? message;
  List<Data>? data;
  dynamic total;
  dynamic exeTime;

  VendorListModel({this.status, this.statusText, this.message, this.data, this.total, this.exeTime});

  VendorListModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    statusText = json["statusText"];
    message = json["message"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    total = json["total"];
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
    _data["total"] = total;
    _data["exeTime"] = exeTime;
    return _data;
  }
}

class Data {
  String? id;
  dynamic vendorPrice;
  dynamic units;
  dynamic orderCount;
  dynamic avgRating;
  dynamic totalRating;
  List<Value>? value;
  dynamic discountPrice;
  dynamic discountPercentage;
  List<String>? image;
  String? thumbnail;
  bool? isBuyNow;
  bool? isActive;
  bool? isSaved;
  bool? isDelete;
  bool? isOutOfStock;
  String? productId;
  ParentId? parentId;
  VendorId? vendorId;
  String? createdAt;
  String? updatedAt;
  dynamic v;

  Data({this.id, this.vendorPrice, this.units, this.orderCount, this.avgRating, this.totalRating, this.value, this.discountPrice, this.discountPercentage, this.image, this.thumbnail, this.isBuyNow, this.isActive, this.isSaved, this.isDelete, this.isOutOfStock, this.productId, this.parentId, this.vendorId, this.createdAt, this.updatedAt, this.v});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    vendorPrice = json["vendor_price"];
    units = json["units"];
    orderCount = json["order_count"];
    avgRating = json["avg_rating"];
    totalRating = json["total_rating"];
    value = json["value"] == null ? null : (json["value"] as List).map((e) => Value.fromJson(e)).toList();
    discountPrice = json["discount_price"];
    discountPercentage = json["discount_percentage"];
    image = json["image"] == null ? null : List<String>.from(json["image"]);
    thumbnail = json["thumbnail"];
    isBuyNow = json["is_buy_now"];
    isActive = json["is_active"];
    isSaved = json["is_saved"];
    isDelete = json["is_delete"];
    isOutOfStock = json["is_out_of_stock"];
    productId = json["product_id"];
    parentId = json["parent_id"] == null ? null : ParentId.fromJson(json["parent_id"]);
    vendorId = json["vendor_id"] == null ? null : VendorId.fromJson(json["vendor_id"]);
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
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
  String? id;
  BankDetails? bankDetails;
  String? uid;
  String? name;
  dynamic arName;
  String? mobileNumber;
  String? countryCode;
  dynamic mobileNumberSec;
  dynamic countryCodeSec;
  String? email;
  bool? haveWhatsapp;
  bool? haveWhatsappSec;
  dynamic otp;
  dynamic dob;
  dynamic gender;
  String? language;
  String? userLanguage;
  dynamic location;
  dynamic city;
  dynamic country;
  dynamic addressId;
  dynamic area;
  dynamic latitude;
  dynamic longitude;
  String? image;
  bool? isActive;
  bool? isVerify;
  bool? isDelete;
  bool? isOtpVerify;
  bool? isFeatured;
  dynamic addedBy;
  String? type;
  dynamic deviceToken;
  String? deviceType;
  dynamic profession;
  bool? isOnline;
  bool? isAvailable;
  dynamic license;
  String? tradeLicense;
  String? storeName;
  String? storeLocation;
  dynamic userCar;
  String? approveStatus;
  List<dynamic>? document;
  dynamic rcDocument;
  dynamic insDocument;
  dynamic idDocument;
  dynamic lcDocument;
  dynamic carLcDocument;
  dynamic commissionPercentage;
  dynamic cashLimit;
  dynamic title;
  List<dynamic>? permission;
  dynamic restaurantId;
  dynamic countryId;
  dynamic stateId;
  dynamic cityId;
  List<dynamic>? cityIds;
  String? referCode;
  dynamic socketId;
  dynamic vendor;
  dynamic nationalId;
  dynamic insuranceNo;
  String? password;
  String? createdAt;
  String? updatedAt;
  dynamic v;
  bool? isEmailVerify;

  VendorId({this.id, this.bankDetails, this.uid, this.name, this.arName, this.mobileNumber, this.countryCode, this.mobileNumberSec, this.countryCodeSec, this.email, this.haveWhatsapp, this.haveWhatsappSec, this.otp, this.dob, this.gender, this.language, this.userLanguage, this.location, this.city, this.country, this.addressId, this.area, this.latitude, this.longitude, this.image, this.isActive, this.isVerify, this.isDelete, this.isOtpVerify, this.isFeatured, this.addedBy, this.type, this.deviceToken, this.deviceType, this.profession, this.isOnline, this.isAvailable, this.license, this.tradeLicense, this.storeName, this.storeLocation, this.userCar, this.approveStatus, this.document, this.rcDocument, this.insDocument, this.idDocument, this.lcDocument, this.carLcDocument, this.commissionPercentage, this.cashLimit, this.title, this.permission, this.restaurantId, this.countryId, this.stateId, this.cityId, this.cityIds, this.referCode, this.socketId, this.vendor, this.nationalId, this.insuranceNo, this.password, this.createdAt, this.updatedAt, this.v, this.isEmailVerify});

  VendorId.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    bankDetails = json["bank_details"] == null ? null : BankDetails.fromJson(json["bank_details"]);
    uid = json["uid"];
    name = json["name"];
    arName = json["ar_name"];
    mobileNumber = json["mobile_number"];
    countryCode = json["country_code"];
    mobileNumberSec = json["mobile_number_sec"];
    countryCodeSec = json["country_code_sec"];
    email = json["email"];
    haveWhatsapp = json["have_whatsapp"];
    haveWhatsappSec = json["have_whatsapp_sec"];
    otp = json["otp"];
    dob = json["dob"];
    gender = json["gender"];
    language = json["language"];
    userLanguage = json["user_language"];
    location = json["location"];
    city = json["city"];
    country = json["country"];
    addressId = json["address_id"];
    area = json["area"];
    latitude = json["latitude"];
    longitude = json["longitude"];
    image = json["image"];
    isActive = json["is_active"];
    isVerify = json["is_verify"];
    isDelete = json["is_delete"];
    isOtpVerify = json["is_otp_verify"];
    isFeatured = json["is_featured"];
    addedBy = json["added_by"];
    type = json["type"];
    deviceToken = json["device_token"];
    deviceType = json["device_type"];
    profession = json["profession"];
    isOnline = json["is_online"];
    isAvailable = json["is_available"];
    license = json["license"];
    tradeLicense = json["trade_license"];
    storeName = json["store_name"];
    storeLocation = json["store_location"];
    userCar = json["user_car"];
    approveStatus = json["approve_status"];
    document = json["document"] ?? [];
    rcDocument = json["rc_document"];
    insDocument = json["ins_document"];
    idDocument = json["id_document"];
    lcDocument = json["lc_document"];
    carLcDocument = json["car_lc_document"];
    commissionPercentage = json["commission_percentage"];
    cashLimit = json["cash_limit"];
    title = json["title"];
    permission = json["permission"] ?? [];
    restaurantId = json["restaurant_id"];
    countryId = json["country_id"];
    stateId = json["state_id"];
    cityId = json["city_id"];
    cityIds = json["city_ids"] ?? [];
    referCode = json["refer_code"];
    socketId = json["socketId"];
    vendor = json["vendor"];
    nationalId = json["national_id"];
    insuranceNo = json["insurance_no"];
    password = json["password"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    v = json["__v"];
    isEmailVerify = json["is_email_verify"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    if(bankDetails != null) {
      _data["bank_details"] = bankDetails?.toJson();
    }
    _data["uid"] = uid;
    _data["name"] = name;
    _data["ar_name"] = arName;
    _data["mobile_number"] = mobileNumber;
    _data["country_code"] = countryCode;
    _data["mobile_number_sec"] = mobileNumberSec;
    _data["country_code_sec"] = countryCodeSec;
    _data["email"] = email;
    _data["have_whatsapp"] = haveWhatsapp;
    _data["have_whatsapp_sec"] = haveWhatsappSec;
    _data["otp"] = otp;
    _data["dob"] = dob;
    _data["gender"] = gender;
    _data["language"] = language;
    _data["user_language"] = userLanguage;
    _data["location"] = location;
    _data["city"] = city;
    _data["country"] = country;
    _data["address_id"] = addressId;
    _data["area"] = area;
    _data["latitude"] = latitude;
    _data["longitude"] = longitude;
    _data["image"] = image;
    _data["is_active"] = isActive;
    _data["is_verify"] = isVerify;
    _data["is_delete"] = isDelete;
    _data["is_otp_verify"] = isOtpVerify;
    _data["is_featured"] = isFeatured;
    _data["added_by"] = addedBy;
    _data["type"] = type;
    _data["device_token"] = deviceToken;
    _data["device_type"] = deviceType;
    _data["profession"] = profession;
    _data["is_online"] = isOnline;
    _data["is_available"] = isAvailable;
    _data["license"] = license;
    _data["trade_license"] = tradeLicense;
    _data["store_name"] = storeName;
    _data["store_location"] = storeLocation;
    _data["user_car"] = userCar;
    _data["approve_status"] = approveStatus;
    if(document != null) {
      _data["document"] = document;
    }
    _data["rc_document"] = rcDocument;
    _data["ins_document"] = insDocument;
    _data["id_document"] = idDocument;
    _data["lc_document"] = lcDocument;
    _data["car_lc_document"] = carLcDocument;
    _data["commission_percentage"] = commissionPercentage;
    _data["cash_limit"] = cashLimit;
    _data["title"] = title;
    if(permission != null) {
      _data["permission"] = permission;
    }
    _data["restaurant_id"] = restaurantId;
    _data["country_id"] = countryId;
    _data["state_id"] = stateId;
    _data["city_id"] = cityId;
    if(cityIds != null) {
      _data["city_ids"] = cityIds;
    }
    _data["refer_code"] = referCode;
    _data["socketId"] = socketId;
    _data["vendor"] = vendor;
    _data["national_id"] = nationalId;
    _data["insurance_no"] = insuranceNo;
    _data["password"] = password;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["__v"] = v;
    _data["is_email_verify"] = isEmailVerify;
    return _data;
  }
}

class BankDetails {
  dynamic accNumber;
  dynamic bankName;
  dynamic beneficiaryName;
  dynamic ibanNumber;
  dynamic beneficiaryAddress;

  BankDetails({this.accNumber, this.bankName, this.beneficiaryName, this.ibanNumber, this.beneficiaryAddress});

  BankDetails.fromJson(Map<String, dynamic> json) {
    accNumber = json["acc_number"];
    bankName = json["bank_name"];
    beneficiaryName = json["beneficiary_name"];
    ibanNumber = json["iban_number"];
    beneficiaryAddress = json["beneficiary_address"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["acc_number"] = accNumber;
    _data["bank_name"] = bankName;
    _data["beneficiary_name"] = beneficiaryName;
    _data["iban_number"] = ibanNumber;
    _data["beneficiary_address"] = beneficiaryAddress;
    return _data;
  }
}

class ParentId {
  String? id;
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
  dynamic vatRate;
  dynamic vatAmount;
  List<String>? tags;
  List<Attribute>? attribute;
  List<AllAttribute>? allAttribute;
  bool? isFeatured;
  bool? isActive;
  bool? isDelete;
  bool? isLive;
  String? arName;
  String? name;
  BrandId? brandId;
  CategoryId? categoryId;
  ModelId? modelId;
  String? createdAt;
  String? updatedAt;
  dynamic v;
  List<int>? years;

  ParentId({this.id, this.image, this.thumbnail, this.description, this.partNumber, this.partType, this.sku, this.serialNumber, this.addedBy, this.price, this.minPrice, this.maxPrice, this.orderCount, this.parentId, this.vendorId, this.variantNumber, this.marketCategory, this.dealExpiryTime, this.yearModelStart, this.yearModelEnd, this.vatRate, this.vatAmount, this.tags, this.attribute, this.allAttribute, this.isFeatured, this.isActive, this.isDelete, this.isLive, this.arName, this.name, this.brandId, this.categoryId, this.modelId, this.createdAt, this.updatedAt, this.v, this.years});

  ParentId.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
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
    vatRate = json["vat_rate"];
    vatAmount = json["vat_amount"];
    tags = json["tags"] == null ? null : List<String>.from(json["tags"]);
    attribute = json["attribute"] == null ? null : (json["attribute"] as List).map((e) => Attribute.fromJson(e)).toList();
    allAttribute = json["all_attribute"] == null ? null : (json["all_attribute"] as List).map((e) => AllAttribute.fromJson(e)).toList();
    isFeatured = json["is_featured"];
    isActive = json["is_active"];
    isDelete = json["is_delete"];
    isLive = json["is_live"];
    arName = json["ar_name"];
    name = json["name"];
    brandId = json["brand_id"] == null ? null : BrandId.fromJson(json["brand_id"]);
    categoryId = json["category_id"] == null ? null : CategoryId.fromJson(json["category_id"]);
    modelId = json["model_id"] == null ? null : ModelId.fromJson(json["model_id"]);
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    v = json["__v"];
    years = json["years"] == null ? null : List<int>.from(json["years"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
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
    _data["ar_name"] = arName;
    _data["name"] = name;
    if(brandId != null) {
      _data["brand_id"] = brandId?.toJson();
    }
    if(categoryId != null) {
      _data["category_id"] = categoryId?.toJson();
    }
    if(modelId != null) {
      _data["model_id"] = modelId?.toJson();
    }
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["__v"] = v;
    if(years != null) {
      _data["years"] = years;
    }
    return _data;
  }
}

class ModelId {
  String? id;
  String? name;
  String? arName;
  String? image;
  String? addedBy;
  bool? isActive;
  bool? isDelete;
  String? brandId;
  String? createdAt;
  String? updatedAt;
  dynamic v;

  ModelId({this.id, this.name, this.arName, this.image, this.addedBy, this.isActive, this.isDelete, this.brandId, this.createdAt, this.updatedAt, this.v});

  ModelId.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
    arName = json["ar_name"];
    image = json["image"];
    addedBy = json["added_by"];
    isActive = json["is_active"];
    isDelete = json["is_delete"];
    brandId = json["brand_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["ar_name"] = arName;
    _data["image"] = image;
    _data["added_by"] = addedBy;
    _data["is_active"] = isActive;
    _data["is_delete"] = isDelete;
    _data["brand_id"] = brandId;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}

class CategoryId {
  String? id;
  String? name;
  String? arName;
  String? image;
  String? addedBy;
  bool? isActive;
  bool? isDelete;
  String? createdAt;
  String? updatedAt;
  dynamic v;
  dynamic order;

  CategoryId({this.id, this.name, this.arName, this.image, this.addedBy, this.isActive, this.isDelete, this.createdAt, this.updatedAt, this.v, this.order});

  CategoryId.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
    arName = json["ar_name"];
    image = json["image"];
    addedBy = json["added_by"];
    isActive = json["is_active"];
    isDelete = json["is_delete"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    v = json["__v"];
    order = json["order"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["ar_name"] = arName;
    _data["image"] = image;
    _data["added_by"] = addedBy;
    _data["is_active"] = isActive;
    _data["is_delete"] = isDelete;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["__v"] = v;
    _data["order"] = order;
    return _data;
  }
}

class BrandId {
  String? id;
  String? name;
  String? arName;
  String? image;
  String? addedBy;
  bool? isActive;
  bool? isDelete;
  String? createdAt;
  String? updatedAt;
  dynamic v;

  BrandId({this.id, this.name, this.arName, this.image, this.addedBy, this.isActive, this.isDelete, this.createdAt, this.updatedAt, this.v});

  BrandId.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
    arName = json["ar_name"];
    image = json["image"];
    addedBy = json["added_by"];
    isActive = json["is_active"];
    isDelete = json["is_delete"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["ar_name"] = arName;
    _data["image"] = image;
    _data["added_by"] = addedBy;
    _data["is_active"] = isActive;
    _data["is_delete"] = isDelete;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["__v"] = v;
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