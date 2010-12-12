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
while(<STDIN>){

	$line = $_;                          
	chomp($line);
	@words=split(/ /,$line);
	
	foreach $word (@words){
		
		#if word is a word, bird is the word!
		if($word=~m/^?[a-zA-Z]+?.$/){
			
			#check for punctionation marks
			punctmarks($word);
			
			#word length
			wordLen($word);
			
			#function words
			functionW($words);
			
			#word total
			$wTotal++;
		}
	}
}

printAll();

#subroutine checks if punctiation marks exist in the word.
sub punctmarks
{
	if($_[0]=~m/.*\./){
		$intpunct{"."}++;				
	}
	if($_[0]=~m/.!/){
		$intpunct{"!"}++;
	}
	if($_[0]=~m/.\?/){
		$intpunct{"?"}++;
	}
	if($_[0]=~m/.,/){
		$intpunct{","}++;
	}
	if($_[0]=~m/.;/){
		$intpunct{";"}++;
	}
	if($_[0]=~m/.:/){
		$intpunct{":"}++;
	}
	if($_[0]=~m/.-/){
		$intpunct{"-"}++;
	}
}
#subroutine counts words with the same length
sub wordLen
{
	if(length($_[0])>=10){
		$wlength{10}++;
	}
	else{
		$wlength{length($_[0])}++;
	}
}
#subroutine counts function words
sub functionW
{
	for my $key (keys %fwords){
		if(lc($key) eq lc($_[0])){
			$fwords{$key}++;
		}
	}
}
#subroutine does final calculations and prints output
sub printAll
{
	my $tintpct;
	print FILE "\n";
	for my $key (keys %wlength){
		$wlength{$key}/=$wTotal;
		
		if(defined($wlength{$key})){
			print FILE "$wlength{$key},";
		}
		else{
			print FILE "0,";
		}
	}
	for my $vals (values %intpunct){
		$tintpct=$tintpct+$vals;
	}

	for my $key ( keys %intpunct){
		$intpunct{$key}/=$tintpct;
		print FILE "$intpunct{$key},";
	}
	for my $key (keys %fwords){
		$fwords{$key}/=$wTotal;
		print FILE "$fwords{$key},";
	}
}