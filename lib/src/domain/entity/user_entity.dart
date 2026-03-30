import 'package:equatable/equatable.dart';

import 'business_entity.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final List<BusinessEntity> businesses;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.businesses,
  });

  @override
  List<Object?> get props => [id, name, email, businesses];
}