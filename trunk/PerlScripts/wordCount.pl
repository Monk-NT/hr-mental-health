#!/usr/bin/perl

%intpunct;
%wlength;
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
			if(length($word)>=10)
			{
				$wlength{10}++;
			}
			else
			{
			$wlength{length($word)}++;
			}
			$wTotal++;
			print "$word";
			print "\n";
		}
	}
	
}
print "$i";	
print "INTERPUNCION:\n";
my $tintpct;
for my $key (keys %wlength)
{
	$wlength{$key}/=$wTotal;
	print "$key=> $wlength{$key}\n";
}
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
