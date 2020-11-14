class ApiRoutes {
  static const String url = "http://192.168.8.101:3000/";
  static const String api = url + "api/v2/";

  /// [1] Retrieve all markets
  static const String markets = api + "markets";

  /// [2] Retrieve markets by ID
  static String getMarketsByID(marketsID) {
    return api + 'markets/$marketsID';
  }

  /// [3] Retrieve Markets Shops by markets ID
  static String getMarketsShops(marketsID) {
    return api + 'markets/$marketsID/shops';
  }

  /// [4] Retrieve all shops
  static const String shops = api + "shops";

  /// [5] Retrieve Shops by shops ID
  static String getShopsByID(shopsID) {
    return api + 'shops/$shopsID';
  }
}
