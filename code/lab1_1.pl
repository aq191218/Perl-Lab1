#!/usr/bin/perl
use strict;
use open ':encoding(cp866)';
binmode(STDOUT, ":cp866");
# Ввод чисел вектора
my @vector;

print "Введите элементы вектора (для завершения ввода нажмите Enter):\n";

# Считываем элементы вектора с клавиатуры
while (my $num = <STDIN>) {
    chomp($num);
    last if $num eq ''; # Завершаем ввод, если введена пустая строка

    if ($num =~ /^[-+]?\d+$/) { # Проверяем, является ли введенное значение целым числом
        push @vector, $num;
    } else {
        print "Ошибка: введено нецелое число. Повторите ввод.\n";
    }
}

# Ввод числа, кратность которому нужно найти
print "Введите кратность: ";
my $multiple = <STDIN>;
chomp($multiple);

# Нахождение минимального значения
my $min = $vector[0];
foreach my $num (@vector) {
    if ($num < $min) {
        $min = $num;
    }
}
print "Минимальное значение: $min\n";

# Нахождение чисел, кратных заданному числу
print "Числа, кратные $multiple: ";
foreach my $num (@vector) {
    if ($num % $multiple == 0) {
        print "$num ";
    }
}
print "\n";