import 'package:flutter/material.dart';

class BatchLivePage extends StatelessWidget {
  final int numClasses;

  const BatchLivePage({Key? key, required this.numClasses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StudentLiveClass(numClasses: numClasses);
  }
}

class StudentLiveClass extends StatelessWidget {
  final int numClasses;

  const StudentLiveClass({Key? key, required this.numClasses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Color(0xFFF4F4F4),
            border: Border.all(),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFFF1A4B),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: 5,
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Regular Class",
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text("03 Dec 2022, 10:30 am"),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                      width: MediaQuery.of(context).size.width * 0.15,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 248, 214, 221), borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          "Arabic",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFFF1A4B),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFFF1A4B),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Join Session",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),

                              Container(
  child: Stack(
    children: [
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
    child: Center(
          child: Icon(
            Icons.arrow_forward_ios_outlined,
     color: const Color(0xFFFF1A4B),
            size: 15,
          ),
        ),
        ),
      ),
      
                         ],
                            ),
                          ),

                      ]    ),
                      ),
                    )
                ))],
                ),
        ),
      ),
    );
  }
}