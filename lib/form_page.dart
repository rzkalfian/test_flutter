import 'package:flutter/material.dart';

import 'page/page_screen1.dart';
import 'page/page_screen2.dart';
import 'page/page_screen3.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();

  void onNextClicked(
    String firstName,
    String lastName,
    String biodata,
    String tempProv,
    String tempKota,
    String tempKec,
    String tempKel,
  ) {
    // Implementasikan logika yang ingin Anda lakukan dengan data di sini
    print('First Name: $firstName');
    print('Last Name: $lastName');
    print('Bio: $biodata');
    print('Provinsi: $tempProv');
    print('Kota: $tempKota');
    print('Kecamatan: $tempKec');
    print('Kelurahan: $tempKel');
  }
}

class _FormPageState extends State<FormPage> {
  int currentStep = 0;
  // PageScreen1 pageScreen1 = PageScreen1();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController biodataController = TextEditingController();
  String? tempProv;
  String? tempKota;
  String? tempKec;
  String? tempKel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Wizard Test",
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: currentStep,
            onStepCancel: () => currentStep == 0
                ? null
                : setState(() {
                    currentStep -= 1;
                  }),
            onStepContinue: () {
              bool isLastStep = (currentStep == getSteps().length - 1);
              if (isLastStep) {
                //Do something with this information
                widget.onNextClicked;
              } else {
                setState(() {
                  currentStep += 1;
                });
              }
            },
            onStepTapped: (step) => setState(() {
              currentStep = step;
            }),
            steps: getSteps(),
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text("Account"),
        content: PageScreen1(
          onNextClicked: (String firstName,
              String lastName,
              String biodata,
              String? tempProv,
              String? tempKota,
              String? tempKab,
              String? tempKel) {},
        ),
      ),
      Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text("Identitiy"),
          content: PageScreen2()),
      Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text("Bio"),
          content: PageScreen3()),
    ];
  }
}
