import 'package:flutter/material.dart';
class Product{
  String name;
  String reference;

  int id;
  double price;
  double quantity;
  double height;
  double width;
  double length;
  //String mesure;
  
  Product(this.name,this.id, this.reference, this.price,this.quantity, this.length, this.width, this.height,);
  //set(_id)=>this.id=_id;



  Map<String, dynamic> tomap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map['id']     = id;
    }
    map['name']      = name;
    map['length']    = length;
    map['width']     = width;
    map['height']    = height;
    map['price']     = price;
    map['quantity']  = quantity;
    map['reference'] = reference;
    //map['mesure']   = mesure;

    return map;
  }

  Product.fromMap(Map<String, dynamic> map) {
    this.id        = map['id'];
    this.name      = map['name'];
    this.reference = map['reference'] ?? '';
    this.length    = map['length'] ?? 0.0;
    this.width     = map['width']  ?? 0.0;
    this.height    = map['height'] ?? 0.0;
    this.price     = map['price']  ?? 0.0;
    this.quantity  = map['quantity'] ?? 0.0;
    //this.mesure   = map['mesure'];
  }

  int _hashCode;
  @override
  // TODO: implement hashCode
  int get hashCode{
    if(_hashCode == null) {
      _hashCode = id.hashCode;
    }
    return _hashCode; 
  }
  @override
  bool operator==(Object other)
  {
    if(other is !Product)
    return false;
    return (other as Product).id == id;
  }

  List tolist() {
    var map = new List();
    map = [ this.id, this.name, this.reference, this.price, this.quantity, this.height, this.length, this.width];

    return map;
  }
}