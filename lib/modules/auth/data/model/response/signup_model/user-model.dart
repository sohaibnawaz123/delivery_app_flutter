import 'package:delivery_app/modules/auth/data/model/response/signup_model/metadata-model.dart';
import 'package:delivery_app/modules/auth/domain/entities/signup-entities/metadata_entity.dart';
import 'package:delivery_app/modules/auth/domain/entities/signup-entities/user_entity.dart';

class UserModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? fcmToken;
  final String? deviceToken;
  final bool? isEmailVerified;
  final MetadataModel? metadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.fcmToken,
    this.deviceToken,
    this.isEmailVerified,
    this.metadata,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString(),
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      fcmToken: json['fcm_token'],
      deviceToken: json['device_token'],
      isEmailVerified: json['is_email_verified'],
      metadata: json['metadata'] == null
          ? null
          : MetadataModel.fromJson(json['metadata']),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'first_name': firstName,
    'last_name': lastName,
    'email': email,
    'phone_number': phoneNumber,
    'fcm_token': fcmToken,
    'device_token': deviceToken,
    'is_email_verified': isEmailVerified,
    'metadata': metadata?.toJson(),
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };
  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? fcmToken,
    String? deviceToken,
    bool? isEmailVerified,
    MetadataModel? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
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

  UserEntity toEntity() {
    return UserEntity(
      id: id ?? '',
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      email: email ?? '',
      phoneNumber: phoneNumber ?? '',
      fcmToken: fcmToken ?? '',
      deviceToken: deviceToken ?? '',
      isEmailVerified: isEmailVerified ?? false,
      metadata: metadata?.toEntity() ?? MetadataEntity.empty(),
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }
}
