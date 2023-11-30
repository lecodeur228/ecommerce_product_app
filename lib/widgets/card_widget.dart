import 'package:ecommerce_produict_app/constants.dart';
import 'package:ecommerce_produict_app/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String user_name;
  final String user_image_url;
  final String time;
  final String image_url;
  const CardWidget(
      {super.key,
      required this.user_name,
      required this.time,
      required this.image_url,
      required this.user_image_url});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Couleur de l'ombre
            spreadRadius: 2, // Distance de propagation de l'ombre
            blurRadius: 5, // Rayon de flou de l'ombre
            offset:
                const Offset(0, 4), // Décalage de l'ombre par rapport au widget
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Constants.background_color,
                backgroundImage: NetworkImage(user_image_url),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user_name,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.more_horiz),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                image_url,
                fit: BoxFit.cover,
                height: 300,
              )),
          const SizedBox(
            height: 20,
          ),
          const ButtonWidget(text: "BUY"),
        ],
      ),
    );
  }
}
