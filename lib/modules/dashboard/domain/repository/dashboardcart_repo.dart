import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/dashboard/domain/entities/dashboardcart_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboardcart_param.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
  

abstract class DashboardcartRepo {
  Future<Either<RepoFailure, BaseEntity<DashboardcartEntity>>> 
      dashboardcart(
    DashboardcartParam param,
  );
}
