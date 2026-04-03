class ProductDemo {
  final String name;
  final String category;
  final String description;
  final double price;
  final double rating;
  final List<String> imageUrls;
  final List<String> sizes;
  final List<ReviewDemo> reviews;

  ProductDemo({
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.rating,
    required this.imageUrls,
    required this.sizes,
    required this.reviews,
  });
}

class ReviewDemo {
  final String userName;
  final double rating;
  final String comment;

  ReviewDemo({
    required this.userName,
    required this.rating,
    required this.comment,
  });
}

final demoProduct = ProductDemo(
  name: "Pizza Margherita",
  category: "Italian Food",
  description: "Classic pizza with tomato sauce, mozzarella, and basil.",
  price: 50.0,
  rating: 4.5,
  imageUrls: [
    "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=600&q=80",
    "https://images.unsplash.com/photo-1465101046530-73398c7f28ca?auto=format&fit=crop&w=600&q=80",
    "https://images.unsplash.com/photo-1519125323398-675f0ddb6308?auto=format&fit=crop&w=600&q=80",
  ],
  sizes: ['12"', '14"', '16"', '18"'],
  reviews: [
    ReviewDemo(userName: "John Doe", rating: 4.5, comment: "Great product!"),
    ReviewDemo(userName: "Jane Smith", rating: 5.0, comment: "Delicious and fresh."),
    ReviewDemo(userName: "Alex Lee", rating: 4.0, comment: "Tasty but a bit salty."),
    ReviewDemo(userName: "Maria Garcia", rating: 3.5, comment: "Good, but delivery was late."),
    ReviewDemo(userName: "Chris Evans", rating: 5.0, comment: "Best pizza in town!"),
  ],
);
