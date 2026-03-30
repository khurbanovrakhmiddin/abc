import 'package:equatable/equatable.dart';

class BusinessEntity extends Equatable {
  final String id;
  final String name;
  final String type;

  const BusinessEntity({required this.id, required this.name, required this.type});

  @override
  List<Object?> get props => [id, name, type];
}