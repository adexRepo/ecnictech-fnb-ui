import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gsheets/gsheets.dart';
import 'package:ecnictech_fnb_ui/common/models/dkriuk_product.dart';
import 'package:ecnictech_fnb_ui/core/error/failures.dart';

abstract class CommonService {
  Future<Either<Failure, List<DkriukPrduct>>> getDkriukProduct();
}

class CommonServiceImpl implements CommonService {
  final _credentials =
      dotenv.env['G_SHEET_CREDENTIAL']!; // replace with your credentials file
  final _spreadsheetId = dotenv.env['G_SHEET_ID']!;

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
