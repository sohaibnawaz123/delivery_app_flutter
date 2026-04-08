class CheckoutEntity {
  final String userMessage;
  final bool status;

  CheckoutEntity({
    required this.userMessage,
    required this.status,
  });

  CheckoutEntity copyWith({
    String? userMessage,
    bool? status,
  }) {
    return CheckoutEntity(
      userMessage: userMessage ?? this.userMessage,
      status: status ?? this.status,
    );
  }
}
