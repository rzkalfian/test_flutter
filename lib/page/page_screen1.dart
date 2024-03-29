import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:ionicons/ionicons.dart';
import 'package:test_flutter/form_page.dart';

class PageScreen1 extends StatefulWidget {
  final FormDataModel formData;
  const PageScreen1(this.formData, {Key? key}) : super(key: key);

  @override
  State<PageScreen1> createState() => _PageScreen1State();
}

class _PageScreen1State extends State<PageScreen1> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController biodataController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set default values from the formData when available
    firstNameController.text = widget.formData.firstName;
    lastNameController.text = widget.formData.lastName;
    biodataController.text = widget.formData.biodata;
    tempProv = widget.formData.provinsi;
    tempKota = widget.formData.kota;
    tempKec = widget.formData.kecamatan;
    tempKel = widget.formData.kelurahan;
  }

  List<String> provinsiList = [
    'Provinsi A',
    'Provinsi B',
    'Provinsi C',
    'Provinsi D',
    'Provinsi E',
    'Provinsi F',
    'Provinsi G',
  ];
  String? selectedProvinsi;
  String? tempProv;

  List<String> kotaList = [
    'Kabupaten A',
    'Kabupaten B',
    'Kabupaten C',
    'Kabupaten D',
    'Kabupaten E',
    'Kabupaten F',
    'Kabupaten G',
  ];
  String? selectedKota;
  String? tempKota;

  List<String> kecamatanList = [
    'Kecamatan A',
    'Kecamatan B',
    'Kecamatan C',
    'Kecamatan D',
    'Kecamatan E',
    'Kecamatan F',
    'Kecamatan G',
  ];
  String? selectedKecamatan;
  String? tempKec;

  List<String> kelurahanList = [
    'Kelurahan A',
    'Kelurahan B',
    'Kelurahan C',
    'Kelurahan D',
    'Kelurahan E',
    'Kelurahan F',
    'Kelurahan G',
  ];
  String? selectedKelurahan;
  String? tempKel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "First Name",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: firstNameController,
                onChanged: (value) {
                  widget.formData.firstName = value;
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  hintText: "First Name",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Last Name",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: lastNameController,
                onChanged: (value) {
                  widget.formData.lastName = value;
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  hintText: "Last Name",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Bio",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: biodataController,
                onChanged: (value) {
                  widget.formData.biodata = value;
                },
                maxLines: 4,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  // hintText: "Last Name",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Provinsi",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      suffixIcon: const Icon(
                        Ionicons.search_sharp,
                        color: Colors.blue,
                      ),
                      hintText: "Provinsi",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  searchDelay: const Duration(microseconds: 5000),
                ),
                items: provinsiList.map((map) => map.toString()).toList(),
                onChanged: (value) {
                  // final selectedDescId =
                  //     provinsiList.firstWhere((map) => map.toString() == value);
                  // print("value city ID: $selectedDescId");
                  setState(() {
                    selectedProvinsi = value;
                    widget.formData.provinsi = selectedProvinsi;
                    tempProv = widget.formData.provinsi;
                    print("value Prov:$tempProv");
                  });
                },
                selectedItem: selectedProvinsi,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    hintText: "Pilih Provinsi",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFDC822A)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Kab/Kota",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      suffixIcon: const Icon(
                        Ionicons.search_sharp,
                        color: Colors.blue,
                      ),
                      hintText: "Kab/Kota",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  searchDelay: const Duration(microseconds: 5000),
                ),
                items: kotaList.map((map) => map.toString()).toList(),
                onChanged: (value) {
                  // final selectedDescId =
                  //     kotaList.firstWhere((map) => map.toString() == value);
                  // print("value city ID: $selectedDescId");
                  setState(() {
                    selectedKota = value;
                    widget.formData.kota = selectedKota;
                    tempKota = widget.formData.kota;
                    print("value Prov:$tempKota");
                  });
                },
                selectedItem: selectedKota,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    hintText: "Pilih Kabupaten/Kota",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Kecamatan",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      suffixIcon: const Icon(
                        Ionicons.search_sharp,
                        color: Colors.blue,
                      ),
                      hintText: "Kecamatan",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  searchDelay: const Duration(microseconds: 5000),
                ),
                items: kecamatanList.map((map) => map.toString()).toList(),
                onChanged: (value) {
                  // final selectedDescId = kecamatanList
                  //     .firstWhere((map) => map.toString() == value);
                  // print("value city ID: $selectedDescId");
                  setState(() {
                    selectedKecamatan = value;
                    widget.formData.kecamatan = selectedKecamatan;
                    tempKec = widget.formData.kecamatan;
                    print("value Prov:$tempKec");
                  });
                },
                selectedItem: selectedKecamatan,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    hintText: "Pilih Kecamatan",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Desa/Kelurahan",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      suffixIcon: const Icon(
                        Ionicons.search_sharp,
                        color: Colors.blue,
                      ),
                      hintText: "Desa/Kelurahan",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  searchDelay: const Duration(microseconds: 5000),
                ),
                items: kelurahanList.map((map) => map.toString()).toList(),
                onChanged: (value) {
                  // final selectedDescId = kelurahanList
                  //     .firstWhere((map) => map.toString() == value);
                  // print("value city ID: $selectedDescId");
                  setState(() {
                    selectedKelurahan = value;
                    widget.formData.kelurahan = selectedKelurahan;
                    tempKel = widget.formData.kelurahan;
                    print("value Prov:$tempKel");
                  });
                },
                selectedItem: selectedKelurahan,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    hintText: "Pilih Desa/Kelurahan",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFDC822A)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
