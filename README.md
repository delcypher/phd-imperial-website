Personal PhD Website
====================

This is the source code for [Dan Liew's Imperial Homepage](http://www.doc.ic.ac.uk/~dsl11).

It is powered using [Twitter Bootstrap](http://twitter.github.io/bootstrap/) and is built using
[Hyde](https://github.com/hyde/hyde).

The licenses for the code used in this project can be found in ``LICENSES``.

Generating the pages
====================

The pages are generated from templates using [Hyde](https://github.com/hyde/hyde) .

To build do the following

Install Hyde
------------
Installing Hyde is pretty easy although it doesn't seem to work right with Python 3 right now.

```
$ pip2 install hyde
```

Note `pip2` is pip for python 2.x . If you don't have python 3 on your system that command will
probably just be `pip`.

Doing development
-----------------
Hyde can start a webserver on localhost that will regenerate pages whenever the page
is refreshed. To start the webserver run

```
$ hyde --sitepath /path/to/this/repository serve
```

The website will now be available at http://localhost:8080 by default.


How to deploy
--------------

```
$ hyde --sitepath /path/to/this/repository gen --deploy-path /path/to/deploy/folder
```

