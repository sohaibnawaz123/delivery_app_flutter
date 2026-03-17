import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/dashboard/domain/entities/dashboard_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboard_param.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
  

abstract class DashboardRepo {
  Future<Either<RepoFailure, BaseEntity<DashboardEntity>>> 
      dashboard(
    DashboardParam param,
  );
}
