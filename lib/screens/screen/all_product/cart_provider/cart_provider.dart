import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:new_quickly_desige/models/cart_list_model.dart';
import 'package:new_quickly_desige/network_manager/rest_client.dart';
import 'package:new_quickly_desige/utils/toast_message.dart';

class CartProvider extends ChangeNotifier {
  bool isLoading = true;

  fetchEmptyCartDeleteApi(String productId) async {
    isLoading = true;
    notifyListeners();
    await RestClient.fetchEmptyCartDeleteApi(productId).then((value) async {
      await fetchCartListGetAPi();
      isLoading = false;
      notifyListeners();
    }).onError(
      (error, stackTrace) {
        log("\n fetchEmptyCartDeleteApi error : $error");
        log("\n fetchEmptyCartDeleteApi stackTrace : $stackTrace");
        isLoading = false;
        notifyListeners();
      },
    );
  }

  dynamic totalPrice = 0;
  CartListModel cartListModel = CartListModel();
  fetchCartListGetAPi() {
    isLoading = true;
    notifyListeners();
    RestClient.fetchCartListGetAPi().then((value) {
      cartListModel = value;
      if (cartListModel.data?.items! != null && cartListModel.data!.items!.isNotEmpty) {
        for (int i = 0; i < cartListModel.data!.items!.length; i++) {
          totalPrice += cartListModel.data?.items?[i].productId?.productId?.price * cartListModel.data!.items![i].qty;
        }
      }
      isLoading = false;
      notifyListeners();
    }).onError(
      (error, stackTrace) {
        log("\n fetchCartListGetAPi error : $error");
        log("\n fetchCartListGetAPi stackTrace : $stackTrace");
        cartListModel = CartListModel();
        isLoading = false;
        notifyListeners();
      },
    );
  }

  fetchAddItemToCartPostApi({required String productId, required int qty, bool? isBuyNow, String? addressID}) {
    isLoading = true;
    notifyListeners();
    Map params = {
      "product_id": productId,
      "qty": qty,
      "address_id": addressID,
      "is_buy_now": isBuyNow,
    };
    RestClient.fetchAddItemToCartPostApi(params).then((value) {
      toastMessageSuccessfully(value["message"]);
      isLoading = false;
      notifyListeners();
    }).onError(
      (error, stackTrace) {
        log("\n fetchAddItemToCartPostApi error : $error");
        log("\n fetchAddItemToCartPostApi stackTrace : $stackTrace");
        isLoading = false;
        notifyListeners();
      },
    );
  }

  fetchAddAddressToTheCartPutApi(String addressId) {
    isLoading = true;
    notifyListeners();
    Map params = {"address_id": addressId};
    RestClient.fetchAddAddressToTheCartPutApi(params).then((value) {
      isLoading = false;
      notifyListeners();
    }).onError(
      (error, stackTrace) {
        log("\n fetchAddAddressToTheCartPutApi error : $error");
        log("\n fetchAddAddressToTheCartPutApi stackTrace : $stackTrace");
        isLoading = false;
        notifyListeners();
      },
    );
  }

  fetchRemoveItemFromCartPutApi(String productId) {
    isLoading = true;
    notifyListeners();
    RestClient.fetchRemoveItemFromCartPutApi(productId).then((value) {
      toastMessageSuccessfully(value["message"]);
      isLoading = false;
      notifyListeners();
    }).onError(
      (error, stackTrace) {
        log("\n fetchRemoveItemFromCartPutApi error : $error");
        log("\n fetchRemoveItemFromCartPutApi stackTrace : $stackTrace");
        isLoading = false;
        notifyListeners();
      },
    );
  }
   bool  isload = true;
  fetchUpdateQuanitityPutApi(String productId, int qty, int index) {
    isload = true;
    notifyListeners();
    var body = {"qty": qty};
    RestClient.fetchUpdateQuanitityPutApi(productId, body).then((value) {
      isload = false;
      notifyListeners();
      cartListModel.data?.items?[index].qty = qty;
      notifyListeners();
    }).onError(
      (error, stackTrace) {
        log("\n fetchUpdateQuanitityPutApi error : $error");
        log("\n fetchUpdateQuanitityPutApi stackTrace : $stackTrace");
        isload = false;
        notifyListeners();
      },
    );
  }

  int _productQuanitity = 1;
  int get countProduct => _productQuanitity;
  increment() {
    _productQuanitity++;
    notifyListeners();
  }

  /*decrement() {
    if (_productQuanitity > 1) {
      _productQuanitity--;
      notifyListeners();
    }
  }

  int counterQty(int index) {
    if (index < 0 ||
        cartListModel.data?.items == null ||
        index >= cartListModel.data!.items!.length) {
      return 0;
    }
    return cartListModel.data!.items![index].qty ?? 0;
  }

  decrementList(int index) {
    if (index < 0 ||
        cartListModel.data?.items == null ||
        index >= cartListModel.data!.items!.length) {
      return;
    }
    var qty = cartListModel.data!.items![index].qty;
    qty = qty - 1;
    totalPrice -= cartListModel.data?.items?[index].productId?.productId?.price;
    notifyListeners();
    return qty;
  }*/

  incrementList(int index) {
    if (index < 0 || cartListModel.data?.items == null || index >= cartListModel.data!.items!.length) {
      return;
    }
    var qty = cartListModel.data!.items![index].qty;
    qty = qty + 1;
    totalPrice += cartListModel.data?.items?[index].productId?.productId?.price;
    notifyListeners();
    return qty;
  }

  void updateCartItemQty(int index, bool increment) {
    // Ensure the index is valid and the cart item exists
    if (index < 0 || cartListModel.data?.items == null || index >= cartListModel.data!.items!.length) {
      return;
    }

    // Access the item
    var item = cartListModel.data!.items![index];

    // Update the quantity based on increment or decrement
    if (increment) {
      item.qty = item.qty! + 1;
      totalPrice += cartListModel.data?.items?[index].productId?.productId?.price;
    } else {
      item.qty = (item.qty! > 1) ? item.qty! - 1 : 1; // Ensure qty does not go below 0
      totalPrice -= cartListModel.data?.items?[index].productId?.productId?.price;
    }

    // Notify listeners after updating the item
    notifyListeners();
  }

  int getCounterQty(int index) {
    if (index < 0 || cartListModel.data?.items == null || index >= cartListModel.data!.items!.length) {
      return 0;
    }
    return cartListModel.data!.items![index].qty ?? 0;
  }
}
