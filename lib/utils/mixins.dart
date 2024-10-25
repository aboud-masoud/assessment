import 'package:exinity_assessment/locator.dart';
import 'package:exinity_assessment/utils/rest_api/http_repository.dart';

mixin Service {
  HttpRepository repository = locator<HttpRepository>();
}

abstract class Model<T> {
  Model();
  Map<String, dynamic> toJson();
}
