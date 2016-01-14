open (FILE1, "<text1.txt");
open (FILE2, "<text2.txt");
foreach my $first_file (<FILE1>)
 {
open (FILE2, "<text2.txt");
  $found = 0 ; 
 foreach my $second_file (<FILE2>)
  {

  if ($second_file eq  $first_file)
   {
   $found = 1;
   last; 
   }
  }
  
close (FILE2);
print "No match found for ===== $first_file \n" if ( $found == 0 );
 } 
close (FILE1);
