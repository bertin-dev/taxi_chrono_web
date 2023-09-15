

import 'package:cloud_firestore/cloud_firestore.dart';

class User {

  String? id;
  String? expireCniDate;
  String? userAdresse;
  String? userCni;
  String? userEmail;
  String? userName;
  String? userTelephone;
  String? userid;

  User({
    this.id,
    this.expireCniDate,
    this.userAdresse,
    this.userCni,
    this.userEmail,
    this.userName,
    this.userTelephone,
    this.userid
  });

  User.fromMap(Map map) : this(
      id: map.containsKey('id') ? map['id'] : null,
      expireCniDate: map.containsKey('expireCniDate') ? map['expireCniDate'] : null,
      userAdresse: map.containsKey('userAdresse') ? map['userAdresse'] : null,
      userCni: map.containsKey('userCni') ? map['userCni'] : null,
      userEmail: map.containsKey('userEmail') ? map['userEmail'] : null,
      userName: map.containsKey('userName') ? map['userName'] : null,
      userTelephone: map.containsKey('userTelephone') ? map['userTelephone'] : null,
      userid: map.containsKey('userid') ? map['userid'] : null
  );

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "expireCniDate": expireCniDate,
      "userAdresse": userAdresse,
      "userCni": userCni,
      "userEmail": userEmail,
      "userName": userName,
      "userid": userid,
    };
  }

  factory User.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return User(
        id: document.id,
        expireCniDate: data["expireCniDate"],
        userAdresse: data["userAdresse"],
        userCni: data["userCni"],
        userEmail: data["userEmail"],
        userName: data["userName"],
        userid: data["userid"]

    );
  }

}


class Administrator extends User {

  String? id;
  bool? access;
  String? cni;
  String? cniRecto;
  String? cniVerso;
  String? code;
  String? createdAt;
  String? dateNaissance;
  String? email;
  String? expirationCni;
  String? nom;
  String? password;
  String? pays;
  String? photo;
  String? quartier;
  String? sexe;
  int? tel;
  String? type;
  String? updatedAt;

  Administrator({
    this.id,
    this.access,
    this.cni,
    this.cniRecto,
    this.cniVerso,
    this.code,
    this.createdAt,
    this.dateNaissance,
    this.email,
    this.expirationCni,
    this.nom,
    this.password,
    this.pays,
    this.photo,
    this.quartier,
    this.sexe,
    this.tel,
    this.type,
    this.updatedAt
  });

  Administrator.fromMap(Map map) : this(
      id: map.containsKey('id') ? map['id'] : null,
      access: map.containsKey('access') ? map['access'] : false,
      cni: map.containsKey('cni') ? map['cni'] : null,
      cniRecto: map.containsKey('cni_recto') ? map['cni_recto'] : null,
      cniVerso: map.containsKey('cni_verso') ? map['cni_verso'] : null,
      code: map.containsKey('code') ? map['code'] : null,
      createdAt: map.containsKey('created_at') ? map['created_at'] : null,
      dateNaissance: map.containsKey('date_naissance') ? map['date_naissance'] : null,
      email: map.containsKey('email') ? map['email'] : null,
      expirationCni: map.containsKey('expiration_cni') ? map['expiration_cni'] : null,
      nom: map.containsKey('nom') ? map['nom'] : null,
      password: map.containsKey('password') ? map['password'] : null,
      pays: map.containsKey('pays') ? map['pays'] : null,
      photo: map.containsKey('photo') ? map['photo'] : null,
      quartier: map.containsKey('quartier') ? map['quartier'] : null,
      sexe: map.containsKey('sexe') ? map['sexe'] : null,
      tel: map.containsKey('tel') ? map['tel'] : null,
      type: map.containsKey('type') ? map['type'] : null,
      updatedAt: map.containsKey('updated_at') ? map['updated_at'] : null,
  );

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "access": access,
      "cni": cni,
      "cni_recto": cniRecto,
      "cni_verso": cniVerso,
      "code": code,
      "created_at": createdAt,
      "date_naissance": dateNaissance,
      "email": email,
      "expiration_cni": expirationCni,
      "nom": nom,
      "password": password,
      "pays": pays,
      "photo": photo,
      "quartier": quartier,
      "sexe": sexe,
      "tel": tel,
      "type": type,
      "updatedAt": updatedAt
    };
  }

  factory Administrator.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return Administrator(
        id: document.id,
        access: data["access"],
        cni: data["cni"],
        cniRecto: data["cni_recto"],
        cniVerso: data["cni_verso"],
        code: data["code"],
        createdAt: data["created_at"],
        dateNaissance: data["date_naissance"],
        email: data["email"],
        expirationCni: data["expiration_cni"],
        nom: data["nom"],
        password: data["password"],
        pays: data["pays"],
        photo: data["photo"],
        quartier: data["quartier"],
        sexe: data["sexe"],
        tel: data["tel"],
        type: data["type"],
        updatedAt: data["updated_at"]
    );
  }

}