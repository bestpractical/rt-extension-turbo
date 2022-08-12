use strict;
use warnings;
no warnings qw(redefine);

package RT::Interface::Web;


sub Redirect {
    my $redir_to = shift;
    untie $HTML::Mason::Commands::session;
    my $uri        = URI->new($redir_to);
    my $server_uri = URI->new( RT->Config->Get('WebURL') );

    # Make relative URIs absolute from the server host and scheme
    $uri->scheme($server_uri->scheme) if not defined $uri->scheme;
    if (not defined $uri->host) {
        $uri->host($server_uri->host);
        $uri->port($server_uri->port);
    }

    # If the user is coming in via a non-canonical
    # hostname, don't redirect them to the canonical host,
    # it will just upset them (and invalidate their credentials)
    # don't do this if $RT::CanonicalizeRedirectURLs is true
    if (   !RT->Config->Get('CanonicalizeRedirectURLs')
        && $uri->host eq $server_uri->host
        && $uri->port eq $server_uri->port )
    {
        my $env_uri = URI->new(GetWebURLFromRequest());
        $uri->scheme($env_uri->scheme);
        $uri->host($env_uri->host);
        $uri->port($env_uri->port);
    }

    # not sure why, but on some systems without this call mason doesn't
    # set status to 302, but 200 instead and people see blank pages
    $HTML::Mason::Commands::r->status(303);

    # Perlbal expects a status message, but Mason's default redirect status
    # doesn't provide one. See also rt.cpan.org #36689.
    $HTML::Mason::Commands::m->redirect( $uri->canonical, "303 See other" );

    $HTML::Mason::Commands::m->abort;
}


1;
