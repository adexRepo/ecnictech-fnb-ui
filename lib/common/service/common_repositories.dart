import 'package:dartz/dartz.dart';
import 'package:gsheets/gsheets.dart';
import 'package:ecnictech_fnb_ui/common/models/dkriuk_product.dart';
import 'package:ecnictech_fnb_ui/common/service/secure_http_request.dart';
import 'package:ecnictech_fnb_ui/core/error/failures.dart';

abstract class CommonService {
  Future<Either<Failure, List<DkriukPrduct>>> getDkriukProduct();
}

const _credentials =
    'your-credentials.json'; // replace with your credentials file

const _spreadsheetId = '';

class CommonServiceImpl implements CommonService {
  final SecureHttpRequest secureHttpRequest;

  CommonServiceImpl({required this.secureHttpRequest});

  @override
  Future<Either<Failure, List<DkriukPrduct>>> getDkriukProduct() async {
    List<DkriukPrduct> dkriukProducts = [];

    try {
      final gsheets = GSheets(_credentials);
      final ss = await gsheets.spreadsheet(_spreadsheetId);
      var sheet1 = ss.worksheetByTitle('product');

      final response = await sheet1?.values.map.allRows();

      response!.map((e) => {
            dkriukProducts.add(DkriukPrduct(
              id: e["id"].toString(),
              name: e["name"].toString(),
              price: e["price"] != null
                  ? double.tryParse(e["price"].toString()) ?? 0.0
                  : 0.0,
              description: e["description"].toString(),
            ))
          });

      return Right(dkriukProducts);
    } catch (e) {
      return Left(ServerFailure("Failed to get data from google sheet $e"));
    }
  }
}
