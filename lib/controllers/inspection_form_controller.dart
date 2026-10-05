import 'package:flutter/material.dart';

enum InspectionType { postDelivery, preInspection }

class InspectionFormController extends ChangeNotifier {
  final TextEditingController districtController = TextEditingController(text: 'Agra');
  final TextEditingController schoolController = TextEditingController(text: 'J.H.S. CHITAURA (COMPOSITE)');
  final TextEditingController udiseController = TextEditingController(text: '09340104106');

  final TextEditingController selfieController = TextEditingController();
  final TextEditingController installationPhotoController = TextEditingController();
  final TextEditingController systemProofController = TextEditingController();
  final TextEditingController challanController = TextEditingController(text: 'CHL-2026-1042');
  final TextEditingController remarksController = TextEditingController();

  final TextEditingController inspectionDateController = TextEditingController(text: '22 April 2026');
  final TextEditingController inspectorNameController = TextEditingController(text: 'Akash Verma');
  final TextEditingController approvalNoteController = TextEditingController();
  final TextEditingController finalRemarksController = TextEditingController();

  final TextEditingController historySearchController = TextEditingController();

  InspectionType selectedInspectionType = InspectionType.postDelivery;
  bool postDeliverySelected = true;
  bool preInspectionSelected = false;

  static const List<String> districts = <String>[
    'Agra',
    'Kanpur Nagar',
    'Lucknow',
    'Varanasi',
    'Meerut',
  ];

  static const Map<String, List<String>> schoolsByDistrict = <String, List<String>>{
    'Agra': <String>[
      'J.H.S. CHITAURA (COMPOSITE)',
      'K.V. AGRA CANTT',
      'M.G. SCHOOL AGRA',
    ],
    'Kanpur Nagar': <String>[
      'Mali Stories Sajari UPS',
      'P.M.V. Dibiyaur',
      'POORV M. V. PATARA II',
    ],
    'Lucknow': <String>[
      'A.K. School Lucknow',
      'City Model Primary',
      'Govt. Basic School',
    ],
    'Varanasi': <String>[
      'Varanasi Central UPS',
      'Saraswati Vidya Mandir',
      'Rural Children School',
    ],
    'Meerut': <String>[
      'Meerut Public School',
      'UP Basic Vidyalaya',
      'Township Primary School',
    ],
  };

  List<String> get schools => schoolsByDistrict[districtController.text] ?? const <String>[];

  void setDistrict(String district) {
    districtController.text = district;
    final schoolList = schoolsByDistrict[district];
    if (schoolList != null && schoolList.isNotEmpty) {
      schoolController.text = schoolList.first;
    } else {
      schoolController.clear();
    }
    notifyListeners();
  }

  void setSchool(String school) {
    schoolController.text = school;
    notifyListeners();
  }

  void setInspectionType(InspectionType type) {
    selectedInspectionType = type;
    postDeliverySelected = type == InspectionType.postDelivery;
    preInspectionSelected = type == InspectionType.preInspection;
    notifyListeners();
  }

  void toggleInspectionType(bool selectPostDelivery) {
    setInspectionType(
      selectPostDelivery ? InspectionType.postDelivery : InspectionType.preInspection,
    );
  }

  void updateHistorySearch(String value) {
    historySearchController.text = value;
    notifyListeners();
  }

  bool get canContinueStep1 =>
      districtController.text.trim().isNotEmpty &&
      schoolController.text.trim().isNotEmpty;

  bool get canContinueStep2 =>
      selfieController.text.trim().isNotEmpty ||
      installationPhotoController.text.trim().isNotEmpty ||
      systemProofController.text.trim().isNotEmpty ||
      challanController.text.trim().isNotEmpty ||
      remarksController.text.trim().isNotEmpty;

  bool get canFinish =>
      inspectionDateController.text.trim().isNotEmpty &&
      inspectorNameController.text.trim().isNotEmpty;

  @override
  void dispose() {
    districtController.dispose();
    schoolController.dispose();
    udiseController.dispose();
    selfieController.dispose();
    installationPhotoController.dispose();
    systemProofController.dispose();
    challanController.dispose();
    remarksController.dispose();
    inspectionDateController.dispose();
    inspectorNameController.dispose();
    approvalNoteController.dispose();
    finalRemarksController.dispose();
    historySearchController.dispose();
    super.dispose();
  }
}
