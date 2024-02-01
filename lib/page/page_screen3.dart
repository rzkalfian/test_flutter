import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test_flutter/form_page.dart';

class PageScreen3 extends StatefulWidget {
  final FormDataModel formData;
  const PageScreen3(this.formData, {Key? key}) : super(key: key);

  @override
  State<PageScreen3> createState() => _PageScreen3State();
}

class _PageScreen3State extends State<PageScreen3> {
  @override
  Widget build(BuildContext context) {
    print("prov: ${widget.formData.provinsi}");
    print("kota: ${widget.formData.kota}");
    print("kec: ${widget.formData.kecamatan}");
    print("kel: ${widget.formData.kelurahan}");
    print("foto: ${widget.formData.imagePath}");
    return SafeArea(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Bio",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Gap(16),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Name",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ),
              Text(
                "${widget.formData.firstName} ${widget.formData.lastName}",
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          const Gap(8),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Biodata",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ),
              Text(
                widget.formData.biodata,
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          const Gap(8),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Province",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ),
              Text(
                widget.formData.provinsi!,
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          const Gap(8),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Kabupaten/Kota",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ),
              Text(
                widget.formData.kota!,
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          const Gap(8),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Kecamatan",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ),
              Text(
                widget.formData.kecamatan!,
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          const Gap(8),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Kelurahan",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ),
              Text(
                widget.formData.kelurahan!,
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          const Gap(16),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Gambar",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ),
              const Gap(8),
              if (widget.formData.imagePath != null)
                Image.file(
                  File(widget.formData.imagePath!),
                ),
            ]),
          ),
        ],
      ),
    );
  }
}
