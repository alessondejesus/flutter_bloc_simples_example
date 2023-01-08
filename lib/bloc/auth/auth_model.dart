import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
  final String name;
  final String email;
  final String token;

  const AuthModel(
      {required this.name, required this.email, required this.token});

  @override
  // TODO: implement props
  List<Object?> get props => [name, email, token];

  static List<AuthModel> pizzas = [
    const AuthModel(name: 'alesson', email: 'asn9006@hotmail', token: 'meu_token_kkk'),
    const AuthModel(name: 'marcos', email: 'marcos@hotmail', token: 'meu_token_kkk'),
  ];
}
