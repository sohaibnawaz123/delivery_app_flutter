class MyordersEntity {
  final String userMessage;
  final bool status;

  MyordersEntity({
    required this.userMessage,
    required this.status,
  });

  MyordersEntity copyWith({
    String? userMessage,
    bool? status,
  }) {
    return MyordersEntity(
      userMessage: userMessage ?? this.userMessage,
      status: status ?? this.status,
    );
  }
}
