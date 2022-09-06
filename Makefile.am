################################################################################

# Set Up Other Variables

## Enable local m4 cache
ACLOCAL_AMFLAGS = -I m4

## Info AutoCompilation
info_TEXINFOS = doc/apl-libs.texi

## Second listing, for srcdir
infofiles = $(srcdir)/doc/apl-libs.texi

## Extra Files for Distribution
EXTRA_DIST =  Changelog.md \
              LICENSE \
              COPYING \
              NEWS \
              AUTHORS \
              README.org \
              README.md \
              Changelog.md \
              ChangeLog \
              COPYING \
              m4/tar-edited.m4 \
              guix.scm \
	      doc/apl-libs.texi \
              doc/version.texi.in \
              doc/fdl-1.3.texi \
              doc/procedure-types.texi 

libsroot = $(datadir)/apl/yewscion
workspacesdir = $(libsroot)/workspaces
wslib1dir = $(libsroot)/wslib1
wslib2dir = $(libsroot)/wslib2
wslib6dir = $(libsroot)/wslib6
wslib7dir = $(libsroot)/wslib7
wslib8dir = $(libsroot)/wslib8
wslib9dir = $(libsroot)/wslib9

dist_workspaces_DATA = workspaces/Utils.apl
# dist_wslib1_DATA = 
# dist_wslib2_DATA = 
# dist_wslib6_DATA = 
# dist_wslib7_DATA = 
# dist_wslib8_DATA = 
# dist_wslib9_DATA = 
################################################################################

# Define Outputs

all: doc-text doc-html doc-docb doc-lpdf

doc-text: 
	texi2any --plaintext $(infofiles) > apl-libs.txt

doc-html:
	texi2any --html $(infofiles)

doc-docb:
	texi2any --docbook $(infofiles)

doc-lpdf:
	texi2pdf -c $(infofiles)

## Symlinks Can Go Here, along with other end-of-install changes
# install-data-hook:
# 	$(LN_S) $(DESTDIR)$(bindir)/realfile $(DESTDIR)$(bindir)/link
# 	chmod +x $(DESTDIR)$(javadir)/apl-libs.jar

################################################################################
