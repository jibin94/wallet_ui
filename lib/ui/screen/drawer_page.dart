import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_ui/ui/screen/home_page.dart';
import 'package:wallet_ui/util/file_path.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  DrawerPageState createState() => DrawerPageState();
}

class DrawerPageState extends State<DrawerPage> with TickerProviderStateMixin {
  bool sideBarActive = false;
  late AnimationController rotationController;
  @override
  void initState() {
    rotationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).cardColor,
          body: Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.02),
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(60)),
                            color: Theme.of(context).scaffoldBackgroundColor),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(
                                        color: const Color(0xffD8D9E4))),
                                child: CircleAvatar(
                                  radius: 22.0,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50.0),
                                    child: SvgPicture.asset(avatorOne),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Jibin N Ajith",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                  Text(
                                    "New Delhi",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        navigatorTitle("Home", true),
                        navigatorTitle("Profile", false),
                        navigatorTitle("Accounts", false),
                        navigatorTitle("Transactions", false),
                        navigatorTitle("Stats", false),
                        navigatorTitle("Settings", false),
                        navigatorTitle("Help", false),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.power_settings_new,
                          size: 24,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Logout",
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Ver 1.0",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  )
                ],
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                left: (sideBarActive)
                    ? MediaQuery.of(context).size.width * 0.6
                    : 0,
                top: (sideBarActive)
                    ? MediaQuery.of(context).size.height * 0.2
                    : 0,
                child: RotationTransition(
                  turns: (sideBarActive)
                      ? Tween(begin: -0.05, end: 0.0)
                          .animate(rotationController)
                      : Tween(begin: 0.0, end: -0.05)
                          .animate(rotationController),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: (sideBarActive)
                        ? MediaQuery.of(context).size.height * 0.7
                        : MediaQuery.of(context).size.height,
                    width: (sideBarActive)
                        ? MediaQuery.of(context).size.width * 0.8
                        : MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: sideBarActive
                          ? const BorderRadius.all(Radius.circular(40))
                          : const BorderRadius.all(Radius.circular(0)),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: sideBarActive
                          ? const BorderRadius.all(Radius.circular(40))
                          : const BorderRadius.all(Radius.circular(0)),
                      child: const HomePage(),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 20,
                child: (sideBarActive)
                    ? IconButton(
                        onPressed: closeSideBar,
                        icon: Icon(
                          Icons.close,
                          color: Theme.of(context).iconTheme.color,
                          size: 30,
                        ),
                      )
                    : InkWell(
                        onTap: openSideBar,
                        child: Container(
                          margin: const EdgeInsets.all(17),
                          height: 30,
                          width: 30,
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row navigatorTitle(String name, bool isSelected) {
    return Row(
      children: [
        (isSelected)
            ? Container(
                width: 5,
                height: 40,
                color: const Color(0xffffac30),
              )
            : const SizedBox(
                width: 5,
                height: 40,
              ),
        const SizedBox(
          width: 10,
          height: 45,
        ),
        Text(
          name,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: 16,
                fontWeight: (isSelected) ? FontWeight.w700 : FontWeight.w400,
              ),
        ),
      ],
    );
  }

  void closeSideBar() {
    sideBarActive = false;
    setState(() {});
  }

  void openSideBar() {
    sideBarActive = true;
    setState(() {});
  }
}
