class BaseEntity<T> {
  final bool success;
  final String message;
  final T? data;

  BaseEntity({required this.success, required this.message, this.data});

  BaseEntity<T> copyWith(bool? success, String? message, T? data) {
    return BaseEntity(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
