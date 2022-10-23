import 'package:flutter/material.dart';
import 'package:form1/theme.dart';

class SubjectItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const SubjectItem({Key? key, required this.name, required this.imageUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height / 4.9,
        width: MediaQuery.of(context).size.width / 2.45,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.center,
              child: Image.network(
                '$imageUrl',
                width: MediaQuery.of(context).size.width / 4.9,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.center,
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: ' $name',
                      style: blackTextStyle.copyWith(
                          fontSize: MediaQuery.of(context).size.width > 600
                              ? 25
                              : 14))
                ]),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.center,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: ' 4 month Course',
                        style: regularTextStyle.copyWith(
                            fontSize: MediaQuery.of(context).size.width > 600
                                ? 25
                                : 14))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/star.png',
                    width: MediaQuery.of(context).size.width > 600 ? 35 : 20,
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      '4.5',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 600
                              ? 25
                              : 14),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
