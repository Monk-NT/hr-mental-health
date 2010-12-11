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
		}
	}
	
}
print "\@RELATION crazy-eddy\n\n";
print "\@ATTRIBUTE word-lenght01 NUMERIC\n";
print "\@ATTRIBUTE word-lenght02 NUMERIC\n";
print "\@ATTRIBUTE word-lenght03 NUMERIC\n";
print "\@ATTRIBUTE word-lenght04 NUMERIC\n";
print "\@ATTRIBUTE word-lenght05 NUMERIC\n";
print "\@ATTRIBUTE word-lenght06 NUMERIC\n";
print "\@ATTRIBUTE word-lenght07 NUMERIC\n";
print "\@ATTRIBUTE word-lenght08 NUMERIC\n";
print "\@ATTRIBUTE word-lenght09 NUMERIC\n";
print "\@ATTRIBUTE word-lenght10 NUMERIC\n";
print "\@ATTRIBUTE punctiation-marks NUMERIC\n";
for my $key (keys %fwords)
{
	$fwords{$key}/=$wTotal;
	print "\@ATTRIBUTE function-words-$key NUMERIC\n";
}

print"\n\n\@DATA";


my $tintpct;
for my $key (keys %wlength)
{
	$wlength{$key}/=$wTotal;
	if($wlenght{$key}=NULL)
	{	print "0,";
	}
	else
	{
		print "$wlenght{key},";
	}
}
for my $vals (values %intpunct)
{
	$tintpct=$tintpct+$vals;
}
print "$tintpct,";
for my $key ( keys %intpunct)
{
	$intpunct{$key}/=$tintpct;
	my $value = $intpunct{$key};

	
}
for my $key (keys %fwords)
{
	print "$fwords{$key},";
}
