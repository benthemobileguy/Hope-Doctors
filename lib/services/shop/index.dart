import 'package:flutter/material.dart';
import 'package:hope_doctor/bloc/default.dart';
import 'package:hope_doctor/model/market-shop.dart';
import 'package:hope_doctor/model/reserved-item.dart';
import 'package:hope_doctor/services/index.dart';
import 'package:provider/provider.dart';

class  MarketService extends ApiService {
  BuildContext context;
  MainBloc bloc;
  MarketService({@required this.context}) : super(context: context);

  /// get market shop
  Future<List<MarketShop>> getMarketShop() async {
    bloc = Provider.of<MainBloc>(context, listen: false);
    Map<String, dynamic> _data =
    await get('store');
    print(_data);
    List<MarketShop> _marketShop = [];
    _marketShop = MarketShop.fromJsonList(_data['data']['store']['data']);
    bloc.marketShop = _marketShop;
    return _marketShop;
  }
  /// get reserved products
  Future<List<ReservedItem>> getReservedProducts() async {
    bloc = Provider.of<MainBloc>(context, listen: false);
    Map<String, dynamic> _data =
    await get('reserve');
    print(_data);
    List<ReservedItem> _reservedItem = [];
    _reservedItem = ReservedItem.fromJsonList(_data['data']['reserves']['data']);
    bloc.reservedItem = _reservedItem;
    return _reservedItem;
  }
  /// delete reserved item
  Future<Map<String, dynamic>> reserveProduct(Map<String, dynamic> data) async {
    Map<String, dynamic> _response = await post('reserve/add', data);

    return _response;
  }
  /// delete product
  Future<Map<String, dynamic>> deleteProduct(String storeId) async {
    Map<String, dynamic> _response = await delete('store/delete/${storeId}');

    return _response;
  }
  /// delete reserved product
  Future<Map<String, dynamic>> deleteReservedItem(String reserveId) async {
    Map<String, dynamic> _response = await delete('reserve/delete/${reserveId}');
    return _response;
  }
  /// create product
  Future<Map<String, dynamic>> createProduct(Map<String, dynamic> data) async {
    Map<String, dynamic> _response = await post('store/create', data);
    return _response;
  }
}