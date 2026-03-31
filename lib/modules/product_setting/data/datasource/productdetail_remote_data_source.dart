import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/product_setting/data/model/response/productdetail_model/productdetail_model.dart';
import 'package:delivery_app/modules/product_setting/domain/params/productdetail_param.dart';
abstract class ProductdetailRemoteDataSource {
    Future<Either<RepoFailure, BaseJson<ProductdetailModel>>> productdetail(ProductdetailParam data);

}

