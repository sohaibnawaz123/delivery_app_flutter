class FetchAllProductEntity {
  final String userMessage;
  final bool status;

  FetchAllProductEntity({
    required this.userMessage,
    required this.status,
  });

  FetchAllProductEntity copyWith({
    String? userMessage,
    bool? status,
  }) {
    return FetchAllProductEntity(
      userMessage: userMessage ?? this.userMessage,
      status: status ?? this.status,
    );
  }
}
