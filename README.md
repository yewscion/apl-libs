

# The `apl-libs` README

**A Personal Set of Libraries for GNU APL.**

*Last Updated: 2022-09-06 (W36) 02:21:22 GMT*


# Installation


## GNU Guix

If You use [GNU Guix](https://guix.gnu.org/), this package 
is on [my channel](https://sr.ht/~yewscion/yewscion-guix-channel/).

Once You have it set up, You can just run:

    guix pull
    guix install apl-libs

If You just want to try it out, You can use Guix Shell instead:

    guix shell apl-libs bash --pure

And if You'd rather just try it out without my channel, You can clone this
repo and then do:

    cd apl-libs
    guix shell -f guix.scm bash --pure

This'll create a profile with **just** this project in it, to mess around with.


## Source

If You don't want to use [GNU Guix](https://guix.gnu.org/),
You can clone this repo and install it in the normal way:

    git clone https://git.sr.ht/~yewscion/apl-libs
    cd apl-libs
    ./configure
    make
    make check
    make install

If You don't want to use git, or would rather stick with an
actual release, then see the tagged releases for some tarballs
of the source.

The needed dependencies are tracked in the `DEPENDENCIES.txt` file
to support this use case.

That said, due to the nature of APL Libraries, **installing this packages will
*not* automatically make these available to Your workspaces**. Setting up Your
own set of libraries and then `)COPY`-ing the workspaces (the `*.apl` files)
in is probably the best way, at least for now.


## Usage

To use any of these files as standalone workspaces, simply `)LOAD` or `)COPY`
them into Your current workspace.

Otherwise, You can use one of these entire libraries if You set one of Your
`LIBREF-*` variables to the path where the library You want (`wslib2` for
instance) lives. Note that in GNU Guix, this will be read-only, and that
doing so uses one of Your library slots.

*OTHERWISE*, You can adopt my libraries as Your own by setting
`$APL_LIB_ROOT` to the `yewscion` folder that is created during install… But
if You are using GNU Guix, remember that *all of these* will be read-only!
It's likely that You want one of the above instead, because You will be
unable to modify any of the libraries, and thus will have to work solely with
explicit paths to files.


# Contributing

Pull Requests are welcome, as are bugfixes and extensions. Please open
issues as needed. If You contribute a feature, needs to be tests and
documentation.

Development is expected to be done using [GNU Guix](https://guix.gnu.org/).
If You have `guix` set up, You should be able to enter a development
environment with the following:

    cd apl-libs
    guix shell -D -f guix.scm bash --pure

If You've made changes without the above precautions, those changes will
need to be confirmed to work in the above environment before merge.


# License

The `apl-libs` project and all associated files are ©2022 Christopher
Rodriguez, but licensed to the public at large under the terms of the:

[GNU AGPL3.0+](https://www.gnu.org/licenses/agpl-3.0.html) license.

Please see the `LICENSE` file and the above link for more information.

