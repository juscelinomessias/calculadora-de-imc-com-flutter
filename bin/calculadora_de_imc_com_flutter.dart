import 'dart:convert';
import 'dart:io';

import 'package:calculadora_de_imc_com_flutter/classes/Pessoa.dart';

void main(List<String> arguments) {
  var p1 = Pessoa();

  print("Informe a seu Nome:");
  var line = stdin.readLineSync(encoding: utf8);
  p1.setNome(line!);

  try {
    print("Informe o seu Peso:");
    line = stdin.readLineSync(encoding: utf8);
    p1.setPeso(double.parse(line ?? "0"));
  } catch (e) {
    return print("Número inválido: $line");
  }

  try {
    print("Informe a sua Altura:");
    line = stdin.readLineSync(encoding: utf8);
    p1.setAltura(double.parse(line ?? "0"));
  } catch (e) {
    return print("Número inválido: $line");
  }

  var imc = p1.getPeso() / (p1.getAltura() * 2);
  var imcLimiteCasas = imc.toStringAsFixed(2);

  print(
      'Olá ${p1.getNome()}, o seu peso é ${p1.getPeso()}Kg e a sua altuara é ${p1.getAltura()}m');

  if (imc < 16) {
    print('O seu IMC é: $imcLimiteCasas - Magreza grave');
  } else if (imc >= 16 && imc < 17) {
    print('O seu IMC é: $imcLimiteCasas - Magreza moderada');
  } else if (imc >= 17 && imc < 18.5) {
    print('O seu IMC é: $imcLimiteCasas - Magreza leve');
  } else if (imc >= 18.5 && imc < 25) {
    print('O seu IMC é: $imcLimiteCasas - Saudável');
  } else if (imc >= 25 && imc < 30) {
    print('O seu IMC é: $imcLimiteCasas - Sobrepeso');
  } else if (imc >= 30 && imc < 35) {
    print('O seu IMC é: $imcLimiteCasas - Obesidade Grau I');
  } else if (imc >= 35 && imc < 40) {
    print('O seu IMC é: $imcLimiteCasas - Obesidade Grau II (severa)');
  } else if (imc >= 40) {
    print('O seu IMC é: $imcLimiteCasas - Obesidade Grau III (mórbida)');
  }
}
