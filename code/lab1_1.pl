#!/usr/bin/perl
use strict;
use open ':encoding(cp866)';
binmode(STDOUT, ":cp866");
# ���� �ᥫ �����
my @vector;

print "������ ������ ����� (��� �����襭�� ����� ������ Enter):\n";

# ���뢠�� ������ ����� � ����������
while (my $num = <STDIN>) {
    chomp($num);
    last if $num eq ''; # �����蠥� ����, �᫨ ������� ����� ��ப�

    if ($num =~ /^[-+]?\d+$/) { # �஢��塞, ���� �� ��������� ���祭�� 楫� �᫮�
        push @vector, $num;
    } else {
        print "�訡��: ������� ��楫�� �᫮. ������ ����.\n";
    }
}

# ���� �᫠, ��⭮��� ���஬� �㦭� ����
print "������ ��⭮���: ";
my $multiple = <STDIN>;
chomp($multiple);

# ��宦����� �������쭮�� ���祭��
my $min = $vector[0];
foreach my $num (@vector) {
    if ($num < $min) {
        $min = $num;
    }
}
print "�������쭮� ���祭��: $min\n";

# ��宦����� �ᥫ, ����� ��������� ���
print "��᫠, ���� $multiple: ";
foreach my $num (@vector) {
    if ($num % $multiple == 0) {
        print "$num ";
    }
}
print "\n";