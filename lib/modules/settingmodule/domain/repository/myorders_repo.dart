import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/settingmodule/domain/entities/myorders_entity.dart';
import 'package:delivery_app/modules/settingmodule/domain/params/myorders_param.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
  

abstract class MyordersRepo {
  Future<Either<RepoFailure, BaseEntity<MyordersEntity>>> 
      myorders(
    MyordersParam param,
  );
}
