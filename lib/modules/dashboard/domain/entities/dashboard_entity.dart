class DashboardEntity {
  final String userMessage;
  final bool status;

  DashboardEntity({
    required this.userMessage,
    required this.status,
  });

  DashboardEntity copyWith({
    String? userMessage,
    bool? status,
  }) {
    return DashboardEntity(
      userMessage: userMessage ?? this.userMessage,
      status: status ?? this.status,
    );
  }
}
