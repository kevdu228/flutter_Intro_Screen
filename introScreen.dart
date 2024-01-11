import 'package:flutter/material.dart';
import 'package:vente/connect.dart';
import 'package:vente/dashboard.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  bool last = false;

  int ind = 0;

  // init()async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setString('id', "");
  // }

  onPage(int index) {
    setState(() {
      ind = index;
    });
  }
  @override


  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff0088CC),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          controller.jumpToPage(2);
                        });
                      },
                      child: Text(
                        "SKIP",
                        style:
                            TextStyle(color: ind != 2 ? Colors.blue : Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          body: Container(
            color: Colors.white,
            child: Stack(
              children: [
                PageView(
                  controller: controller,
                  onPageChanged: onPage,
                  physics: BouncingScrollPhysics(),
                  children: [
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Acheteurs de toutes catégories sont ici et vous attendent",
                              style: TextStyle(
                                fontSize: 22,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Image.asset("assets/spash1.png")
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Image.asset("assets/splash2.png"),
                          Text(
                              "Les articles que vous chercher sont disponibles ici ,explorez",
                              style: TextStyle(
                                fontSize: 22,
                              ),
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Bienvenue, nous sommes heureux de vous compter parmis nous ",
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                                textAlign: TextAlign.center),
                          ),
                          Image.asset("assets/splash3.png")
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 100,
                      width: 80,
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          ind == 0 ? Colors.blue : Colors.grey),
                                  width: 10,
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          ind == 1 ? Colors.blue : Colors.grey),
                                  width: 10,
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          ind == 2 ? Colors.blue : Colors.grey),
                                  width: 10,
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.blue),
                              child: IconButton(
                                icon: Icon(Icons.arrow_forward_sharp),
                                color: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    if (ind != 2) {
                                      controller.nextPage(
                                          duration: Duration(milliseconds: 600),
                                          curve: Curves.easeInOut);
                                    } else {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Dashboard()),
                                      );
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
