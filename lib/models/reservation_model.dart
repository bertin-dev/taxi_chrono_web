

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi_chrono_web/models/end_point_model.dart';
import 'package:taxi_chrono_web/models/position_model.dart';
import 'package:taxi_chrono_web/models/start_point_model.dart';

import 'customer_model.dart';

class Reservation {

  String? id;
  Timestamp? dateReservation;
  Enum? etatReservation;
  String? customerId;
  StartPoint? pointDepart;
  EndPoint? pointArrive;
  Position? positionClient;
  double? prixReservation;
  String? typeRservation;


  Reservation({
    this.id,
    this.dateReservation,
    this.etatReservation,
    this.customerId,
    this.pointDepart,
    this.pointArrive,
    this.positionClient,
    this.prixReservation,
    this.typeRservation
});



  factory Reservation.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Reservation(
        id: document.id,
        dateReservation: data['dateReservation'],
        etatReservation: data['etatReservation'],
        customerId: data['idClient'],
        pointDepart: data['pointDepart'] != null ? StartPoint.fromSnapshot(data['pointDepart']) : null,
        pointArrive: data['positionArrive'] != null ? EndPoint.fromSnapshot(data['positionArrive']) : null,
        positionClient: data['positionClient'],
        prixReservation: data['prixReservation'],
        typeRservation: data['typeRservation'],
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'dateReservation': dateReservation,
      'etatReservation': etatReservation,
      'idClient': customerId,
      'pointDepart': pointDepart != null ? pointDepart!.toMap() : null,
      'pointArrive': pointArrive != null ? pointArrive!.toMap() : null,
      'positionClient': positionClient,
      'prixReservation': prixReservation,
      'typeRservation': typeRservation,
    };
  }

}

