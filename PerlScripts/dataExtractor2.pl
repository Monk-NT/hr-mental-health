##!/usr/bin/perl
%functionWords;
%pronouns;
$pronounC;
$tPunctMarks;
$wLen;
$Fwords=0;
%dWords;
open FILE, "data/functionWords.txt" or die $!;
while(<FILE>)
{	chomp($_);
	$functionWords{$_}=0;
}
close FILE;
open FILE, "data/pronouns.txt" or die $!;	
while(<FILE>)
{	chomp($_);
	$pronouns{$_}=0;
}
close FILE;
open FILE, ">>data-blog-x3-train.arff" or die $!;
while(<STDIN>){

	$line = $_;                          
	chomp($line);
	@words=split(/ /,$line);
	foreach $word (@words){
		
		#if word is a word, bird is the word!
		if($word=~m/^?[a-zA-Z]+?.$/){
			
			#check for punctionation marks, and remove them if exist
			$word=punctmarks($word);
			
			#word length
			wordLength($word);
			
			#function words
			functionW($word);
			
			#pronouns
			pronounsCount($word);
			#different words
			diffWords($word);
			#word total
			$wTotal++;
			
		}
	}
}

printAll();
close FILE;

#subroutine checks for punctuation marks and removes them,
#except in cases of:
#dash
#apostrophe
sub punctmarks
{
	if($_[0]=~m/.*\./){
		$tPunctMarks++;
		$_[0]=~ s/\.//;
	}
	if($_[0]=~m/.!/){
		$tPunctMarks++;
		$_[0]=~ s/!//;
		
	}
	if($_[0]=~m/.\?/){
		$tPunctMarks++;
		$_[0]=~ s/\?//;
	}
	if($_[0]=~m/.,/){
		$tPunctMarks++;
		$_[0]=~ s/,//;
	}
	if($_[0]=~m/.;/){
		$tPunctMarks++;
		$_[0]=~ s/;//;
	}
	if($_[0]=~m/.:/){
		$tPunctMarks++;
		$_[0]=~ s/://;
	}
	if($_[0]=~m/.-/){
		$tPunctMarks++;
	}
	if($_[0]=~m/.'/){
		$tPunctMarks++;
		if($_[0]=m/I'm/i){
			$_[0]="I";
			}
	}
	if($_[0]=~m/.?"/){
		#$tPunctMarks++;
		$_[0]=~ s/"//;
	}
	$_[0];
}
#subroutine counts words with the same length
sub wordLength
{
	$wLen+=length($_[0]);
}
#subroutine counts function words
sub functionW
{
	for my $key (keys %functionWords){
		if(lc($key) eq lc($_[0])){
			$Fwords++;
		}
	}
}
sub pronounsCount
{
	for my $key(keys %pronouns){
		if(lc($key) eq lc ($_[0])){
			$pronounC++;
		}
	}
}
#subroutine counts different words
sub diffWords
{
	$dWords{$_[0]}++;
}
#subroutine does final calculations and prints output
sub printAll
{
	
	
	print FILE "\n";
	
	$wLen/=$wTotal;
	print FILE "$wLen, ";
	$tPunctMarks/=$wTotal;
	print FILE "$tPunctMarks, ";
	$Fwords/=$wTotal;
	print FILE "$Fwords, ";
	$pronounC/=$wTotal;
	print FILE "$pronounC, ";
	$i +=scalar keys %dWords;
	$diffWordsT=$i / $wTotal;
	print FILE "$diffWordsT,";
	
	print FILE "bip";
	
}