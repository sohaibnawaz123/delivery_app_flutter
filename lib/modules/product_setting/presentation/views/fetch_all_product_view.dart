import 'package:delivery_app/component/app_bar/custome_header_widget.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_navigation.dart';
import 'package:delivery_app/main.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/product_card.dart';
import 'package:delivery_app/modules/product_setting/presentation/blocs/productdetail/productdetail_bloc.dart';
import 'package:delivery_app/modules/product_setting/presentation/routes/productdetail_view_initial_params.dart';
import 'package:delivery_app/modules/product_setting/presentation/views/productdetail_view.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: AppColor.white,
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          context.pagePadding.left,
          MediaQuery.of(context).viewInsets.top + context.pagePadding.top,
          context.pagePadding.right,
          context.pagePadding.bottom,
        ),
        children: [
          HeaderWidget(title: widget.title, category: widget.category),
          SizedBox(height: 15),
          ProductGridSection(products: widget.products),
        ],
      ),
    );
  }
}

class ProductGridSection extends StatelessWidget {
  const ProductGridSection({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => context.pushPage(
            ProductdetailView(
              bloc: getIt<ProductdetailBloc>(
                param1: ProductdetailViewInitialParams(),
              ),
            ),
          ),
          child: ProductCard(product: products[index]),
        );
      },
    );
  }
}
