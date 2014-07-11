open (FILE1, "<text1.txt");
open (FILE2, "<text2.txt");
foreach my $first_file (<FILE1>)
{
chomp $first_file; 
 
$result = `grep $first_file text2.txt`;
if ( $? ne 0 ) 
{
 print "$first_file not found \n"; 
 } 
}
close (FILE1);
