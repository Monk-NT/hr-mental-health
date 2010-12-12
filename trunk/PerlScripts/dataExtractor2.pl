##!/usr/bin/perl
%functionWords;
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
open FILE, ">>data2.arff" or die $!;

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
			functionW($word);
			
			#different words
			diffWords($word);
			#word total
			$wTotal++;
			
		}
	}
}

printAll();
close FILE;

sub punctmarks
{
	if($_[0]=~m/.*\./){
		$tPunctMarks++;				
	}
	if($_[0]=~m/.!/){
		$tPunctMarks++;
	}
	if($_[0]=~m/.\?/){
		$tPunctMarks++;
	}
	if($_[0]=~m/.,/){
		$tPunctMarks++;
	}
	if($_[0]=~m/.;/){
		$tPunctMarks++;
	}
	if($_[0]=~m/.:/){
		$tPunctMarks++;
	}
	if($_[0]=~m/.-/){
		$tPunctMarks++;
	}
}
#subroutine counts words with the same length
sub wordLen
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
#subroutine counts different words
sub diffWords
{
	$dWords{$_[0]}++;
}
#subroutine does final calculations and prints output
sub printAll
{
	my $tintpct;
	print FILE "\n";
	
	$wLen/=$wTotal;
	print FILE "$wLen, ";
	print FILE "$tPunctMarks, ";
	$Fwords/=$wTotal;
	print FILE "$Fwords, ";
	
	$i +=scalar keys %dWords;
	print scalar keys (%dWords);
	$diffWordsT=$i / $wTotal;
	print FILE "$diffWordsT";
	
}