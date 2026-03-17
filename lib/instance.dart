import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:delivery_app/main.dart';
import 'package:delivery_app/core/constant/app_url.dart';
import 'package:delivery_app/core/network/network.dart';
import 'package:delivery_app/core/network/network_service.dart';
import 'package:delivery_app/modules/onboarding/data/datasource/onboarding_remote_data_source.dart';
import 'package:delivery_app/modules/onboarding/data/datasource/onboarding_remote_data_source_impl.dart';
import 'package:delivery_app/modules/onboarding/data/rest_api/onboarding_rest_api_repo.dart';
import 'package:delivery_app/modules/onboarding/domain/repository/onboarding_repo.dart';
import 'package:delivery_app/modules/onboarding/domain/usecase/onboarding_use_case.dart';
import 'package:delivery_app/modules/onboarding/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:delivery_app/modules/onboarding/presentation/routes/onboarding_view_initial_params.dart';
import 'package:delivery_app/modules/onboarding/data/datasource/joinus_remote_data_source.dart';
import 'package:delivery_app/modules/onboarding/data/datasource/joinus_remote_data_source_impl.dart';
import 'package:delivery_app/modules/onboarding/data/rest_api/joinus_rest_api_repo.dart';
import 'package:delivery_app/modules/onboarding/domain/repository/joinus_repo.dart';
import 'package:delivery_app/modules/onboarding/domain/usecase/joinus_use_case.dart';
import 'package:delivery_app/modules/onboarding/presentation/blocs/joinus/joinus_bloc.dart';
import 'package:delivery_app/modules/onboarding/presentation/routes/joinus_view_initial_params.dart';
import 'package:delivery_app/modules/auth/data/datasource/login_remote_data_source.dart';
import 'package:delivery_app/modules/auth/data/datasource/login_remote_data_source_impl.dart';
import 'package:delivery_app/modules/auth/data/rest_api/login_rest_api_repo.dart';
import 'package:delivery_app/modules/auth/domain/repository/login_repo.dart';
import 'package:delivery_app/modules/auth/domain/usecase/login_use_case.dart';
import 'package:delivery_app/modules/auth/presentation/blocs/login/login_bloc.dart';
import 'package:delivery_app/modules/auth/presentation/routes/login_view_initial_params.dart';
import 'package:delivery_app/modules/auth/data/datasource/signup_remote_data_source.dart';
import 'package:delivery_app/modules/auth/data/datasource/signup_remote_data_source_impl.dart';
import 'package:delivery_app/modules/auth/data/rest_api/signup_rest_api_repo.dart';
import 'package:delivery_app/modules/auth/domain/repository/signup_repo.dart';
import 'package:delivery_app/modules/auth/domain/usecase/signup_use_case.dart';
import 'package:delivery_app/modules/auth/presentation/blocs/signup/signup_bloc.dart';
import 'package:delivery_app/modules/auth/presentation/routes/signup_view_initial_params.dart';
import 'package:delivery_app/modules/auth/data/datasource/forgetpassword_remote_data_source.dart';
import 'package:delivery_app/modules/auth/data/datasource/forgetpassword_remote_data_source_impl.dart';
import 'package:delivery_app/modules/auth/data/rest_api/forgetpassword_rest_api_repo.dart';
import 'package:delivery_app/modules/auth/domain/repository/forgetpassword_repo.dart';
import 'package:delivery_app/modules/auth/domain/usecase/forgetpassword_use_case.dart';
import 'package:delivery_app/modules/auth/presentation/blocs/forgetpassword/forgetpassword_bloc.dart';
import 'package:delivery_app/modules/auth/presentation/routes/forgetpassword_view_initial_params.dart';
import 'package:delivery_app/modules/auth/data/datasource/otpverify_remote_data_source.dart';
import 'package:delivery_app/modules/auth/data/datasource/otpverify_remote_data_source_impl.dart';
import 'package:delivery_app/modules/auth/data/rest_api/otpverify_rest_api_repo.dart';
import 'package:delivery_app/modules/auth/domain/repository/otpverify_repo.dart';
import 'package:delivery_app/modules/auth/domain/usecase/otpverify_use_case.dart';
import 'package:delivery_app/modules/auth/presentation/blocs/otpverify/otpverify_bloc.dart';
import 'package:delivery_app/modules/auth/presentation/routes/otpverify_view_initial_params.dart';
import 'package:delivery_app/modules/auth/data/datasource/resetpassword_remote_data_source.dart';
import 'package:delivery_app/modules/auth/data/datasource/resetpassword_remote_data_source_impl.dart';
import 'package:delivery_app/modules/auth/data/rest_api/resetpassword_rest_api_repo.dart';
import 'package:delivery_app/modules/auth/domain/repository/resetpassword_repo.dart';
import 'package:delivery_app/modules/auth/domain/usecase/resetpassword_use_case.dart';
import 'package:delivery_app/modules/auth/presentation/blocs/resetpassword/resetpassword_bloc.dart';
import 'package:delivery_app/modules/auth/presentation/routes/resetpassword_view_initial_params.dart';
import 'package:delivery_app/modules/dashboard/data/datasource/dashboard_remote_data_source.dart';
import 'package:delivery_app/modules/dashboard/data/datasource/dashboard_remote_data_source_impl.dart';
import 'package:delivery_app/modules/dashboard/data/rest_api/dashboard_rest_api_repo.dart';
import 'package:delivery_app/modules/dashboard/domain/repository/dashboard_repo.dart';
import 'package:delivery_app/modules/dashboard/domain/usecase/dashboard_use_case.dart';
import 'package:delivery_app/modules/dashboard/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:delivery_app/modules/dashboard/presentation/routes/dashboard_view_initial_params.dart';
import 'package:delivery_app/modules/dashboard/data/datasource/dashboardhome_remote_data_source.dart';
import 'package:delivery_app/modules/dashboard/data/datasource/dashboardhome_remote_data_source_impl.dart';
import 'package:delivery_app/modules/dashboard/data/rest_api/dashboardhome_rest_api_repo.dart';
import 'package:delivery_app/modules/dashboard/domain/repository/dashboardhome_repo.dart';
import 'package:delivery_app/modules/dashboard/domain/usecase/dashboardhome_use_case.dart';
import 'package:delivery_app/modules/dashboard/presentation/blocs/dashboardhome/dashboardhome_bloc.dart';
import 'package:delivery_app/modules/dashboard/presentation/routes/dashboardhome_view_initial_params.dart';
import 'package:delivery_app/modules/dashboard/data/datasource/dashboardfavourit_remote_data_source.dart';
import 'package:delivery_app/modules/dashboard/data/datasource/dashboardfavourit_remote_data_source_impl.dart';
import 'package:delivery_app/modules/dashboard/data/rest_api/dashboardfavourit_rest_api_repo.dart';
import 'package:delivery_app/modules/dashboard/domain/repository/dashboardfavourit_repo.dart';
import 'package:delivery_app/modules/dashboard/domain/usecase/dashboardfavourit_use_case.dart';
import 'package:delivery_app/modules/dashboard/presentation/blocs/dashboardfavourit/dashboardfavourit_bloc.dart';
import 'package:delivery_app/modules/dashboard/presentation/routes/dashboardfavourit_view_initial_params.dart';
import 'package:delivery_app/modules/dashboard/data/datasource/dashboardcart_remote_data_source.dart';
import 'package:delivery_app/modules/dashboard/data/datasource/dashboardcart_remote_data_source_impl.dart';
import 'package:delivery_app/modules/dashboard/data/rest_api/dashboardcart_rest_api_repo.dart';
import 'package:delivery_app/modules/dashboard/domain/repository/dashboardcart_repo.dart';
import 'package:delivery_app/modules/dashboard/domain/usecase/dashboardcart_use_case.dart';
import 'package:delivery_app/modules/dashboard/presentation/blocs/dashboardcart/dashboardcart_bloc.dart';
import 'package:delivery_app/modules/dashboard/presentation/routes/dashboardcart_view_initial_params.dart';
import 'package:delivery_app/modules/dashboard/data/datasource/dashboardsetting_remote_data_source.dart';
import 'package:delivery_app/modules/dashboard/data/datasource/dashboardsetting_remote_data_source_impl.dart';
import 'package:delivery_app/modules/dashboard/data/rest_api/dashboardsetting_rest_api_repo.dart';
import 'package:delivery_app/modules/dashboard/domain/repository/dashboardsetting_repo.dart';
import 'package:delivery_app/modules/dashboard/domain/usecase/dashboardsetting_use_case.dart';
import 'package:delivery_app/modules/dashboard/presentation/blocs/dashboardsetting/dashboardsetting_bloc.dart';
import 'package:delivery_app/modules/dashboard/presentation/routes/dashboardsetting_view_initial_params.dart';

