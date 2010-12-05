#!/usr/bin/perl

%intpunct;
while(<STDIN>)
{
	$line = $_;
	chomp($line);
	@words=split(/ /,$line);
	foreach $word (@words)
	{
		#if word is a word
		if($word=~m/^?[a-zA-Z]+?.$/)
		{
			
				if($word=~m/.*\./)
				{
					$intpunct{"."}++;
					
					
				}
				if($word=~m/.!/)
				{
					
					$intpunct{"!"}++;
					
				}
				if($word=~m/.\?/)
				{
				
					$intpunct{"?"}++;
					
				}
				if($word=~m/.!/)
				{
					
					$intpunct{"!"}++;
					
				}
				if($word=~m/.,/)
				{
					
					$intpunct{","}++;
				
				}
				if($word=~m/.;/)
				{
					$intpunct{";"}++;
					
				}
				if($word=~m/.:/)
				{
					
					$intpunct{":"}++;
					
				}
				if($word=~m/.-/)
				{
					
					$intpunct{"-"}++;
					
				}
			
			$i++;
			print "$word";
			print "\n";
		}
	}
	
}
print "$i";	
print "INTERPUNCION:\n";
my $tintpct;
for my $vals (values %intpunct)
{
	$tintpct=$tintpct+$vals;
}

for my $key ( keys %intpunct)
{
	$intpunct{$key}/=$tintpct;
	my $value = $intpunct{$key};
	print "$key->";
print"	$value\n";
}
