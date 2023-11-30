import 'package:ecommerce_produict_app/constants.dart';
import 'package:ecommerce_produict_app/services/api_services.dart';
import 'package:ecommerce_produict_app/widgets/button_widget.dart';
import 'package:ecommerce_produict_app/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? user_data;
  List<dynamic>? products_data;

  @override
  void initState() {
    super.initState();
    fetchUserData();
    fetchProductData();
  }

  Future<void> fetchUserData() async {
    try {
      Map<String, dynamic>? data = await ApiServices.getUserData();
      setState(() {
        user_data = data;
      });
    } catch (e) {
      print("Erreur lors de la récupération des données utilisateur : $e");
    }
  }

  Future fetchProductData() async {
    try {
      List<dynamic>? data = await ApiServices.getProductsData();
      setState(() {
        products_data = data;
      });
    } catch (e) {
      print("Erreur lors de la récupération des données de produits : $e");
    }
  }

  String convertFormatDate(String dateString) {
    DateTime parsedDate = DateTime.parse(dateString);
    return "${parsedDate.day}/${parsedDate.month}/${parsedDate.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.background_color,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constants.background_color,
        title: const Text("P R O D U C T"),
      ),
      body: ListView.builder(
        itemCount: products_data?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          if (user_data == null && products_data == null) {
            // Afficher un indicateur de chargement ou un message d'erreur
            return const CircularProgressIndicator();
          }

          if (index >= user_data!["results"].length &&
              index >= products_data!.length) {
            // Index hors de portée, gérer cela selon votre cas d'utilisation
            return Container();
          }

          Map<String, dynamic> productsItem = products_data![index];
          Map<String, dynamic> userItem = user_data!["results"][index];
          String date = convertFormatDate(userItem["registered"]["date"]);

          return CardWidget(
            user_name: userItem["name"]["first"],
            user_image_url: userItem["picture"]["large"],
            time: date,
            image_url: productsItem["image"],
          );
        },
      ),
    );
  }
}
