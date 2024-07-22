#!/usr/bin/perl
use strict;

use open ':encoding(cp866)';
binmode(STDOUT, ":cp866");
# ���� ��ப�
print "������ ��ப�: ";
my $string = <STDIN>;
chomp($string);

# ���� �����ப�
print "������ �����ப�: ";
my $substring = <STDIN>;
chomp($substring);

# ���� ����樨 �����ப� � ��ப�
my $position = index($string, $substring);

# �뢮� १����
if ($position != -1) {
    print "������ �����ப� '$substring' � ��ப� -- $position \n";
} else {
    print "�����ப� '$substring' �� ������� � ��ப� \n";
}