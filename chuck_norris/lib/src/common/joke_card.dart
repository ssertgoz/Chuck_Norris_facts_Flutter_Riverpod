import 'package:chuck_norris/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/joke_model.dart';

class JokeCardUI extends StatelessWidget {
  const JokeCardUI({Key? key, required this.joke}) : super(key: key);

  final JokeModel joke;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                child: Image.asset("assets/images/chuck.png"),
              ),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: Text(
                joke.value,
                textAlign: TextAlign.center,
                style: GoogleFonts.kalam(
                    fontWeight: FontWeight.w700,
                    color: darkThemeColor,
                    fontSize: 17),
              ),
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                ),
                Text(
                  "Categories:",
                  style: GoogleFonts.lilitaOne(),
                ),
                Wrap(
                  children: List.generate(
                      joke.categories.length,
                      (index) => Text(
                            "${joke.categories[index]}, ",
                            style: GoogleFonts.kalam(),
                          )),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Created At",
                      style: GoogleFonts.lilitaOne(),
                    ),
                    Text(
                      joke.createdAt.substring(0, 10),
                      style: GoogleFonts.kalam(),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Updated At",
                      style: GoogleFonts.lilitaOne(),
                    ),
                    Text(
                      joke.updatedAt.substring(0, 10),
                      style: GoogleFonts.kalam(),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
