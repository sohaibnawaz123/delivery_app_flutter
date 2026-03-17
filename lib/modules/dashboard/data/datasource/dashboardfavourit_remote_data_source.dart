import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/dashboard/data/model/response/dashboardfavourit_model/dashboardfavourit_model.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboardfavourit_param.dart';
abstract class DashboardfavouritRemoteDataSource {
    Future<Either<RepoFailure, BaseJson<DashboardfavouritModel>>> dashboardfavourit(DashboardfavouritParam data);

}

