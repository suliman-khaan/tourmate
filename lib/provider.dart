import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'datamodel.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel productModel;
  List<ProductModel> search = [];
  productModels(QueryDocumentSnapshot document) {
    productModel = ProductModel(
        areaName: document.get("name"),
        districtArea: document.get('district'),
        imageArea: document.get('image'),
        id: document.get('ID'),
        type: document.get('type')
        // type: document.get('type')
        );
    search.add(productModel);
  }

  // For All restaurants //
  List<ProductModel> areaList = [];
  // List<ProductModel> mylist = [];
  fatchAreaData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Areas").get();
    value.docs.forEach((element) {
      productModels(element);
      // print(element.data());
      newList.add(productModel);
    });
    areaList = newList;
    notifyListeners();
  }

//   For All distination  //

  List<ProductModel> restaurantList = [];
  fatchRestaurantList() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Resturents").get();
    value.docs.forEach((element) {
      productModels(element);
      // print(element.data());
      newList.add(productModel);
    });
    restaurantList = newList;
    notifyListeners();
  }

//  hotel

  List<ProductModel> hotelList = [];
  fatchHoteltList() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("hotel").get();
    value.docs.forEach((element) {
      productModels(element);
      // print(element.data());
      newList.add(productModel);
    });
    hotelList = newList;
    notifyListeners();
  }

  // trasnsport
  List<ProductModel> transportList = [];
  fatchTransporttList() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Transport").get();
    value.docs.forEach((element) {
      productModels(element);
      // print(element.data());
      newList.add(productModel);
    });
    transportList = newList;
    notifyListeners();
  }

  // parks
  List<ProductModel> parksList = [];
  fatchParksList() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Parks").get();
    value.docs.forEach((element) {
      productModels(element);
      // print(element.data());
      newList.add(productModel);
    });
    parksList = newList;
    notifyListeners();
  }

  // events
  List<ProductModel> eventsList = [];
  fatchEventsList() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Events").get();
    value.docs.forEach((element) {
      productModels(element);
      // print(element.data());
      newList.add(productModel);
    });
    eventsList = newList;
    notifyListeners();
  }

  // entertainments
  List<ProductModel> entertainmentsList = [];
  fatchEntertainmentsList() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Entertainment").get();
    value.docs.forEach((element) {
      productModels(element);
      // print(element.data());
      newList.add(productModel);
    });
    entertainmentsList = newList;
    notifyListeners();
  }

  // search all products

  List<ProductModel> get getAllItems {
    return search;
  }
}
