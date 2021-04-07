import 'package:flutter/material.dart';
import 'package:hope_doctor/model/market-shop.dart';
import 'package:hope_doctor/model/reserved-item.dart';
import 'package:hope_doctor/services/shop/index.dart';


class ShopBloc extends ChangeNotifier {
  List<MarketShop> _marketShop;
  List<ReservedItem> _reservedItem;
  List<MarketShop> get marketShop {
    return _marketShop;
  }

  set marketShop(List<MarketShop> _data) {
    this._marketShop = _data;
    notifyListeners();
  }

  List<ReservedItem> get reservedItem {
    return _reservedItem;
  }

  set reservedItem(List<ReservedItem> _data) {
    this._reservedItem = _data;
    notifyListeners();
  }
  removeReservedItem(int index) {
    this._reservedItem.removeAt(index);
    notifyListeners();
  }
  ///fetch market shop
  Future<List<MarketShop>> fetchMarketShop(BuildContext context) async {
    MarketService marketService = new  MarketService(
        context: context);
    List<MarketShop> _marketShop = await marketService.getMarketShop();
    this._marketShop = _marketShop;
    notifyListeners();
    return _marketShop;
  }
  ///fetch reserved products
  Future<List<ReservedItem>> fetchReservedProducts(BuildContext context) async {
    MarketService marketService = new  MarketService(
        context: context);
    List<ReservedItem> _reservedItems = await marketService.getReservedProducts();
    this._reservedItem = _reservedItems;
    notifyListeners();
    return _reservedItems;
  }
}
