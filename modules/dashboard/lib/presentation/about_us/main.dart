import 'package:flutter/material.dart';

import 'package:dashboard/presentation/about_us/item.dart';
import 'package:dashboard/presentation/assets.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  static const pageName = 'about_us';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LightAppBar(title: "About Us"),
      body: ListView(
        children: [
          imageAsset(AssetProvider.rocketGif, height: 250),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: AboutItem(
              title: "Know more about us",
              subtitle:
                  "We are group of young Professional Alims with an aim to teach the people online at the ease of their own home and their own time. We teach on the methodology of the Salaf us Saleheen. We believe on an authentic hadith of Prophet that the best amongst you are those who teach & learn the Quran.",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Container(
              decoration: BoxDecoration(
                color: grey99Color,
                border: Border.all(color: defaultLightGreyColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Padding(
                padding: EdgeInsets.all(25),
                child: AboutItem(
                  title: "What we are upto",
                  subtitle:
                      "Our aim is to become the best online academy so that people can get maximum help from our end. We believe that serving the Ummah is what we call it as serving the Humanity.",
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24, right: 24, top: 39, bottom: 46),
            child: AboutItem(
              title: "Who is it for?",
              subtitle:
                  "We do not put any restriction of the age, our academy is open for all age groups. You are cordially invited to Join us and make your journey smooth by learning the knowledge through us.",
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24, right: 24, bottom: 50),
            child: AboutItem(
              title: "What we teach?",
              subtitle:
                  "We teach from the basics of every course we have listed in our academy. We take anyone joining our academy as a beginner . We teach Tajweed & Makhraj, English Language, Urdu Language, Ruqyah Shariah and Special Course for Reverts.",
            ),
          ),
        ],
      ),
    );
  }
}
