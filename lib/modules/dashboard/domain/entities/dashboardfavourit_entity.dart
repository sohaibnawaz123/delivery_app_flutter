class DashboardfavouritEntity {
  final String userMessage;
  final bool status;

  DashboardfavouritEntity({
    required this.userMessage,
    required this.status,
  });

  DashboardfavouritEntity copyWith({
    String? userMessage,
    bool? status,
  }) {
    return DashboardfavouritEntity(
      userMessage: userMessage ?? this.userMessage,
      status: status ?? this.status,
    );
  }
}
