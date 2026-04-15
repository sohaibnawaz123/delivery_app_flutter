class PrivacysettingEntity {
  final String userMessage;
  final bool status;

  PrivacysettingEntity({
    required this.userMessage,
    required this.status,
  });

  PrivacysettingEntity copyWith({
    String? userMessage,
    bool? status,
  }) {
    return PrivacysettingEntity(
      userMessage: userMessage ?? this.userMessage,
      status: status ?? this.status,
    );
  }
}
