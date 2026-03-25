import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/product_setting/data/model/response/fetch_all_product_model/fetch_all_product_model.dart';
import 'package:delivery_app/modules/product_setting/domain/params/fetch_all_product_param.dart';
abstract class FetchAllProductRemoteDataSource {
    Future<Either<RepoFailure, BaseJson<FetchAllProductModel>>> fetch_all_product(FetchAllProductParam data);

}

