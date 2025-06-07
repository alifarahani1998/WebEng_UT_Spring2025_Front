import 'package:flutter/material.dart';
import 'package:flutter_customer_seller_panel/product_page.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('به پنل ادمین خوش آمدید'),
        backgroundColor: Colors.lightBlue,
        leading: Row(children: [Icon(Icons.exit_to_app), Text('خروج')]),
        centerTitle: true,
      ),
      endDrawer: Drawer(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            spacing: 50,
            children: [
              Column(
                children: [
                  Icon(Icons.person_3_sharp, size: 100),
                  Text('علی فراهانی (مدیر شعبه)'),
                ],
              ),
              TextButton(onPressed: () {}, child: Text('مدیریت کاربران')),
              TextButton(
                onPressed:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => ProductPage(),
                      ),
                    ),
                child: Text('مدیریت محصولات'),
              ),
              TextButton(onPressed: () {}, child: Text('مدیریت سفارشات')),
              TextButton(onPressed: () {}, child: Text('مدیریت شعب')),
              TextButton(onPressed: () {}, child: Text('گزارشات مالی')),
            ],
          ),
        ),
      ),
      body: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Icon(Icons.person, size: 100),
                    Text('مدیریت مشتریان'),
                  ],
                ),
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.yellow,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Icon(Icons.production_quantity_limits, size: 100),
                    Text('مدیریت محصولات'),
                  ],
                ),
              ),
            ],
          ),
          Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.pink,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.attach_money_rounded, size: 100),
                    Text('مدیریت مالی'),
                  ],
                ),
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Icon(Icons.work_rounded, size: 100),
                    Text('مدیریت شعب'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
