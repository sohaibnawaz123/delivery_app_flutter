import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/product_setting/domain/entities/fetch_all_product_entity.dart';
import 'package:delivery_app/modules/product_setting/domain/params/fetch_all_product_param.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
  

abstract class FetchAllProductRepo {
  Future<Either<RepoFailure, BaseEntity<FetchAllProductEntity>>> 
      fetchAllProduct(
    FetchAllProductParam param,
  );
}
