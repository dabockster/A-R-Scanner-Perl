#!/usr/bin/perl

=pod
  Steven Bock
  October 2nd, 2014
  CSCE 343
  Homework 3
  
  BUGS:
  For some reason, it detects the favicon as an absolute url.

  SOURCES CITED:
  http://stackoverflow.com/questions/3828205/how-do-i-enter-a-multi-line-comment-in-perl
  https://www.perl.org/books/beginning-perl/
  http://stackoverflow.com/questions/20889609/how-should-i-use-the-my-keyword-in-perl
  http://stackoverflow.com/questions/10811104/downloading-the-html-of-a-page-using-perl
  http://www.perl.com/pub/2002/08/20/perlandlwp.html
  http://perldoc.perl.org/functions/defined.html
  http://search.cpan.org/~gaas/libwww-perl/lib/LWP/Simple.pm
  http://www.tizag.com/perlT/perluserinput.php
  http://stackoverflow.com/questions/11859438/how-to-get-only-specific-lines-from-web-page-content-in-perl
  http://stackoverflow.com/questions/6863407/remove-part-of-string-in-perl
  http://stackoverflow.com/questions/18727749/perl-regex-to-get-a-substring-between-two-of-the-same-characters
=cut

use warnings;
use strict;

#LWP (library for WWW in Perl - no user agent interface)
use LWP::Simple;

#url for the site
print "Enter a URL with http prefix: ";
my $url = <>;

#grab the content
my $webcontent = get $url;

#check if the site exists
die "URL could not be found." unless defined $webcontent;

#counter
my $count = 0;

#loop through the HTML
for my $line (split qr/\R/, get ($url)){
  #increment counter
  $count = $count + 1;
	
  #check for link tag
  if ($line =~ "href=\"(.*?)\""){
    #print line number
    print "Line number " . $count . "\n";

    #grab real url
    my $real_url = $1;

    #print the URL
    print "URL: " . $real_url . "\n";

    #check for absolute vs relative path
    if (index($real_url, "http") != -1){
      print "Absolute path detected";
    }
    elsif (index($real_url, "ftp") != -1){
      print "Absolute path detected";
    }
    else{
      print "Relative path detected";
    }

    #print line break
    print "\n\n";

  }
}
