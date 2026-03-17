import 'package:delivery_app/core/utils/extension/app_font_weight.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_asset.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/component/navbar/app_bottom_bar_item.dart';
import 'package:delivery_app/main.dart';
import 'package:delivery_app/modules/dashboard/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:delivery_app/modules/dashboard/presentation/blocs/dashboardcart/dashboardcart_bloc.dart';
import 'package:delivery_app/modules/dashboard/presentation/blocs/dashboardfavourit/dashboardfavourit_bloc.dart';
import 'package:delivery_app/modules/dashboard/presentation/blocs/dashboardhome/dashboardhome_bloc.dart';
import 'package:delivery_app/modules/dashboard/presentation/blocs/dashboardsetting/dashboardsetting_bloc.dart';
import 'package:delivery_app/modules/dashboard/presentation/routes/dashboardcart_view_initial_params.dart';
import 'package:delivery_app/modules/dashboard/presentation/routes/dashboardfavourit_view_initial_params.dart';
import 'package:delivery_app/modules/dashboard/presentation/routes/dashboardhome_view_initial_params.dart';
import 'package:delivery_app/modules/dashboard/presentation/routes/dashboardsetting_view_initial_params.dart';
import 'package:delivery_app/modules/dashboard/presentation/views/dashboardcart_view.dart';
import 'package:delivery_app/modules/dashboard/presentation/views/dashboardfavourit_view.dart';
import 'package:delivery_app/modules/dashboard/presentation/views/dashboardhome_view.dart';
import 'package:delivery_app/modules/dashboard/presentation/views/dashboardsetting_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatefulWidget {
  final DashboardBloc bloc;
  const DashboardView({
    super.key,
    required this.bloc,
  });

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late final DashboardhomeBloc _dashboardhomeBloc;
  late final DashboardfavouritBloc _dashboardfavouritBloc;
  late final DashboardcartBloc _dashboardcartBloc;
  late final DashboardsettingBloc _dashboardsettingBloc;
  late final List<Widget> _pages;
  late final List<AppBottomBarItem> _bottomBarItems;

  @override
  void initState() {
    super.initState();

    _dashboardhomeBloc = getIt<DashboardhomeBloc>(
      param1: const DashboardhomeViewInitialParams(),
    );
    _dashboardfavouritBloc = getIt<DashboardfavouritBloc>(
      param1: const DashboardfavouritViewInitialParams(),
    );
    _dashboardcartBloc = getIt<DashboardcartBloc>(
      param1: const DashboardcartViewInitialParams(),
    );
    _dashboardsettingBloc = getIt<DashboardsettingBloc>(
      param1: const DashboardsettingViewInitialParams(),
    );

    _pages = [
      DashboardhomeView(bloc: _dashboardhomeBloc),
      DashboardfavouritView(bloc: _dashboardfavouritBloc),
      DashboardcartView(bloc: _dashboardcartBloc),
      DashboardsettingView(bloc: _dashboardsettingBloc),
    ];

    _bottomBarItems = const [
      AppBottomBarItem(
        label: 'Home',
        icon: AppAsset.homeOutline,
        activeIcon: AppAsset.home,
      ),
      AppBottomBarItem(
        label: 'Favourit',
        icon: AppAsset.favouritOutline,
        activeIcon: AppAsset.favourit,
      ),
      AppBottomBarItem(
        label: 'Cart',
        icon: AppAsset.cartOutline,
        activeIcon: AppAsset.cart,
      ),
      AppBottomBarItem(
        label: 'Setting',
        icon: AppAsset.settingOutline,
        activeIcon: AppAsset.setting,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.bloc,
      child: BlocBuilder<DashboardBloc, DashboardState>(
        buildWhen: (previous, current) =>
            previous.currentIndex != current.currentIndex,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColor.white,
            body: IndexedStack(index: state.currentIndex, children: _pages),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: AppColor.highlight.withOpacity(0.3),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColor.primary.withOpacity(0.5)),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.black.withOpacity(0.05),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                ),
                child: BottomNavigationBar(
                  currentIndex: state.currentIndex,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: AppColor.primary,
                  unselectedItemColor: AppColor.secondaryText,
                  backgroundColor: Colors.transparent,
                  unselectedLabelStyle: context.bodyText.copyWith(color: AppColor.black,fontSize: 12, fontWeight: AppFontWeight.medium),
                  selectedLabelStyle: context.bodyText.copyWith(color: AppColor.primary,fontSize: 12, fontWeight: AppFontWeight.semiBold),
                  elevation: 0,
                  onTap: (index) {
                    context.read<DashboardBloc>().add(
                      OnDashboardTabChangedEvent(index),
                    );
                  },
                  items: _bottomBarItems
                      .map((item) => item.toBottomNavigationBarItem())
                      .toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
