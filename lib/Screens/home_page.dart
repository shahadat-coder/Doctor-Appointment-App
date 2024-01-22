
import 'package:doctor_appoinment_app/components/appointment_card.dart';
import 'package:doctor_appoinment_app/components/doctor_card.dart';
import 'package:doctor_appoinment_app/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> user = {};
  Map<String, dynamic> doctor = {};
  List<dynamic> favList = [];
  List<Map<String,dynamic>> medCat =[
    {
      "icon":FontAwesomeIcons.userDoctor,
      "category":'General'
    },
    {
      "icon":FontAwesomeIcons.heartPulse,
      "category":'Cardiology'
    },
    {
      "icon":FontAwesomeIcons.lungs,
      "category":'Respirations'
    },
    {
      "icon":FontAwesomeIcons.hand,
      "category":'Dermatology'
    },
    {
      "icon":FontAwesomeIcons.personPregnant,
      "category":'Gynecology'
    },
    {
      "icon":FontAwesomeIcons.teeth,
      "category":'Dental'
    },
  ];

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 30,
          ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'MD. Shahadat',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                  )
                ],
              ),
              Config.spaceMedium,
              const Text(
                'Category',
                style: TextStyle(
                  fontSize:16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,
              SizedBox(
                height: Config.heightSize * 0.05,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List<Widget>.generate(medCat.length, (index){
                    return Card(
                      margin: const EdgeInsets.only(right: 20),
                      color: Config.primaryColor,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,vertical: 10
                          ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            FaIcon(
                              medCat[index]['icon'],
                              color: Colors.white,
                            ),
                            const SizedBox(width: 10,),
                            Text(
                              medCat[index]['category'],
                              style: const TextStyle(
                                fontSize:16,
                                color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Config.spaceSmall,
              const Text(
                'Appointment Today',
                style: TextStyle(
                  fontSize:16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,
              const AppointmentCard(),
              Config.spaceSmall,
              const Text(
                'Top Doctors',
                style: TextStyle(
                  fontSize:16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,
              Column(
                children: List.generate(10, (index){
                  return DoctorCard(
                    doctor: user['doctor']?[index] ?? {}, // Use an empty map if null
                    isFav: favList
                        .contains(user['doctor']?[index]['doc_id'])
                        ? true
                        : false,
                  );

                }),
              )
            ],
          ),
        ),
      )
    );
  }
}
