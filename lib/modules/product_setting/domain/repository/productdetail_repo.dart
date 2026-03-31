import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/product_setting/domain/entities/productdetail_entity.dart';
import 'package:delivery_app/modules/product_setting/domain/params/productdetail_param.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
  

abstract class ProductdetailRepo {
  Future<Either<RepoFailure, BaseEntity<ProductdetailEntity>>> 
      productdetail(
    ProductdetailParam param,
  );
}
