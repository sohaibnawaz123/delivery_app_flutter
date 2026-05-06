import 'package:delivery_app/modules/auth/domain/entities/signup-entities/metadata_entity.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String fcmToken;
  final String deviceToken;
  final bool isEmailVerified;
  final MetadataEntity metadata;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.fcmToken,
    required this.deviceToken,
    required this.isEmailVerified,
    required this.metadata,
    required this.createdAt,
    required this.updatedAt,
  });

  UserEntity copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? fcmToken,
    String? deviceToken,
    bool? isEmailVerified,
    MetadataEntity? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserEntity(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      fcmToken: fcmToken ?? this.fcmToken,
      deviceToken: deviceToken ?? this.deviceToken,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'UserEntity(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, fcmToken: $fcmToken, deviceToken: $deviceToken, isEmailVerified: $isEmailVerified, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory UserEntity.empty() {
    return UserEntity(
      id: '',
      firstName: '',
      lastName: '',
      email: '',
      phoneNumber: '',
      fcmToken: '',
      deviceToken: '',
      isEmailVerified: false,
      metadata: MetadataEntity.empty(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    email,
    phoneNumber,
    fcmToken,
    deviceToken,
    isEmailVerified,
    metadata,
    createdAt,
    updatedAt,
  ];
}
