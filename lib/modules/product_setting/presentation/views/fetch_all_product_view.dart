import 'package:delivery_app/modules/dashboard/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/product_setting/presentation/blocs/fetch_all_product/fetch_all_product_bloc.dart';


class FetchAllProductView extends StatefulWidget {
  final FetchAllProductBloc bloc;
  final List<ProductEntity> products;
  final String? category;
  final String? title;
  const FetchAllProductView({
    super.key,
    required this.bloc,
    required this.products,
    this.category,
    this.title,
  });

  @override
  State<FetchAllProductView> createState() => _FetchAllProductViewState();
}

class _FetchAllProductViewState extends State<FetchAllProductView> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.base,

      
    );
  
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}