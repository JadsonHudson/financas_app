class UserModel {
  final String id;
  final String? name;
  final String email;
  final String? cpf;
  final String? phone;
  final String password;

  UserModel(
      {required this.id,
      required this.email,
      required this.password,
      this.name = '',
      this.cpf = '',
      this.phone = ''});
}
