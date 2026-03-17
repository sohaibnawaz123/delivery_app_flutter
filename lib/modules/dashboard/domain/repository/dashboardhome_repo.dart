import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/dashboard/domain/entities/dashboardhome_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboardhome_param.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
  

abstract class DashboardhomeRepo {
  Future<Either<RepoFailure, BaseEntity<DashboardhomeEntity>>> 
      dashboardhome(
    DashboardhomeParam param,
  );
}
