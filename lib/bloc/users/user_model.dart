import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String name;
  final String email;

  const UserModel({required this.id, required this.name, required this.email});

  @override
  // TODO: implement props
  List<Object?> get props => [name, email, id];

  static List<UserModel> users = [
    const UserModel(
        id: 5454, name: 'alesson', email: 'asn9006@hotmail'),
    const UserModel(id: 9895, name: 'marcos', email: 'marcos@hotmail'),
  ];
}
