
class ProfileModel {
  dynamic status;
  String? statusText;
  String? message;
  Data? data;
  dynamic exeTime;

  ProfileModel({this.status, this.statusText, this.message, this.data, this.exeTime});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  dynamic image;
  bool? isActive;
  bool? isVerify;
  bool? isDelete;
  bool? isOtpVerify;
  bool? isFeatured;
  dynamic addedBy;
  String? type;
  dynamic profession;
  bool? isOnline;
  bool? isAvailable;
  dynamic license;
  dynamic vat;
  dynamic cr;
  dynamic tradeLicense;
  dynamic storeName;
  dynamic arStoreName;
  dynamic storeLocation;
  dynamic banner;
  dynamic userCar;
  String? approveStatus;
  bool? isEmailVerify;
  List<dynamic>? document;
  dynamic rcDocument;
  dynamic insDocument;
  dynamic idDocument;
  dynamic nationalId;
  dynamic insuranceNo;
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
  String? password;
  String? createdAt;
  String? updatedAt;
  dynamic v;
  Setting? setting;

  Data({this.id, this.bankDetails, this.uid, this.name, this.arName, this.mobileNumber, this.countryCode, this.mobileNumberSec, this.countryCodeSec, this.email, this.haveWhatsapp, this.haveWhatsappSec, this.otp, this.dob, this.gender, this.language, this.userLanguage, this.location, this.city, this.country, this.addressId, this.area, this.latitude, this.longitude, this.image, this.isActive, this.isVerify, this.isDelete, this.isOtpVerify, this.isFeatured, this.addedBy, this.type, this.profession, this.isOnline, this.isAvailable, this.license, this.vat, this.cr, this.tradeLicense, this.storeName, this.arStoreName, this.storeLocation, this.banner, this.userCar, this.approveStatus, this.isEmailVerify, this.document, this.rcDocument, this.insDocument, this.idDocument, this.nationalId, this.insuranceNo, this.lcDocument, this.carLcDocument, this.commissionPercentage, this.cashLimit, this.title, this.permission, this.restaurantId, this.countryId, this.stateId, this.cityId, this.cityIds, this.referCode, this.socketId, this.vendor, this.password, this.createdAt, this.updatedAt, this.v, this.setting});

  Data.fromJson(Map<String, dynamic> json) {
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
    profession = json["profession"];
    isOnline = json["is_online"];
    isAvailable = json["is_available"];
    license = json["license"];
    vat = json["vat"];
    cr = json["cr"];
    tradeLicense = json["trade_license"];
    storeName = json["store_name"];
    arStoreName = json["ar_store_name"];
    storeLocation = json["store_location"];
    banner = json["banner"];
    userCar = json["user_car"];
    approveStatus = json["approve_status"];
    isEmailVerify = json["is_email_verify"];
    document = json["document"] ?? [];
    rcDocument = json["rc_document"];
    insDocument = json["ins_document"];
    idDocument = json["id_document"];
    nationalId = json["national_id"];
    insuranceNo = json["insurance_no"];
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
    password = json["password"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    v = json["__v"];
    setting = json["setting"] == null ? null : Setting.fromJson(json["setting"]);
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
    _data["profession"] = profession;
    _data["is_online"] = isOnline;
    _data["is_available"] = isAvailable;
    _data["license"] = license;
    _data["vat"] = vat;
    _data["cr"] = cr;
    _data["trade_license"] = tradeLicense;
    _data["store_name"] = storeName;
    _data["ar_store_name"] = arStoreName;
    _data["store_location"] = storeLocation;
    _data["banner"] = banner;
    _data["user_car"] = userCar;
    _data["approve_status"] = approveStatus;
    _data["is_email_verify"] = isEmailVerify;
    if(document != null) {
      _data["document"] = document;
    }
    _data["rc_document"] = rcDocument;
    _data["ins_document"] = insDocument;
    _data["id_document"] = idDocument;
    _data["national_id"] = nationalId;
    _data["insurance_no"] = insuranceNo;
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
    _data["password"] = password;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["__v"] = v;
    if(setting != null) {
      _data["setting"] = setting?.toJson();
    }
    return _data;
  }
}

class Setting {
  bool? enableAllNotifications;
  bool? enableNewsletters;
  bool? offerNotificationsOnEmail;
  bool? offerPushNotifications;
  bool? offerWhatsappNotifications;
  bool? isDarkMode;
  bool? enableFaceId;
  bool? changeLanguage;
  String? id;
  String? userId;
  String? createdAt;
  String? updatedAt;
  dynamic v;

  Setting({this.enableAllNotifications, this.enableNewsletters, this.offerNotificationsOnEmail, this.offerPushNotifications, this.offerWhatsappNotifications, this.isDarkMode, this.enableFaceId, this.changeLanguage, this.id, this.userId, this.createdAt, this.updatedAt, this.v});

  Setting.fromJson(Map<String, dynamic> json) {
    enableAllNotifications = json["enable_all_notifications"];
    enableNewsletters = json["enable_newsletters"];
    offerNotificationsOnEmail = json["offer_notifications_on_email"];
    offerPushNotifications = json["offer_push_notifications"];
    offerWhatsappNotifications = json["offer_whatsapp_notifications"];
    isDarkMode = json["is_dark_mode"];
    enableFaceId = json["enable_faceId"];
    changeLanguage = json["change_language"];
    id = json["_id"];
    userId = json["user_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["enable_all_notifications"] = enableAllNotifications;
    _data["enable_newsletters"] = enableNewsletters;
    _data["offer_notifications_on_email"] = offerNotificationsOnEmail;
    _data["offer_push_notifications"] = offerPushNotifications;
    _data["offer_whatsapp_notifications"] = offerWhatsappNotifications;
    _data["is_dark_mode"] = isDarkMode;
    _data["enable_faceId"] = enableFaceId;
    _data["change_language"] = changeLanguage;
    _data["_id"] = id;
    _data["user_id"] = userId;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["__v"] = v;
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