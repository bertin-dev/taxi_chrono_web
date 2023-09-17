


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi_chrono_web/models/user_account_model.dart';

class Customer extends UserAccount {

  int? tickets;

  Customer({
    String? id,
    String? expireCniDate,
    String? userAdresse,
    String? userCni,
    String? userEmail,
    String? userName,
    String? userTelephone,
    bool? access,
    String? cniRecto,
    String? cniVerso,
    String? code,
    String? dateNaissance,
    String? password,
    String? pays,
    String? photo,
    String? quartier,
    String? sexe,
    String? type,
    String? createdAt,
    String? updatedAt,
    this.tickets
  }) : super(id: id, expireCniDate: expireCniDate,
    userAdresse: userAdresse, userCni: userCni, userEmail: userEmail,
    userName: userName, userTelephone: userTelephone, access: access,
    cniRecto: cniRecto, cniVerso: cniVerso, code: code, dateNaissance: dateNaissance,
    password: password, pays: pays, photo: photo, quartier: quartier, sexe: sexe,
    type: type, createdAt: createdAt, updatedAt: updatedAt,);


  @override
  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "expireCniDate": expireCniDate,
      "userAdresse": userAdresse,
      "userCni": userCni,
      "userEmail": userEmail,
      "userName": userName,
      "userTelephone": userTelephone,

      "access": access,
      "cni_recto": cniRecto,
      "cni_verso": cniVerso,
      "code": code,
      "date_naissance": dateNaissance,
      "password": password,
      "pays": pays,
      "photo": photo,
      "quartier": quartier,
      "sexe": sexe,
      "type": type,
      "created_at": createdAt,
      "updatedAt": updatedAt,

      "email": userEmail,
      "expirationCni": expireCniDate,
      "nom": userName,
      "cni": userCni,
      "tel": userTelephone,
      "tickets" : tickets,
    };
  }

  factory Customer.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return Customer(
        id: document.id,
        expireCniDate: data["expiration_cni"] ?? data["expireCniDate"],
        userAdresse: data["userAdresse"],
        userCni: data["cni"] ?? data["userCni"],
        userEmail: data["email"] ?? data["userEmail"],
        userName: data["nom"] ?? data["userName"],
        userTelephone: data["tel"] ?? data["userTelephone"],

        access: data["access"],
        cniRecto: data["cni_recto"],
        cniVerso: data["cni_verso"],
        code: data["code"],
        dateNaissance: data["date_naissance"],
        password: data["password"],
        pays: data["pays"],
        photo: data["photo"],
        quartier: data["quartier"],
        sexe: data["sexe"],
        type: data["type"],
        createdAt: data["created_at"],
        updatedAt: data["updated_at"],
        tickets: data["tickets"],
    );
  }
}