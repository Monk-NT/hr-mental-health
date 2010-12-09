#!/usr/bin/perl

%intpunct;
%wlength;
%fwords;
open FILE, "data/functionWords.txt" or die $!;
while(<FILE>)
{	chomp($_);
	$fwords{$_}=0;
}

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
			#word length
			if(length($word)>=10)
			{
				$wlength{10}++;
			}
			else
			{
			$wlength{length($word)}++;
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
			print "$word";
			print "\n";
		}
	}
	
}

my $tintpct;
for my $key (keys %wlength)
{
	$wlength{$key}/=$wTotal;
}
for my $vals (values %intpunct)
{
	$tintpct=$tintpct+$vals;
}

for my $key ( keys %intpunct)
{
	$intpunct{$key}/=$tintpct;
	my $value = $intpunct{$key};

	
}
for my $key (keys %fwords)
{
	$fwords{$key}/=$wTotal;
	print "$key : $fwords{$key}\n";
}
