import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:blood_donation/Views/authentification/dialogueGroupeSanguin.dart';
import 'package:blood_donation/compenments/textformfieldA.dart';

class PublierAnnonce extends StatefulWidget {
  @override
  State<PublierAnnonce> createState() => PublierAnnoncePage();
}

class PublierAnnoncePage extends State<PublierAnnonce> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  String? typedon;
  String? numAffich;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Publier Annonce"),
        backgroundColor: Colors.red,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 25,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.check),
            color: Colors.white,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              height: 17,
            ),
            // Text(
            //   "Publier une annonce",
            //   textAlign: TextAlign.start,
            //   style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            // ),
            // Text(
            //   "Creer et publier votre annonce de besoin de sang",
            //   textAlign: TextAlign.start,
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            Form(
                child: Column(
              children: [
                Text(
                  "Quelle type de Don avez-vous besoin ? : ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Container(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Column(
                    children: [
                      Expanded(
                        child: RadioListTile(
                          activeColor: Colors.red,
                          title: Text(
                            "des Plaquette",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          value: "plaquette",
                          groupValue: typedon,
                          onChanged: (value) {
                            typedon = value;
                            setState(() {});
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          activeColor: Colors.red,
                          title: Text(
                            "du Plasma",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          value: "plasma",
                          groupValue: typedon,
                          onChanged: (value) {
                            typedon = value;
                            setState(() {});
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          activeColor: Colors.red,
                          title: Text(
                            "Sang globale",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          value: "sang",
                          groupValue: typedon,
                          onChanged: (value) {
                            typedon = value;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Choisissiez le type du sang  ? : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: GroupeSanguin(),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                setState(() {});
                                print(v);

                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Valider",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              color: Color(0xFFd20000),
                              textColor: Colors.white,
                              height: 50,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: AbsorbPointer(
                    absorbing:
                        true, // Désactiver l'interaction avec le TextFormField
                    child: TextForm(
                        label: v == null ? "Groupe sanguin" : v!,
                        i: Icon(
                          Icons.bloodtype,
                        )),
                  ),
                ),
                Container(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Vous voulez afficher le Numero de telephone dans l'annonce ? :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                RadioListTile(
                  activeColor: Colors.red,
                  title: Text(
                    "Oui",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  value: "affiche",
                  groupValue: numAffich,
                  onChanged: (value) {
                    numAffich = value;
                    setState(() {});
                  },
                ),
                RadioListTile(
                  activeColor: Colors.red,
                  title: Text(
                    "Non",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  value: "Naffiche",
                  groupValue: numAffich,
                  onChanged: (value) {
                    numAffich = value;
                    setState(() {});
                  },
                ),
              ],
            )),
            Container(
              height: 20,
            ),

            if (numAffich == 'affiche')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Numero de telephone ? :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Container(
                    height: 8,
                  ),
                  TextForm(label: "numero tel", i: Icon(Icons.phone)),
                  Container(
                    height: 20,
                  ),
                ],
              ),
            Text(
              "Ajoutez une description :",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
              height: 8,
            ),
            TextForm(
                label: "descreption(facultatif)", i: Icon(Icons.description)),
            Container(
              height: 20,
            ),
            Text(
              "L'etablissement (l'hopital) :",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
              height: 8,
            ),
            TextForm(label: "Hopitale", i: Icon(Icons.local_hospital_sharp)),
            Container(
              height: 20,
            ),
            Text(
              "Date de Don au maximum :",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                _selectDate(context);
              },
              child: AbsorbPointer(
                absorbing:
                    true, // Désactiver l'interaction avec le TextFormField
                child: TextForm(
                    label: selectedDate == null
                        ? "Date"
                        : "${selectedDate!.toLocal()}".split(' ')[0],
                    i: Icon(
                      Icons.date_range,
                    )),
              ),
            ),
            Container(
              height: 25,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 60),
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  "Publier",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                color: Color(0xFFd20000),
                textColor: Colors.white,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
