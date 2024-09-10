import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_ui/util/file_path.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 34),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const HeaderWidget(),
                  const SizedBox(height: 30),
                  const SectionTitle(title: 'Account Overview'),
                  const SizedBox(height: 16),
                  const OverviewWidget(),
                  const SizedBox(height: 30),
                  const SectionWithAction(
                    title: 'Send Money',
                    actionIcon: scan,
                  ),
                  const SizedBox(height: 16),
                  const SendMoneyWidget(),
                  const SizedBox(height: 30),
                  const SectionWithAction(
                    title: 'Services',
                    actionIcon: filter,
                  ),
                  const SizedBox(height: 16),
                  ServicesWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Header Widget
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            SvgPicture.asset(
              logo,
              width: 34,
            ),
            const SizedBox(width: 12),
            Text(
              'My Wallet',
              style: Theme.of(context).textTheme.headlineLarge,
            )
          ],
        ),
        InkWell(
          onTap: () {
            // Perform some action
          },
          child: SvgPicture.asset(
            menu,
            width: 16,
          ),
        ),
      ],
    );
  }
}

// Section Title Widget
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}

// Section with Action Icon
class SectionWithAction extends StatelessWidget {
  final String title;
  final String actionIcon;

  const SectionWithAction(
      {super.key, required this.title, required this.actionIcon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SvgPicture.asset(
          actionIcon,
          width: 18,
        ),
      ],
    );
  }
}

// Overview Widget
class OverviewWidget extends StatelessWidget {
  const OverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '10,500',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
              Text(
                'Current Balance',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: const Color(0xffFFAC30),
              borderRadius: BorderRadius.circular(80),
            ),
            child: const Center(
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}

// Send Money Widget
class SendMoneyWidget extends StatelessWidget {
  const SendMoneyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          SendMoneyItem(isAddButton: true),
          SendMoneyItem(name: 'Midhun', avatar: avatorOne),
          SendMoneyItem(name: 'Niyas', avatar: avatorTwo),
          SendMoneyItem(name: 'Suhail', avatar: avatorThree),
        ],
      ),
    );
  }
}

// Send Money Item Widget
class SendMoneyItem extends StatelessWidget {
  final bool isAddButton;
  final String? name;
  final String? avatar;

  const SendMoneyItem(
      {super.key, this.isAddButton = false, this.name, this.avatar});

  @override
  Widget build(BuildContext context) {
    if (isAddButton) {
      return Container(
        width: 80,
        padding: const EdgeInsets.only(
          left: 18,
          right: 18,
          top: 28,
          bottom: 28,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xffFFAC30),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Icon(
              Icons.add,
            ),
          ),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: const Color(0xffD8D9E4),
              ),
            ),
            child: CircleAvatar(
              radius: 22.0,
              backgroundColor: Theme.of(context).primaryColor,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: SvgPicture.asset(avatar!),
              ),
            ),
          ),
          Text(
            name!,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}

// Services Widget
class ServicesWidget extends StatelessWidget {
  final List<ModelServices> listServices = [
    ModelServices(title: "Send\nMoney", img: send),
    ModelServices(title: "Receive\nMoney", img: recive),
    ModelServices(title: "Mobile\nPrepaid", img: mobile),
    ModelServices(title: "Electricity\nBill", img: electricity),
    ModelServices(title: "Cashback\nOffer", img: cashback),
    ModelServices(title: "Movie\nTickets", img: movie),
    ModelServices(title: "Flight\nTickets", img: flight),
    ModelServices(title: "More\nOptions", img: menu),
  ];

  ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.1),
        children: listServices.map((value) {
          return ServiceItem(service: value);
        }).toList(),
      ),
    );
  }
}

// Service Item Widget
class ServiceItem extends StatelessWidget {
  final ModelServices service;
  const ServiceItem({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle tap action
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).cardColor,
            ),
            child: SvgPicture.asset(
              service.img,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            service.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}

// Model for services
class ModelServices {
  String title, img;
  ModelServices({required this.title, required this.img});
}
