import 'package:fpdart/fpdart.dart';
import 'package:delivery_app/core/failures/repo_failure.dart';
import 'package:delivery_app/modules/app/data/models/base_json.dart';
import 'package:delivery_app/modules/dashboard/data/model/response/checkout_model/checkout_model.dart';
import 'package:delivery_app/modules/dashboard/domain/params/checkout_param.dart';
abstract class CheckoutRemoteDataSource {
    Future<Either<RepoFailure, BaseJson<CheckoutModel>>> checkout(CheckoutParam data);

}

