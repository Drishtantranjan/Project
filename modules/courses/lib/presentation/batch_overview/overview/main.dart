import 'package:courses/presentation/batch_overview/announcement/main.dart';
import 'package:flutter/material.dart';

class BatchOverviewPage extends StatelessWidget {

   static String pageName = "Batch_overview";
     const BatchOverviewPage({super.key}) ;

  @override
  Widget build(BuildContext context) {

     return StudentOverviewContainer();
  }

 
}






 
 //////////////////////////////////////////////////////////////////////////////////////// Overview container for Student teacher and Admin

class StudentOverviewContainer extends StatelessWidget {
  final String updateDate = "March 20,2023";
  final String subjects =
      "Urdu, Arabic, Tajweed, Islamic, Aqeedah, Tafseer,fdsfd,fdsfd,dfdsfds,dfdsfds,,dfsfd,fdsfds,dfsfdsfdsfsfdsf,,dfdsfdfds"; // add subjects displayed here
  final List<String> instructors = ["Faculty 1", "Faculty 2",];

  StudentOverviewContainer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFFFF1A4B),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        height: 30,
                        width: 5,
                      ),
                      const Text(
                        "   New Announcement.",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>  AnnouncementContainer())));
                        },
                        child: const Text(
                          " Click here",
                          style: TextStyle(
                              color: Color(0xFFFF1A4B),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    
                    "Instructor",
                  
                    style: TextStyle(
                      
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
            
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: instructors.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        instructors[index],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 10),
                  child: Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 80,
                          child: Text(
                            "Subjects: ",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      ),
      Expanded(
      child: Text(
        subjects,
        style: const TextStyle(),
        maxLines: 7,
        overflow: TextOverflow.ellipsis,
      ),
      ),
    ],
  ),
),
              )),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.3,
                width: MediaQuery.of(context).size.width*0.9,
          decoration: BoxDecoration(
            border: Border.all(
        
            ),
           borderRadius: BorderRadius.circular(20) // use instead of BorderRadius.all(Radius.circular(20))
          ),
           child:Align(
  alignment: Alignment.centerLeft,
  child: Column(
    children: [
      Padding(
      padding: const EdgeInsets.only(top:25.0,left: 25,right: 25,bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFf4F4F4),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "Attendance",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Try not to\nmiss the classes",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
            width: MediaQuery.of(context).size.height*0.1,
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.1,
                  width: MediaQuery.of(context).size.height*0.1,
                  child: const CircularProgressIndicator(
                    value: 0.9,
                    backgroundColor: Color(0xFFf4F4F4),
                    strokeWidth: 10,
                  ),
                ),
                const Center(
                  child: Text(
                    "90%",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      ),
      Padding(
      padding: const EdgeInsets.only(right:20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Text(
            "Class Attended: ",
            style: TextStyle(
              fontSize: 12,
              color: Colors.black
            ),
          ),
          Text(
            "data",
            style: TextStyle(
              fontSize: 12,
              color: Colors.black
            ),
          )
        ],
      ),
      ),
      Padding(
      padding: const EdgeInsets.only(right:20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left:25.0),
            child: InkWell(
              child: Text(
                "View Details",
                style: TextStyle(
                  color: Color(0xFFFF1A4B),
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Row(
            children: const [
              Text(
                "Class Attended: ",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black
                ),
              ),
              Text(
                "data",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black
                ),
              )
            ],
          ),
        ],
      ),
      ),
      SizedBox(
      width: MediaQuery.of(context).size.width*0.75,
       height: MediaQuery.of(context).size.width*0.2,
      child: const Divider(
        height: 20,
        thickness: 2,
      ),
      ),
      Text("Updated on $updateDate")
    ],
  ),
)

        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.02,
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.start,
           children: const [
             Padding(
               padding: EdgeInsets.all(8.0),
               child: Text("Today's Schedule",
               style: TextStyle(
                fontWeight: FontWeight.bold
               ),),
             ),
           ],
         ),
            SizedBox(
          height: MediaQuery.of(context).size.height*0.02,
        ),
          Container(
             height: MediaQuery.of(context).size.height*0.13,
            width: MediaQuery.of(context).size.width*0.9,
           decoration: BoxDecoration(
             color: const Color(0xFFD1D1D1),
             borderRadius: BorderRadius.circular(20)
           ),
           child: Column(
            children: [
             Padding(
               padding: const EdgeInsets.only(left:15.0,top: 15,right: 15,bottom: 10),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   const Text("Arabic Classes" ,style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),), 
                   
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF1A4B),
                        borderRadius: BorderRadius.circular(2)
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(" Live Class",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),),
                      )),
                ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left:15.0),
               child: Row(
                 children: const [
                   Icon(Icons.alarm_on_outlined),
                   Text("  Date")
                 ],
               ),
             )
            
            ],
           )
         ),
         SizedBox(
          height: MediaQuery.of(context).size.height*0.02,
        ),
          Container(
             height: MediaQuery.of(context).size.height*0.13,
            width: MediaQuery.of(context).size.width*0.9,
           decoration: BoxDecoration(
             color: const Color(0xFFD1D1D1),
             borderRadius: BorderRadius.circular(20)
           ),
           child: Column(
            children: [
             Padding(
               padding: const EdgeInsets.only(left:15.0,top: 15,right: 15,bottom: 10),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   const Text("Arabic Classes" ,style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),), 
                   
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF1A4B),
                        borderRadius: BorderRadius.circular(2)
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(" Live Class",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),),
                      )),
                ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left:15.0),
               child: Row(
                 children:  const [
                   Icon(Icons.alarm_on_outlined),
                   Text("  Date")
                 ],
               ),
             )
            
            ],
           )
         ),
         SizedBox(
          height: MediaQuery.of(context).size.height*0.02,
        ),
         const Text("View Details",style: TextStyle(
          fontWeight: FontWeight.bold,
            color: Color(0xFFFF1A4B),
                
              ),),
           SizedBox(
          height: MediaQuery.of(context).size.height*0.02,
        ),
        
            ],
          ),
        ),
      ),
    );
  }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class TeacherOverviewContainer extends StatelessWidget {

    final String subjects = "Urdu, Arabic, Tajweed, Islamic, ,Aqeedah, Tafseer,fdsfd,fdsfd,dfdsfds,dfdsfds,dfsfd,";// add
  const TeacherOverviewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
              
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Quick Actions",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
              ),
              SizedBox(height: 30,)
            ],),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(

              children: const [
                Text("Schedula Live Class",style: TextStyle(
               color: Color(0xFFFF1A4B),
                ),),
                SizedBox(width: 20,),
                Text("Post Assignment",style: TextStyle(
               color: Color(0xFFFF1A4B),
                ),),
          
              ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Row(
                children: const [
                Text("Assign Test",style: TextStyle(
              color: Color(0xFFFF1A4B),
                  
                ),),
                SizedBox(width: 70,),
               Text("Announcement",style: TextStyle(
                 color: Color(0xFFFF1A4B),
                  
                ),),
               
                ],
              ),
            ),
             Padding(
                   padding: const EdgeInsets.only(left:10.0,top: 20),
                   child: Align(
                    alignment: Alignment.centerLeft,
                     child: Column(
                       children: const [
                         Text("Instructor",
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 15
                         ),),
                        SizedBox(
                          height: 10,
                        ),
                       ],
                     ),
                   ),
                 ),
                 Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(),
                    ),
                    SizedBox(width: 20,),
                    Text("Faculty 1",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),),
            
                  ],
                 ),
                  Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(),
                    ),
                    SizedBox(width: 20,),
                    Text("Faculty 2",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),),
            
                  ],
                 ),
                 Align(
                  alignment: Alignment.centerLeft
                  ,child: Padding(
                    padding: const EdgeInsets.only(top:8.0,left: 10),
                    child: Expanded(
                      child: Row(
                        children: [
                          const Text("Subjects: ",style: TextStyle(
                            fontWeight: FontWeight.bold,
                           
                          ),),
                          Expanded(
                            child: Text(subjects,style: const TextStyle(
                              
                            ),
                            maxLines: 4,),
                          )
                        ],
                      ),
                    ),
                  )),
                
             SizedBox(
            height: MediaQuery.of(context).size.height*0.02,
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
             children: const [
               Padding(
                 padding: EdgeInsets.all(8.0),
                 child: Text("Today's Schedule",
                 style: TextStyle(
                  fontWeight: FontWeight.bold
                 ),),
               ),
             ],
           ),
             SizedBox(
            height: MediaQuery.of(context).size.height*0.02,
          ),
            Container(
               height: MediaQuery.of(context).size.height*0.13,
              width: MediaQuery.of(context).size.width*0.9,
             decoration: BoxDecoration(
               color: const Color(0xFFD1D1D1),
               borderRadius: BorderRadius.circular(20)
             ),
             child: Column(
              children: [
               Padding(
                 padding: const EdgeInsets.only(left:15.0,top: 15,right: 15,bottom: 10),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     const Text("Arabic Classes" ,style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),), 
                     
                      Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF1A4B),
                          borderRadius: BorderRadius.circular(2)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(" Live Class",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),),
                        )),
                  ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left:15.0),
                 child: Row(
                   children: const [
                     Icon(Icons.alarm_on_outlined),
                     Text("  Date")
                   ],
                 ),
               )
              
              ],
             )
           ),
           SizedBox(
            height: MediaQuery.of(context).size.height*0.02,
          ),
            Container(
               height: MediaQuery.of(context).size.height*0.13,
              width: MediaQuery.of(context).size.width*0.9,
             decoration: BoxDecoration(
               color: const Color(0xFFD1D1D1),
               borderRadius: BorderRadius.circular(20)
             ),
             child: Column(
              children: [
               Padding(
                 padding: const EdgeInsets.only(left:15.0,top: 15,right: 15,bottom: 10),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     const Text("Arabic Classes" ,style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),), 
                     
                      Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF1A4B),
                          borderRadius: BorderRadius.circular(2)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(" Live Class",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),),
                        )),
                  ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left:15.0),
                 child: Row(
                   children: const [
                     Icon(Icons.alarm_on_outlined),
                     Text("  Date")
                   ],
                 ),
               )
              
              ],
             )
           ),
           SizedBox(
            height: MediaQuery.of(context).size.height*0.02,
          ),
           const Text("View Details",style: TextStyle(
            fontWeight: FontWeight.bold,
              color: Color(0xFFFF1A4B),
                  
                ),),
             SizedBox(
            height: MediaQuery.of(context).size.height*0.02,
          ),
          ]),
        ),
      ),
    );
  }
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class AdminOverviewContainer extends StatelessWidget {
   final String subjects =
      "Urdu, Arabic, Tajweed, Islamic, Aqeedah, Tafseer,fdsfd,fdsfd,dfdsfds,dfdsfds,,dfsfd,fdsfds,dfsfdsfdsfsfdsf,,dfdsfdfds"; 
  const AdminOverviewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
              
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Quick Actions",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
              ),
              SizedBox(height: 30,)
            ],),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(

              children: const [
                Text("Schedula Live Class",style: TextStyle(
               color: Color(0xFFFF1A4B),
                ),),
                SizedBox(width: 20,),
                Text("Post Assignment",style: TextStyle(
               color: Color(0xFFFF1A4B),
                ),),
          
              ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Row(
                children: const [
                Text("Assign Test",style: TextStyle(
              color: Color(0xFFFF1A4B),
                  
                ),),
                SizedBox(width: 70,),
               Text("Announcement",style: TextStyle(
                 color: Color(0xFFFF1A4B),
                  
                ),),
               
                ],
              ),
            ),
             Padding(
                   padding: const EdgeInsets.only(left:10.0,top: 20),
                   child: Align(
                    alignment: Alignment.centerLeft,
                     child: Column(
                       children: const [
                         Text("Instructor",
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 15
                         ),),
                        SizedBox(
                          height: 10,
                        ),
                       ],
                     ),
                   ),
                 ),
                 Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(),
                    ),
                    SizedBox(width: 20,),
                    Text("Faculty 1",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),),
            
                  ],
                 ),
                  Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(),
                    ),
                    SizedBox(width: 20,),
                    Text("Faculty 2",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),),
            
                  ],
                 ),
                Align(
  alignment: Alignment.centerLeft,
  child: Padding(
    padding: const EdgeInsets.only(top: 8.0, left: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Subjects: ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Text(
                subjects,
                style: const TextStyle(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Expanded(
          child: Text(
            subjects,
            style: const TextStyle(),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  ),
),

                
             SizedBox(
            height: MediaQuery.of(context).size.height*0.02,
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
             children: const [
               Padding(
                 padding: EdgeInsets.all(8.0),
                 child: Text("Today's Schedule",
                 style: TextStyle(
                  fontWeight: FontWeight.bold
                 ),),
               ),
             ],
           ),
             SizedBox(
            height: MediaQuery.of(context).size.height*0.02,
          ),
            Container(
               height: MediaQuery.of(context).size.height*0.13,
              width: MediaQuery.of(context).size.width*0.9,
             decoration: BoxDecoration(
               color: const Color(0xFFD1D1D1),
               borderRadius: BorderRadius.circular(20)
             ),
             child: Column(
              children: [
               Padding(
                 padding: const EdgeInsets.only(left:15.0,top: 15,right: 15,bottom: 10),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     const Text("Arabic Classes" ,style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),), 
                     
                      Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF1A4B),
                          borderRadius: BorderRadius.circular(2)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(" Live Class",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),),
                        )),
                  ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left:15.0),
                 child: Row(
                   children: const [
                     Icon(Icons.alarm_on_outlined),
                     Text("  Date")
                   ],
                 ),
               )
              
              ],
             )
           ),
           SizedBox(
            height: MediaQuery.of(context).size.height*0.02,
          ),
            Container(
               height: MediaQuery.of(context).size.height*0.13,
              width: MediaQuery.of(context).size.width*0.9,
             decoration: BoxDecoration(
               color: const Color(0xFFD1D1D1),
               borderRadius: BorderRadius.circular(20)
             ),
             child: Column(
              children: [
               Padding(
                 padding: const EdgeInsets.only(left:15.0,top: 15,right: 15,bottom: 10),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     const Text("Arabic Classes" ,style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),), 
                     
                      Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF1A4B),
                          borderRadius: BorderRadius.circular(2)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(" Live Class",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),),
                        )),
                  ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left:15.0),
                 child: Row(
                   children: const [
                     Icon(Icons.alarm_on_outlined),
                     Text("  Date")
                   ],
                 ),
               )
              
              ],
             )
           ),
           SizedBox(
            height: MediaQuery.of(context).size.height*0.02,
          ),
           const Text("View Details",style: TextStyle(
            fontWeight: FontWeight.bold,
              color: Color(0xFFFF1A4B),
                  
                ),),
             SizedBox(
            height: MediaQuery.of(context).size.height*0.02,
          ),
          ]),
        ),
      ),
    );
  }
}
 