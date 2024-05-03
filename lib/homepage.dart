//import 'package:blood_donation/historique_don.dart';
import 'dart:convert';

import 'package:blood_donation/djangoTest.dart';
import 'package:blood_donation/models/annonce.dart';
import 'package:blood_donation/tools/card_post.dart';
import 'package:blood_donation/tools/choix_don.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? don;
  List<Annonce> annonces = [];

  recuperer_annonce() async {
    var post = await getDatasDjango(urlSite, 'getAnnonce/');
    this.annonces = Annonce.listfromJson(post as List);
    print(post);
    setState(() {});
  }

  final posts = [
    {
      "name": "Brahmi",
      "prenom": "Maya",
      "blood": "B+",
      'numtel': "0540683274",
      "date": "12-04-2024",
      "date_publication": "12-04-2024",
      "description": "Petite fille en etat critique",
      "adress": "Hopital Beni Messous",
    },
    {
      "name": "Belkadi",
      "prenom": "ishak",
      "blood": "O+",
      'numtel': "0540683274",
      "date": "08-04-2024",
      "date_publication": "12-04-2024",
      "description": "urgent",
      "adress": "Hopital Beni Messous",
    },
    {
      "name": "Belkadi",
      "prenom": "lea",
      "blood": "B+",
      'numtel': "0540683274",
      "date": "12-04-2024",
      "date_publication": "12-04-2024",
      "adress": "Hopital Beni Messous",
    },
    {
      "name": "Belkadi",
      "prenom": "Zayn",
      "blood": "A+",
      'numtel': "0540683274",
      "date": "12-04-2024",
      "date_publication": "12-04-2024",
      "description": "urgent",
      "adress": "Hopital Beni Messous",
    },
    {
      "name": "Belkadi",
      "prenom": "adam",
      "blood": "B+",
      'numtel': "0540683274",
      "date": "12-04-2024",
      "date_publication": "12-04-2024",
      "adress": "Hopital Beni Messous",
    }
  ];

  /* void maj_fenetre(context) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return choix();
          });
        });
  }  */
  @override
  void initState() {
    super.initState();
    recuperer_annonce();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              height: 70,
              color: Color.fromARGB(255, 220, 0, 59),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        // maj_fenetre(context);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return choix();
                            });
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 249, 224, 226),
                      ),
                      child: Text(
                        "Donner sang",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 249, 224, 226),
                      ),
                      child: Text(
                        "Trouver donneur",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))
                ],
              ),
            ),

            ...List.generate(
              posts.length,
              (i) {
                return Card_cust(
                  name: "${posts[i]['name']!} ${posts[i]['prenom']!}",
                  blood: posts[i]['blood'],
                  date: posts[i]['date'],
                  adress: posts[i]['adress'],
                  numtel: int.parse(posts[i]['numtel']!),
                  description: posts[i]['description'],
                  date_publication: posts[i]['date_publication'],
                );
              },
            )

            /*Card_cust(
                name: "maya", blood: "B+", date: "27082002", adress: "alger"), */
            //
          ],
        ),
      ),
    );
  }
}
