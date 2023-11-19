import 'package:chuck_norris/src/constants/assets.dart';
import 'package:chuck_norris/src/constants/font_styles.dart';
import 'package:chuck_norris/src/constants/paddings.dart';
import 'package:flutter/material.dart';
import '../../models/joke_model.dart';

class JokeCardUI extends StatelessWidget {
  const JokeCardUI({Key? key, required this.joke}) : super(key: key);

  final JokeModel joke;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: CustomPaddings.largePaddingAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(ImageAssets.chuck),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: Text(
                joke.value,
                textAlign: TextAlign.center,
                style: CustomFontStyles.kalamNormalBold,
              ),
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                Text(
                  "Categories:",
                  style: CustomFontStyles.lilitaOneNormal,
                ),
                joke.categories[0] != ""
                    ? Wrap(
                        children: List.generate(
                            joke.categories.length,
                            (index) => Text(
                                  "${joke.categories[index]}, ",
                                  style: CustomFontStyles.kalamNormal,
                                )),
                      )
                    : Text(
                        "---",
                        style: CustomFontStyles.kalamNormal,
                      )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Created At",
                      style: CustomFontStyles.lilitaOneNormal,
                    ),
                    Text(
                      joke.createdAt.substring(0, 10),
                      style: CustomFontStyles.kalamNormal,
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Updated At",
                      style: CustomFontStyles.lilitaOneNormal,
                    ),
                    Text(
                      joke.updatedAt.substring(0, 10),
                      style: CustomFontStyles.kalamNormal,
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
