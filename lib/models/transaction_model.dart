

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi_chrono_web/models/customer_model.dart';

import 'driver_model.dart';

class Transaction {

  String? commentaireChauffeurSurLeClient;
  String? commentaireClientSurLeChauffeur;
  Timestamp? dateAcceptation;
  int? etatTransaction;
  Driver? driver;
  Customer? customer;
  //idReservation;
  int? id;
  int? noteChauffeur;
  Timestamp? tempsAnnulation;
  Timestamp? tempsArrive;
  Timestamp? tempsDepart;

}