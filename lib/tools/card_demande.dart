import 'package:flutter/material.dart';

class card_demande extends StatefulWidget {
  final String? name, blood, adress;
  String? contenu;
  final VoidCallback? accepted;
  final VoidCallback? refused;
  bool changer;

  card_demande({
    required this.blood,
    required this.adress,
    this.accepted,
    this.refused,
    this.contenu,
    required this.changer,
    this.name,
  });

  // Fonction publique pour changer le texte

  @override
  State<card_demande> createState() => _card_demandeState();
  static GlobalKey<_card_demandeState> boutonKey =
      GlobalKey<_card_demandeState>();
}

class _card_demandeState extends State<card_demande> {
  //String text = "accepter";
  /* callback(content) {
    setState(() {
      this.text = content;
    });
  } */

  @override
  Widget build(BuildContext context) {
    return widget.changer
        ? Card(
            shadowColor: const Color.fromARGB(255, 233, 126, 161),
            elevation: 4,
            margin: EdgeInsets.all(10),
            color: Color.fromARGB(255, 255, 234, 239),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Color.fromARGB(255, 249, 202, 213), width: 0.5),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 10, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.name}",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "${widget.blood}",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 220, 0, 59),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 10, left: 10, bottom: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "${widget.adress}",
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 5,
                            ),
                            child: MaterialButton(
                              color: Color.fromARGB(255, 228, 64, 83),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onPressed: widget.refused,
                              child: Text(
                                "${widget.contenu}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 5,
                            ),
                            child: MaterialButton(
                              color: Colors.lightGreen[300],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onPressed: widget.accepted,
                              child: Text(
                                "Accepter",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        : Card(
            shadowColor: const Color.fromARGB(255, 233, 126, 161),
            elevation: 4,
            margin: EdgeInsets.all(10),
            color: Color.fromARGB(255, 255, 234, 239),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Color.fromARGB(255, 249, 202, 213), width: 0.5),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 10, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.name}",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "${widget.blood}",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 220, 0, 59),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, bottom: 7),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "${widget.adress}",
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                      Row(children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 5,
                          ),
                          child: MaterialButton(
                            color: Color.fromARGB(255, 228, 64, 83),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: widget.refused,
                            child: Text(
                              "${widget.contenu}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ]),
                    ]),
              ),
            ]),
          );
  }
}
