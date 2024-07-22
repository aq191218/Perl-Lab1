#!/usr/bin/perl
use strict;

use open ':encoding(cp866)';
binmode(STDOUT, ":cp866");
# Ввод строки
print "Введите строку: ";
my $string = <STDIN>;
chomp($string);

# Ввод подстроки
print "Введите подстроку: ";
my $substring = <STDIN>;
chomp($substring);

# Поиск позиции подстроки в строке
my $position = index($string, $substring);

# Вывод результата
if ($position != -1) {
    print "Позиция подстроки '$substring' в строке -- $position \n";
} else {
    print "Подстрока '$substring' не найдена в строке \n";
}