import 'package:flutter/material.dart';

class Napcard extends StatefulWidget {
  const Napcard({super.key});

  @override
  State<Napcard> createState() => _NapcardState();
}

class _NapcardState extends State<Napcard> {
  String? selectedValue;
  String? selectedValue1;
  List<String> items = ['Viettel', 'Vinaphone', 'Mobifone', 'Vietnamoblie'];
  List<String> itemss = ['10.000', '20.000', '50.000', '100.000', '200.000', '500.000'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SafeArea(
        child: SingleChildScrollView( // Add SingleChildScrollView to allow scrolling
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Add padding to the overall content
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Loại thẻ ", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 8.0),
                DropdownButton<String>(
                  value: selectedValue,
                  hint: const Text('-Chọn loại thẻ-'),
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                const Text("Mệnh giá: ", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 8.0),
                DropdownButton<String>(
                  value: selectedValue1,
                  hint: const Text('-Chọn mệnh giá-'),
                  items: itemss.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue1 = newValue;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                const Text("Serial: ", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 8.0),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Nhập seriel thẻ",
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text("Mã thẻ: ", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 8.0),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Nhập mã thẻ",
                  ),
                ),
                const SizedBox(height: 15,),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title:const Text("Thông báo"),
                            content: const Text("Đang chờ xử lý..."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Đóng"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Border radius
                      ),
                    ),
                    child: const Text("Nạp thẻ",style: TextStyle(color: Colors.white),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}