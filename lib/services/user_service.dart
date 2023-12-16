import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financas_app/models/user_model.dart';

class UserService {
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> createUser(UserModel user) async {
    return await userCollection.doc(user.id).set({
      'email': user.email,
      'password': user.password,
      'name': user.name,
      'cpf': user.cpf,
      'phone': user.phone,
    });
  }

  Future<void> updateUser(String id, UserModel user) async {
    return await userCollection.doc(id).update({
      'name': user.name,
      'email': user.email,
      'cpf': user.cpf,
      'phone': user.phone,
      'password': user.password,
    });
  }

  Future<void> deleteUser(String id) async {
    return await userCollection.doc(id).delete();
  }

  Future<UserModel> getUser(String id) async {
    DocumentSnapshot doc = await userCollection.doc(id).get();
    return UserModel(
      email: doc['email'],
      password: doc['password'],
      id: doc.id,
      name: doc['name'],
      cpf: doc['cpf'],
      phone: doc['phone'],
    );
  }
}
