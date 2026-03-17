import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/dashboard/domain/entities/dashboardsetting_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboardsetting_param.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
  

abstract class DashboardsettingRepo {
  Future<Either<RepoFailure, BaseEntity<DashboardsettingEntity>>> 
      dashboardsetting(
    DashboardsettingParam param,
  );
}