void getInstance(BuildContext context) {
  getIt = GetIt.instance;
  getIt.registerSingleton<Network>(NetworkService());
  getIt.registerSingleton<AppUrl>(AppUrl());

  // <<<<<<<<<<<<<<<<<<<<<<<  Onboarding  >>>>>>>>>>>>>>>>>>>>>>>
  getIt.registerSingleton<OnboardingRemoteDataSource>(
    OnboardingRemoteDataSourceImpl(getIt(), getIt()),
  );

  getIt.registerSingleton<OnboardingRepo>(OnboardingRestApiRepo(getIt()));

  getIt.registerSingleton<OnboardingUseCase>(OnboardingUseCase(getIt()));

  getIt.registerFactoryParam<
    OnboardingBloc,
    OnboardingViewInitialParams,
    dynamic
  >((params, _) => OnboardingBloc(params, getIt()));

  // <<<<<<<<<<<<<<<<<<<<<<<  Joinus  >>>>>>>>>>>>>>>>>>>>>>>
  getIt.registerSingleton<JoinusRemoteDataSource>(
    JoinusRemoteDataSourceImpl(getIt(), getIt()),
  );

  getIt.registerSingleton<JoinusRepo>(JoinusRestApiRepo(getIt()));

  getIt.registerSingleton<JoinusUseCase>(JoinusUseCase(getIt()));

  getIt.registerFactoryParam<JoinusBloc, JoinusViewInitialParams, dynamic>(
    (params, _) => JoinusBloc(params, getIt()),
  );
  // <<<<<<<<<<<<<<<<<<<<<<<  Login  >>>>>>>>>>>>>>>>>>>>>>>
  getIt.registerSingleton<LoginRemoteDataSource>(
    LoginRemoteDataSourceImpl(getIt(), getIt()),
  );

  getIt.registerSingleton<LoginRepo>(LoginRestApiRepo(getIt()));

  getIt.registerSingleton<LoginUseCase>(LoginUseCase(getIt()));

  getIt.registerFactoryParam<LoginBloc, LoginViewInitialParams, dynamic>(
    (params, _) => LoginBloc(params, getIt()),
  );

  // <<<<<<<<<<<<<<<<<<<<<<<  Signup  >>>>>>>>>>>>>>>>>>>>>>>
  getIt.registerSingleton<SignupRemoteDataSource>(
    SignupRemoteDataSourceImpl(getIt(), getIt()),
  );

  getIt.registerSingleton<SignupRepo>(SignupRestApiRepo(getIt()));

  getIt.registerSingleton<SignupUseCase>(SignupUseCase(getIt()));

  getIt.registerFactoryParam<SignupBloc, SignupViewInitialParams, dynamic>(
    (params, _) => SignupBloc(params, getIt()),
  );

  // <<<<<<<<<<<<<<<<<<<<<<<  Forgetpassword  >>>>>>>>>>>>>>>>>>>>>>>
  getIt.registerSingleton<ForgetpasswordRemoteDataSource>(
    ForgetpasswordRemoteDataSourceImpl(getIt(), getIt()),
  );

  getIt.registerSingleton<ForgetpasswordRepo>(
    ForgetpasswordRestApiRepo(getIt()),
  );

  getIt.registerSingleton<ForgetpasswordUseCase>(
    ForgetpasswordUseCase(getIt()),
  );

  getIt.registerFactoryParam<
    ForgetpasswordBloc,
    ForgetpasswordViewInitialParams,
    dynamic
  >((params, _) => ForgetpasswordBloc(params, getIt()));

  // <<<<<<<<<<<<<<<<<<<<<<<  Otpverify  >>>>>>>>>>>>>>>>>>>>>>>
  getIt.registerSingleton<OtpverifyRemoteDataSource>(
    OtpverifyRemoteDataSourceImpl(getIt(), getIt()),
  );

  getIt.registerSingleton<OtpverifyRepo>(OtpverifyRestApiRepo(getIt()));

  getIt.registerSingleton<OtpverifyUseCase>(OtpverifyUseCase(getIt()));

  getIt
      .registerFactoryParam<OtpverifyBloc, OtpverifyViewInitialParams, dynamic>(
        (params, _) => OtpverifyBloc(params, getIt()),
      );

  // <<<<<<<<<<<<<<<<<<<<<<<  Resetpassword  >>>>>>>>>>>>>>>>>>>>>>>
  getIt.registerSingleton<ResetpasswordRemoteDataSource>(
    ResetpasswordRemoteDataSourceImpl(getIt(), getIt()),
  );

  getIt.registerSingleton<ResetpasswordRepo>(ResetpasswordRestApiRepo(getIt()));

  getIt.registerSingleton<ResetpasswordUseCase>(ResetpasswordUseCase(getIt()));

  getIt.registerFactoryParam<
    ResetpasswordBloc,
    ResetpasswordViewInitialParams,
    dynamic
  >((params, _) => ResetpasswordBloc(params, getIt()));

  // <<<<<<<<<<<<<<<<<<<<<<<  Dashboard  >>>>>>>>>>>>>>>>>>>>>>>
  getIt.registerSingleton<DashboardRemoteDataSource>(
    DashboardRemoteDataSourceImpl(getIt(), getIt()),
  );

  getIt.registerSingleton<DashboardRepo>(DashboardRestApiRepo(getIt()));

  getIt.registerSingleton<DashboardUseCase>(DashboardUseCase(getIt()));

  getIt
      .registerFactoryParam<DashboardBloc, DashboardViewInitialParams, dynamic>(
        (params, _) => DashboardBloc(params, getIt()),
      );

  // <<<<<<<<<<<<<<<<<<<<<<<  Dashboardhome  >>>>>>>>>>>>>>>>>>>>>>>
  getIt.registerSingleton<DashboardhomeRemoteDataSource>(
    DashboardhomeRemoteDataSourceImpl(getIt(), getIt()),
  );

  getIt.registerSingleton<DashboardhomeRepo>(DashboardhomeRestApiRepo(getIt()));

  getIt.registerSingleton<DashboardhomeUseCase>(DashboardhomeUseCase(getIt()));

  getIt.registerFactoryParam<
    DashboardhomeBloc,
    DashboardhomeViewInitialParams,
    dynamic
  >((params, _) => DashboardhomeBloc(params, getIt()));

  // <<<<<<<<<<<<<<<<<<<<<<<  Dashboardfavourit  >>>>>>>>>>>>>>>>>>>>>>>
  getIt.registerSingleton<DashboardfavouritRemoteDataSource>(
    DashboardfavouritRemoteDataSourceImpl(getIt(), getIt()),
  );

  getIt.registerSingleton<DashboardfavouritRepo>(
    DashboardfavouritRestApiRepo(getIt()),
  );

  getIt.registerSingleton<DashboardfavouritUseCase>(
    DashboardfavouritUseCase(getIt()),
  );

  getIt.registerFactoryParam<
    DashboardfavouritBloc,
    DashboardfavouritViewInitialParams,
    dynamic
  >((params, _) => DashboardfavouritBloc(params, getIt()));
  // <<<<<<<<<<<<<<<<<<<<<<<  Dashboardcart  >>>>>>>>>>>>>>>>>>>>>>>
  getIt.registerSingleton<DashboardcartRemoteDataSource>(
    DashboardcartRemoteDataSourceImpl(getIt(), getIt()),
  );

  getIt.registerSingleton<DashboardcartRepo>(DashboardcartRestApiRepo(getIt()));

  getIt.registerSingleton<DashboardcartUseCase>(DashboardcartUseCase(getIt()));

  getIt.registerFactoryParam<
    DashboardcartBloc,
    DashboardcartViewInitialParams,
    dynamic
  >((params, _) => DashboardcartBloc(params, getIt()));
  // <<<<<<<<<<<<<<<<<<<<<<<  Dashboardsetting  >>>>>>>>>>>>>>>>>>>>>>>
  getIt.registerSingleton<DashboardsettingRemoteDataSource>(
    DashboardsettingRemoteDataSourceImpl(getIt(), getIt()),
  );

  getIt.registerSingleton<DashboardsettingRepo>(
    DashboardsettingRestApiRepo(getIt()),
  );

  getIt.registerSingleton<DashboardsettingUseCase>(
    DashboardsettingUseCase(getIt()),
  );

  getIt.registerFactoryParam<
    DashboardsettingBloc,
    DashboardsettingViewInitialParams,
    dynamic
  >((params, _) => DashboardsettingBloc(params, getIt()));
}
