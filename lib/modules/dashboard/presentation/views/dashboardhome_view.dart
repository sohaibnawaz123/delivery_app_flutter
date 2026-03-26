import 'package:delivery_app/component/text/content.dart';
import 'package:delivery_app/core/utils/extension/app_edge_insets.dart';
import 'package:delivery_app/core/utils/extension/app_navigation.dart';
import 'package:delivery_app/core/utils/extension/app_text_style.dart';
import 'package:delivery_app/main.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/banner_card.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/category_card.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/home_header.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/product_card.dart';
import 'package:delivery_app/modules/dashboard/presentation/widgets/search_filter.dart';
import 'package:delivery_app/modules/product_setting/presentation/blocs/fetch_all_product/fetch_all_product_bloc.dart';
import 'package:delivery_app/modules/product_setting/presentation/routes/fetch_all_product_view_initial_params.dart';
import 'package:delivery_app/modules/product_setting/presentation/views/fetch_all_product_view.dart';
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

  List<ProductEntity> get products => [
    ProductEntity(
      name: 'Margherita Pizza',
      description: 'Classic pizza with tomato sauce, mozzarella, and basil.',
      price: 8.99,
      isFavorite: false,
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
      id: '1',
      category: 'Pizza',
      rating: 4.5,
    ),
    ProductEntity(
      name: 'Cheeseburger',
      description: 'Juicy beef patty with cheese, lettuce, and tomato.',
      price: 6.49,
      isFavorite: true,
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
      id: '2',
      category: 'Burger',
      rating: 4.0,
    ),
    ProductEntity(
      name: 'California Roll',
      description: 'Sushi roll with crab, avocado, and cucumber.',
      price: 12.99,
      isFavorite: false,
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
      id: '3',
      category: 'Sushi',
      rating: 4.8,
    ),
    ProductEntity(
      name: 'Chocolate Cake',
      description: 'Rich chocolate cake with creamy frosting.',
      price: 5.99,
      isFavorite: true,
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
      id: '4',
      category: 'Dessert',
      rating: 4.7,
    ),
    ProductEntity(
      name: 'Caesar Salad',
      description:
          'Fresh romaine lettuce with Caesar dressing, croutons, and Parmesan cheese.',
      price: 7.99,
      isFavorite: false,
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
      id: '5',
      category: 'Salad',
      rating: 4.3,
    ),
    ProductEntity(
      name: 'Spaghetti Carbonara',
      description:
          'Classic Italian pasta with eggs, cheese, pancetta, and pepper.',
      price: 10.99,
      isFavorite: true,
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
      id: '6',
      category: 'Pasta',
      rating: 4.6,
    ),
    ProductEntity(
      name: 'Grilled Steak',
      description: 'Tender grilled steak with garlic butter.',
      price: 18.99,
      isFavorite: false,
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
      id: '7',
      category: 'Steak',
      rating: 4.9,
    ),
    ProductEntity(
      name: 'Shrimp Scampi',
      description: 'Sautéed shrimp in garlic butter sauce with linguine.',
      price: 14.99,
      isFavorite: true,
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
      id: '8',
      category: 'Seafood',
      rating: 4.4,
    ),
    ProductEntity(
      name: 'Vegan Burger',
      description: 'Plant-based patty with lettuce, tomato, and vegan mayo.',
      price: 9.99,
      isFavorite: false,
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
      id: '9',
      category: 'Vegan',
      rating: 4.2,
    ),
    ProductEntity(
      name: 'Pancakes',
      description: 'Fluffy pancakes served with syrup and butter.',
      price: 6.99,
      isFavorite: true,
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
      id: '10',
      category: 'Breakfast',
      rating: 4.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.pagePadding.left,
        MediaQuery.of(context).viewInsets.top + context.pagePadding.top,
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
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Content(
                data: 'Popular Dishes',
                textStyle: context.headingText.copyWith(
                  color: AppColor.primaryText,
                  fontWeight: FontWeight.w600,
                ),
                size: 22,
              ),
              TextButton(
                onPressed: () {
                  context.pushPage(
                    FetchAllProductView(
                      bloc: getIt<FetchAllProductBloc>(
                        param1: FetchAllProductViewInitialParams(),
                      ),
                      products: products,
                      title: "All Popular Dishes",
                    ),
                  );
                },
                child: Content(
                  data: 'See All',
                  textStyle: context.bodyText.copyWith(color: AppColor.primary),
                ),
              ),
            ],
          ),
          ProductSection(products: products),
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
                color: isActive
                    ? AppColor.primary
                    : AppColor.primary.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class ProductSection extends StatelessWidget {
  const ProductSection({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.pushPage(
                FetchAllProductView(
                  bloc: getIt<FetchAllProductBloc>(
                    param1: FetchAllProductViewInitialParams(),
                  ),
                  products: products,
                  title: "${products[index].category} Specials",
                  category: products[index].category,
                ),
              );
            },
            child: ProductCard(product: products[index]),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 16),
      ),
    );
  }
}
