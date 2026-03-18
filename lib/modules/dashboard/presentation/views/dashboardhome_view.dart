import 'dart:math';

import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/category_card.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/home_header.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/search_filter.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/core/resource/app_color.dart';
import 'package:delivery_app/modules/dashboard/presentation/blocs/dashboardhome/dashboardhome_bloc.dart';

class DashboardhomeView extends StatelessWidget {
  final DashboardhomeBloc bloc;
  const DashboardhomeView({super.key, required this.bloc});

  List<CategoryEntity> get categories => [
    CategoryEntity(
      name: 'Pizza',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
    ),
    CategoryEntity(
      name: 'Burger',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
    ),
    CategoryEntity(
      name: 'Sushi',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
    ),
    CategoryEntity(
      name: 'Dessert',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
    ),
    CategoryEntity(
      name: 'Drinks',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
    ),
    CategoryEntity(
      name: 'Salad',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
    ),
    CategoryEntity(
      name: 'Pasta',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
    ),
    CategoryEntity(
      name: 'Steak',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
    ),
    CategoryEntity(
      name: 'Seafood',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
    ),
    CategoryEntity(
      name: 'Vegan',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
    ),
    CategoryEntity(
      name: 'Breakfast',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.pagePadding.left,
        MediaQuery.of(context).padding.top,
        context.pagePadding.right,
        context.pagePadding.bottom,
      ),
      child: ListView(
        children: [
          HomeHeader(),
          SizedBox(height: 20),
          Content(
            data: 'Ready to order?',
            textStyle: context.headingText.copyWith(
              color: AppColor.primaryText,
              fontWeight: FontWeight.w600,
            ),
            size: 28,
          ),
          SizedBox(height: 5),
          SearchFilter(),
          SizedBox(height: 15),
          SizedBox(height: 85, child: CategorySection(category: categories)),
          SizedBox(height: 15),
          // BannerSection(),
          
        ],
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  final List<CategoryEntity> category;
  const CategorySection({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: category.length,
      itemBuilder: (context, index) {
        return CategoryCard(category: category[index]);
      },
      separatorBuilder: (context, index) => SizedBox(width: 10),
    );
  }
}
