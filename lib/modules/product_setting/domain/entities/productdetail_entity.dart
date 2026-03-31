class ProductdetailEntity {
  final String userMessage;
  final bool status;

  ProductdetailEntity({
    required this.userMessage,
    required this.status,
  });

  ProductdetailEntity copyWith({
    String? userMessage,
    bool? status,
  }) {
    return ProductdetailEntity(
      userMessage: userMessage ?? this.userMessage,
      status: status ?? this.status,
    );
  }
}
