#!/usr/bin/perl

%intpunct;
%wlength;
%fwords;
open FILE, "data/functionWords.txt" or die $!;
while(<FILE>)
{	chomp($_);
	$fwords{$_}=0;
}
close FILE;
open FILE, ">>data.arff" or die $!;
while(<STDIN>)
{
	$line = $_;                          
	chomp($line);
	@words=split(/ /,$line);
	foreach $word (@words)
	{
		#if word is a word, bird is the word!
		if($word=~m/^?[a-zA-Z]+?.$/)
		{
				#check for punctionation marks
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
			#word length
			if(length($word)>=10)
			{
				$wlength{10}++;
				print "10+ ";
			}
			else
			{
				$wlength{length($word)}++;
				print " ";
				print length($word);
			}
			for my $key (keys %fwords)
			{
				if(lc($key) eq lc($word))
				{
					$fwords{$key}++;
				}
			}
			#word total
			$wTotal++;
		}
	}
	
}

for my $key (keys %fwords)
{
	$fwords{$key}/=$wTotal;
}

print FILE "\n";


my $tintpct;
for my $key (keys %wlength)
{
	$wlength{$key}/=$wTotal;
	
		if(defined($wlength{$key}))
			{print FILE "$wlength{$key},";}
		else
			{print FILE "0,";}
	
}
for my $vals (values %intpunct)
{
	$tintpct=$tintpct+$vals;
}

for my $key ( keys %intpunct)
{
	$intpunct{$key}/=$tintpct;
	my $value = $intpunct{$key};
	print FILE "$value,";

	
}
for my $key (keys %fwords)
{
	print FILE "$fwords{$key},";
}
