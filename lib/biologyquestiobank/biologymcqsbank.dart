import 'package:hingorja_buisness/components/Questions.dart';

class QuizBrain {
  List<Questions> biologyQuestions = [
    Questions(
      'Which cellular structure is responsible for protein synthesis?',
      'Nucleus',
      'Ribosome',
      'Mitochondria',
      'Golgi apparatus',
      'Ribosome',
    ),
    Questions(
      'What is the function of the Golgi apparatus?',
      'Synthesizing ATP',
      'Modifying and packaging proteins',
      'Producing ribosomal RNA',
      'Storing genetic information',
      'Modifying and packaging proteins',
    ),
    Questions(
      'Which of the following is a plant hormone responsible for cell elongation and growth?',
      'Auxin',
      'Gibberellin',
      'Cytokinin',
      'Ethylene',
      'Auxin',
    ),
    Questions(
      'What is the function of hemoglobin in red blood cells?',
      'Carrying oxygen',
      'Carrying carbon dioxide',
      'Regulating blood pressure',
      'Producing energy',
      'Carrying oxygen',
    ),
    Questions(
      'Which enzyme breaks down starch into maltose?',
      'Amylase',
      'Lipase',
      'Protease',
      'Sucrase',
      'Amylase',
    ),
    Questions(
      'What is the role of the nephron in the kidney?',
      'Filtration of blood',
      'Production of urine',
      'Regulation of blood pressure',
      'Synthesis of glucose',
      'Production of urine',
    ),
    Questions(
      'Which vitamin is essential for blood clotting?',
      'Vitamin A',
      'Vitamin C',
      'Vitamin D',
      'Vitamin K',
      'Vitamin K',
    ),
    Questions(
      'What is the function of the cerebellum in the brain?',
      'Memory storage',
      'Coordination of movement and balance',
      'Emotional processing',
      'Vision processing',
      'Coordination of movement and balance',
    ),
    Questions(
      'Which part of the digestive system absorbs most nutrients from food?',
      'Stomach',
      'Small intestine',
      'Large intestine (colon)',
      'Esophagus',
      'Small intestine',
    ),
    Questions(
      'What type of tissue covers the external surface of the body and lines internal organs?',
      'Epithelial tissue',
      'Connective tissue',
      'Muscle tissue',
      'Nervous tissue',
      'Epithelial tissue',
    ),
  ];

  String getquestions() {
    return biologyQuestions[1].questionText;
  }
}
