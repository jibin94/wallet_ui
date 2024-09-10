import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:wallet_ui/ui/screen/drawer_page.dart';
import 'package:wallet_ui/util/file_path.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  static DateTime now = DateTime.now();
  String formattedTime = DateFormat.jm().format(now);
  String formattedDate = DateFormat('MMM d, yyyy').format(now);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(mainBanner),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[_centerContent(), _bottomContent()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _centerContent() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SvgPicture.asset(logo),
          const SizedBox(
            height: 18,
          ),
          Text(
            'My Wallet',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            'Open An Account For Digital  E-Wallet Solutions.\nInstant Payouts. \n\nJoin For Free.',
            style: Theme.of(context).textTheme.headlineMedium,
          )
        ],
      ),
    );
  }

  Widget _bottomContent() {
    return Column(
      children: <Widget>[
        MaterialButton(
          elevation: 0,
          color: const Color(0xFFFFAC30),
          height: 50,
          minWidth: 200,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DrawerPage(),
              ),
            );
          },
          child: Text(
            'Sign in',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Create an Account',
          style: Theme.of(context).textTheme.headlineSmall,
        )
      ],
    );
  }
}
