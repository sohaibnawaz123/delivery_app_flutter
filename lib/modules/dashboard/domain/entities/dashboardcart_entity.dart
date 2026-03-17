class DashboardcartEntity {
  final String userMessage;
  final bool status;

  DashboardcartEntity({
    required this.userMessage,
    required this.status,
  });

  DashboardcartEntity copyWith({
    String? userMessage,
    bool? status,
  }) {
    return DashboardcartEntity(
      userMessage: userMessage ?? this.userMessage,
      status: status ?? this.status,
    );
  }
}
