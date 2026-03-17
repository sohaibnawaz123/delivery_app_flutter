import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/dashboard/data/model/response/dashboardcart_model/dashboardcart_model.dart';
import 'package:delivery_app/modules/dashboard/domain/params/dashboardcart_param.dart';
abstract class DashboardcartRemoteDataSource {
    Future<Either<RepoFailure, BaseJson<DashboardcartModel>>> dashboardcart(DashboardcartParam data);

}

