import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/endereco_provider.dart';
import '../../utils/colors.dart';
import '../../utils/theme_helper.dart';

class UfDroppButton extends StatefulWidget {
  const UfDroppButton({super.key});

  @override
  State<UfDroppButton> createState() => _UfDroppButtonState();
}

class _UfDroppButtonState extends State<UfDroppButton> {

  final List<String> genderItems = [
    'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG',
    'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE',
    'TO',
  ];

  String selectedValue = 'UF';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EnderecoProvider>(context);

    return Scaffold(
      body: Container(
        decoration: ThemeHelper().containerDecoration(),
        width: 52,
        padding: const EdgeInsets.all(2),
        child: DropdownButton2<String>(
          hint: Text(
            selectedValue,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),

          items: genderItems.map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          )).toList(),
          onChanged: (value) {
            setState( (){
              selectedValue = value.toString();
              provider.uf = value.toString();
            });
          },

          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: cinzaEscuro,
            ),
            iconSize: 24,
          ),

          dropdownStyleData: DropdownStyleData(
            maxHeight: 300,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
