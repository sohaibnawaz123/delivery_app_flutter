class OtpverifyEntity {
  final String userMessage;
  final bool status;

  OtpverifyEntity({
    required this.userMessage,
    required this.status,
  });

  OtpverifyEntity copyWith({
    String? userMessage,
    bool? status,
  }) {
    return OtpverifyEntity(
      userMessage: userMessage ?? this.userMessage,
      status: status ?? this.status,
    );
  }
}
