import 'package:flutter/material.dart';

import 'page/page_screen1.dart';
import 'page/page_screen2.dart';
import 'page/page_screen3.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  int currentStep = 0;

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
        content: PageScreen1(),
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

class Wizard2 extends StatefulWidget {
  const Wizard2({Key? key}) : super(key: key);

  @override
  _Wizard2State createState() => _Wizard2State();
}

class _Wizard2State extends State<Wizard2> {
  // TODO: Implement the second wizard screen (photo upload)

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // TODO: Add UI components for photo upload
          const Text('Wizard 2 - Photo Upload Screen'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // TODO: Navigate to the next wizard screen (Wizard3)
            },
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}

class Wizard3 extends StatelessWidget {
  // TODO: Implement the third wizard screen (display JSON data)

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // TODO: Add UI components to display JSON data
          const Text('Wizard 3 - Display JSON Data Screen'),
        ],
      ),
    );
  }
}
