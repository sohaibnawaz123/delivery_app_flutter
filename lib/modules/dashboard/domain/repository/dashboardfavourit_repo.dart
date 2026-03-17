import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/dashboard/domain/entities/dashboardfavourit_entity.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboardfavourit_param.dart';
import 'package:delivery_app/modules/app/domain/entitties/base_entity.dart';
  

abstract class DashboardfavouritRepo {
  Future<Either<RepoFailure, BaseEntity<DashboardfavouritEntity>>> 
      dashboardfavourit(
    DashboardfavouritParam param,
  );
}
