enum HttpMethod { head, get, post, put, patch, delete, read, readbytes }

enum FnbType { dkriuk }

class FnbInfo {
  static Map<String, List<Map<String, String>>> info = {
    "dkriuk": [
      {"cabang": "fengtay"}
    ]
  };

  static Map<String, Object>? getInfoFnb(FnbType fnbType, String cabang) {
    List<Map<String, String>>? list = FnbInfo.info[fnbType.toString()];
    return list?.firstWhere((element) => element["cabang"] == cabang);
  }
}
