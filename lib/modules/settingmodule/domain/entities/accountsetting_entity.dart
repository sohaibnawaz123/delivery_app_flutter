class AccountsettingEntity {
  final String userMessage;
  final bool status;

  AccountsettingEntity({
    required this.userMessage,
    required this.status,
  });

  AccountsettingEntity copyWith({
    String? userMessage,
    bool? status,
  }) {
    return AccountsettingEntity(
      userMessage: userMessage ?? this.userMessage,
      status: status ?? this.status,
    );
  }
}
