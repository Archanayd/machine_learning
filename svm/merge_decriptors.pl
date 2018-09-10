use warnings;
#To merge all decriptors files 
open(FH1,"$ARGV[0]");
open(FH2,"$ARGV[1]");
open(FH3,"$ARGV[2]");
while(<FH1>)
{
	if(/^#/){next}
	chomp;
	my @tm = split(/\t/);
	my $ky =shift @tm;
	my $val = join("\t", @tm);
	$hash{$ky} = $val;
	#print scalar @tm,"\n";
	#<STDIN>;
}
close(FH1);
while(<FH2>)
{
	if(/^#/){next}
        chomp;
        my @tm = split(/\t/);
        my $ky =shift @tm;
        my $val = join("\t", @tm);
	$hash{$ky} = "$hash{$ky}\t$val";
}
close(FH2);
while(<FH3>)
{
	if(/^#/){next}
        chomp;
        my @tm = split(/\t/);
        my $ky =shift @tm;
        my $val = join("\t", @tm);
        $hash{$ky} = "$hash{$ky}\t$val";
}
close(FH3);
foreach my $k(sort keys %hash)
{
	if($k =~ /^\*/)
	{
		print "+1\t";
	}else
	{print "-1\t";}
	$hash{$k} =~ s/\t$//;
	my @val = split(/\t/,$hash{$k});
	#print scalar @val,"\n";
	#<STDIN>;
	for(my $i=0; $i<scalar @val; $i++)
	{
		my $c = $i+1;
		print "$c:$val[$i]\t";
	}
	print "\t#$k\n";
}
exit;
