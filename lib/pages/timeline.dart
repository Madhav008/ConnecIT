import 'package:flutter/material.dart';
import 'package:loginDesign/dynamicLinks/dynamiclink.dart';
import 'package:loginDesign/widgets/refcode_generator.dart';
import 'package:share/share.dart';

class Timeline extends StatefulWidget {
  var user;
  Timeline(this.user);
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  String referCode = "";
  String referLink = "";
  @override
  Widget build(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Tutorial Referral System')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: GestureDetector(
                onTap: () async {
                  referCode = await CreateReferralCode().setReferralCode();
                  setState(() {});
                },
                child: Container(
                  child: Text("Create Refer Code"),
                ),
              ),
            ),
            Text(referCode),
            SizedBox(
              height: 50,
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  referLink =
                      await DynamicLinksApi().createReferralLink(referCode);
                  setState(() {});
                },
                child: Container(
                  child: Text("Share Refer Link"),
                ),
              ),
            ),
            Text(referLink),
            SizedBox(height: 20),
            GestureDetector(
                onTap: () {
                  Share.share("$referLink \n Referal Code:- $referCode",
                      subject: "Referal Code:- $referCode",
                      sharePositionOrigin:
                          box.localToGlobal(Offset.zero) & box.size);
                },
                child: Container(child: Text("ShareCode")))
          ]),
        ],
      ),
    );
  }
}
