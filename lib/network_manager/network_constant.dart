import 'api_constant.dart';

class NetworkConstant {
  static const String mainUrl = ApiConstant.baseUrl;

  ///---------------------------------------------------///
  ///-------------------Auth----------------------------///
  ///---------------------------------------------------///
  static const String signUpUrl = "$mainUrl/api/app/auth/sign-up";
  static const String loginUrl = "$mainUrl/api/app/auth/login";
  static const String sendOtpMailUrl = "$mainUrl/api/app/auth/send-otp";
  static const String verifyOtpUrl = "$mainUrl/api/app/auth/verify-otp";
  static const String reSendOtpUrl = "$mainUrl/api/app/auth/send-update-otp";
  static const String forgotPasswordUrl = "$mainUrl/api/app/auth/forgot-password";
  static const String profileGetUrl = "$mainUrl/api/app/auth/get-profile";


  //---------------------------------------------------///
  ///-------------------Product------------------------///
  ///---------------------------------------------------///
  // Get Api
  static const String categoryListGetApiUrl = "$mainUrl/api/common/category-listing";
  static const String vendorListGetApiUrl = "$mainUrl/api/app/product/vendor-products?category_id=";
  static const String productDetailsGetApiUrl = "$mainUrl/api/app/product/";
  static const String productListGetApiUrl = "$mainUrl/api/app/product/";
  static const String dashboardGetApiUrl = "$mainUrl/api/app/auth/dashboard";
  static const String deleteAccountGetApiUrl = "$mainUrl/api/app/auth/delete-account";

  ///---------------------------------------------------///
  ///-------------------Master------------------///
  ///---------------------------------------------------///

  static const String uploadImagePostApiUrl = "$mainUrl/api/common/image-upload";

  ///---------------------------------------------------///
  ///-------------------Address------------------///
  ///---------------------------------------------------///

  static const String editAddressPostApiUrl = "$mainUrl/api/app/address/";
  static const String addressListGetApiUrl = "$mainUrl/api/app/address/";
  static const String updateAddressPutApiUrl = "$mainUrl/api/app/address/";
  static const String defaultAddressPutApiUrl = "$mainUrl/api/app/address/default/";
  static const String removeAddressDelectApiUrl = "$mainUrl/api/app/address/";

  ///---------------------------------------------------///
  ///-------------------Notification------------------///
  ///---------------------------------------------------///


  static const String notificationListGetApiUrl = "$mainUrl/api/app/notification/list";
  static const String readNotificationGetApiUrl = "$mainUrl/api/app/notification/read/";
  static const String deleteNotificationDeleteApiUrl = "$mainUrl/api/app/notification/delete/";



  ///----- image upload multipart api
  static const String imageUploadApiUrl = "$mainUrl/api/common/image-upload";

      ///---------------------------------------------------///
      ///-------------------Cart----------------------------///
      ///---------------------------------------------------///


 static const String addAddressToTheCartPutApi = "$mainUrl/api/app/cart/cart-address";
 static const String addItemToCartPostApi = "$mainUrl/api/app/cart";
 static const String cartListGetAPi = "$mainUrl/api/app/cart";
 static const String emptyCartDeleteApi = "$mainUrl/api/app/cart?product_id=";
 static const String removeItemFromCartPutApi = "$mainUrl/api/app/cart/remove-multiple/";
 static const String updateQuanitityPutApi = "$mainUrl/api/app/cart/update-qty/";


}
