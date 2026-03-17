class DashboardsettingEntity {
  final String userMessage;
  final bool status;

  DashboardsettingEntity({
    required this.userMessage,
    required this.status,
  });

  DashboardsettingEntity copyWith({
    String? userMessage,
    bool? status,
  }) {
    return DashboardsettingEntity(
      userMessage: userMessage ?? this.userMessage,
      status: status ?? this.status,
    );
  }
}
