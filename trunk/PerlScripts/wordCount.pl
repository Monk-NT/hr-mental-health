#!/usr/bin/perl

while(<STDIN>)
{
	$line = $_;
	chomp($line);
	@words=split(/ /,$line);
	foreach $word (@words)
	{
		
		if($word=~m/^[a-zA-Z]+?.$/)
		{
			$i++;
			print "$word";
			print "\n";
		}
	}
}
print "$i";	