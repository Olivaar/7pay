import 'package:avaliacao_seven_pay/view/widgets/uf_droppbutton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/endereco_provider.dart';
import '../../utils/colors.dart';
import '../../utils/theme_helper.dart';

class SearchContainer extends StatelessWidget {

  SearchContainer({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _lagradouroController = TextEditingController();
  String hintCity = 'Cidade';
  String hintPublicPlace = 'Lagradouro';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EnderecoProvider>(context);
    String selectedUf = provider.uf;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.all(10),
      decoration: ThemeHelper().containerDecoration(),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Form(
              key: _formKey,
              child: Row(
                children: [
                  const SizedBox(
                    height: 30,
                    width: 52,
                    child: UfDroppButton(),
                  ),
                  const SizedBox(width: 5,),
                  SizedBox(
                    height: 30,
                    width: 120,
                    child: TextFormField(
                      controller: _cidadeController,
                      decoration: ThemeHelper().textInputDecoration(hintCity),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe uma cidade';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _formKey.currentState?.validate();
                      },
                    ),
                  ),
                  const SizedBox(width: 5,),
                  SizedBox(
                    height: 30,
                    width: 150,
                    child: TextFormField(

                      controller: _lagradouroController,
                      decoration: ThemeHelper().textInputDecoration('LAGRADOURO'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe um lagradouro';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _formKey.currentState?.validate();
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      selectedUf = provider.uf;
                      if (selectedUf == 'UF') {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Atenção'),
                            content: const SingleChildScrollView(
                              child: Text('Por favor, selecione uma UF válida.'),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      } else if (_formKey.currentState!.validate()) {
                        provider.buscarEnderecos(
                            _cidadeController.text,
                            _lagradouroController.text
                        );
                      }
                    },
                    focusColor: cinzaClaro,
                    icon: const Icon(
                      Icons.search,
                      color: cinzaEscuro,
                    ),
                  ),
                ],
              )
            ),
          ),
          Expanded(
            flex: 2,
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.end,
              direction: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: TextButton(
                    style: ThemeHelper().buttonStyle(),
                    onPressed: () {},
                    child: Center(
                      child: Text(
                        'FILTRAR',
                        style: ThemeHelper().textStyleWhite(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: TextButton(
                    style: ThemeHelper().buttonStyle(),
                    onPressed: () {},
                    child: Center(
                      child: Text(
                        'ATUALIZAR',
                        style: ThemeHelper().textStyleWhite(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: TextButton(
                    style: ThemeHelper().buttonStyle(),
                    onPressed: () {},
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            'CADASTRAR',
                            style: ThemeHelper().textStyleWhite(),
                          ),
                          const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.file_download_outlined,
                    color: cinzaEscuro,
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
