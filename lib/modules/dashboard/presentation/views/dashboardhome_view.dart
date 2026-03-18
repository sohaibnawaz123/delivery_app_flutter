import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/banner_card.dart';
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
  List<BannerEntity> get banners => [
    BannerEntity(
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
      title: 'Special Offer!',
      description: 'Get 20% off on your first order.',
    ),
    BannerEntity(
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
      title: 'New Arrivals!',
      description: 'Check out our new menu items.',
    ),
    BannerEntity(
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
      title: 'Free Delivery!',
      description: 'Enjoy free delivery on orders over \$50.',
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
          SizedBox(height: 200, child: BannerSection(banners: banners)),

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

class BannerSection extends StatefulWidget {
  final List<BannerEntity> banners;

  const BannerSection({super.key, required this.banners});

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  final PageController _controller = PageController(viewportFraction: 1);
  double currentPage = 0;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page ?? 0;
      });
    });

    autoScroll();
  }

  void autoScroll() async {
    while (mounted) {
      await Future.delayed(const Duration(seconds: 6));

      int nextPage = (_controller.page ?? 0).round() + 1;

      if (nextPage >= widget.banners.length) {
        nextPage = 0;
      }

      _controller.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) return const SizedBox();

    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.banners.length,
            itemBuilder: (context, index) {
              double scale = (1 - (currentPage - index).abs()).clamp(0.9, 1.0);
              double opacity = (1 - (currentPage - index).abs()).clamp(
                0.5,
                1.0,
              );

              return Transform.scale(
                scale: scale,
                child: Opacity(
                  opacity: opacity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: BannerCard(banner: widget.banners[index]),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 10),

        // Dots Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.banners.length, (index) {
            bool isActive = (currentPage.round() == index);

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: isActive ? 16 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: isActive ? AppColor.primary : AppColor.primary.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }),
        ),
      ],
    );
  }
}
