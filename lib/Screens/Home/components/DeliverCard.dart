import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:secure_hops/Screens/Home/AllOffers.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:secure_hops/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Categories.dart';
import 'ItemList.dart';
import 'OffercardList.dart';

class DeliverCard extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height / 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(demoAvatar
                    // user!.photoURL.toString(),
                    ),
                radius: 30,
              ),
            ),
            Container(
              height: size.height / 9.5,
              width: size.width / 1.3,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(AppLocalizations.of(context)!.deliverto,
                        style: TextStyle(
                            fontSize: 20,
                            color: kWhiteColor,
                            fontWeight: FontWeight.w500)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: size.width / 1.7,
                          child: Text(
                            '8000 S Kirkland Ave, Chicago, IL ...',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: kWhiteColor, fontSize: 16),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: kWhiteColor,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Categories(),
        Row(
          children: [
            Text(
              "HOT OFFERS",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: () {
                  navigatorPush(context, false, AllOffers());
                },
                child: Text(
                  "All >",
                  style: TextStyle(color: primaryColor),
                ),
              ),
            )
          ],
        ),
        Offercardlist(),
        Text(
          "Popular Restaurants",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Expanded(child: ItemList()),
      ],
    );
  }
}
