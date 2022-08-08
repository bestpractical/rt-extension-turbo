use strict;
use warnings;
package RT::Extension::Turbo;

our $VERSION = '0.01';

RT->AddJavaScript('turbo.es2017-umd.js');
RT->AddJavaScript('rt-extension-turbo.js');

=head1 NAME

RT-Extension-Turbo - Experimental extension using Turbo

=head1 DESCRIPTION

An experimental extension using L<Turbo|https://turbo.hotwired.dev/> with RT.

=head1 RT VERSION

Works with RT 5.

=head1 INSTALLATION

=over

=item C<perl Makefile.PL>

=item C<make>

=item C<make install>

May need root permissions

=item Patch RT

If you are running on RT 5.0.3 or earlier, apply the included patch:

    patch -p1 -d /opt/rt5 < patches/0001-Add-callback-to-modify-content-presented-via-TitleBo.patch

=item Edit your F</opt/rt4/etc/RT_SiteConfig.pm>

Add this line:

    Plugin('RT::Extension::Turbo');

=item Clear your mason cache

    rm -rf /opt/rt4/var/mason_data/obj

=item Restart your webserver

=back

=head1 ToDo

=over

=item *

Make it a user-level and global config option to switch homepages

=item *

Get forms working (Quickcreate)

=item *

Add auto-refresh feature per portlet

=item *

Update RT to read the "collapsed" cookie setting and load titlebox
closed if the titlebox has been hidden. Currently we load open, then
quickly close it. This allows lazy load to work properly.

=back

=head1 AUTHOR

Best Practical Solutions, LLC E<lt>modules@bestpractical.comE<gt>

=for html <p>All bugs should be reported via email to <a
href="mailto:bug-RT-Extension-Turbo@rt.cpan.org">bug-RT-Extension-Turbo@rt.cpan.org</a>
or via the web at <a
href="http://rt.cpan.org/Public/Dist/Display.html?Name=RT-Extension-Turbo">rt.cpan.org</a>.</p>

=for text
    All bugs should be reported via email to
        bug-RT-Extension-Turbo@rt.cpan.org
    or via the web at
        http://rt.cpan.org/Public/Dist/Display.html?Name=RT-Extension-Turbo

=head1 LICENSE AND COPYRIGHT

This software is Copyright (c) 2022 by Best Practical Solutions, LLC

This is free software, licensed under:

  The GNU General Public License, Version 2, June 1991

=cut

1;
