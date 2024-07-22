#!/usr/bin/perl
use strict;

use open ':encoding(cp866)';
binmode(STDOUT, ":cp866");
# Ввод размеров матриц
print "Введите количество строк и столбцов для первой матрицы (через пробел): ";
my ($m1_rows, $m1_cols) = map { int($_) } split(' ', <STDIN>);
print "Введите количество строк и столбцов для второй матрицы (через пробел).: ";
my ($m2_rows, $m2_cols) = map { int($_) } split(' ', <STDIN>);

# Ввод элементов матриц
print "\nВведите элементы первой матрицы ($m1_rows x $m1_cols):\n";
my @matrix1;
for my $i (0..$m1_rows-1) {
    my @row = map { int($_) } split(' ', <STDIN>);
    push @matrix1, \@row;
}
print "\nВведите элементы второй матрицы ($m2_rows x $m2_cols):\n";
my @matrix2;
for my $i (0..$m2_rows-1) {
    my @row = map { int($_) } split(' ', <STDIN>);
    push @matrix2, \@row;
}

# Вывод матриц
print "\nМатрица 1:\n";
print_matrix(@matrix1);
print "\nМатрица 2:\n";
print_matrix(@matrix2);

# Сложение матриц
if ($m1_rows == $m2_rows && $m1_cols == $m2_cols) {
    my @sum_matrix;
    for my $i (0..$m1_rows-1) {
        my @row;
        for my $j (0..$m1_cols-1) {
            $row[$j] = $matrix1[$i][$j] + $matrix2[$i][$j];
        }
        push @sum_matrix, \@row;
    }
    print "\nСумма матриц:\n";
    print_matrix(@sum_matrix);
} else {
    print "\nМожно сложить только матрицы одинакового размера.\n";
}

# Умножение матриц
if ($m1_cols == $m2_rows) {
    my @product_matrix;
    for my $i (0..$m1_rows-1) {
        my @row;
        for my $j (0..$m2_cols-1) {
            my $sum = 0;
            for my $k (0..$m1_cols-1) {
                $sum += $matrix1[$i][$k] * $matrix2[$k][$j];
            }
            $row[$j] = $sum;
        }
        push @product_matrix, \@row;
    }
    print "\nПроизведение матриц:\n";
    print_matrix(@product_matrix);
} else {
    print "\nМатрицы можно перемножить только если число столбцов первой равняется числу строк второй.\n";
}

# Транспонирование матриц
my @transposed_matrix1;
for my $i (0..$m1_cols-1) {
    my @row;
    for my $j (0..$m1_rows-1) {
        $row[$j] = $matrix1[$j][$i];
    }
    push @transposed_matrix1, \@row;
}
print "\nТранспонирование матрицы 1:\n";
print_matrix(@transposed_matrix1);

my @transposed_matrix2;
for my $i (0..$m2_cols-1) {
    my @row;
    for my $j (0..$m2_rows-1) {
        $row[$j] = $matrix2[$j][$i];
    }
    push @transposed_matrix2, \@row;
}
print "\nТранспонирование матрицы 2:\n";
print_matrix(@transposed_matrix2);

sub print_matrix {
    my @matrix = @_;
    for my $i (0..$#matrix) {
        for my $j (0..$#{ $matrix[$i] }) {
            printf("%4d", $matrix[$i][$j]);
        }
        print "\n";
    }
}