class JoinusEntity {
  final String userMessage;
  final bool status;

  JoinusEntity({
    required this.userMessage,
    required this.status,
  });

  JoinusEntity copyWith({
    String? userMessage,
    bool? status,
  }) {
    return JoinusEntity(
      userMessage: userMessage ?? this.userMessage,
      status: status ?? this.status,
    );
  }
}
