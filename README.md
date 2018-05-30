# xslt transforms as a web service

If you can get by with xslt 1.0, xsltproc is much faster for rapid prototyping.

Saxon-HE is the only open source xslt 2.0 (and 3.0!) processor.
As a cli app, the jre start time does it no favours.
Instead, this repo runs Saxon-HE as a web service.
On my machine, transform time was 3x better compared to the cli.

Run a transform with your [favourite][httpie] http client.
Note the url query params, especially the cache busting:

    http --ignore-stdin --print b ':8090?style=/app/mytransform.xslt&source=/app/mydoc.xml&clear-stylesheet-cache=yes' | tee output.txt

This was thrown together with great speed and only just enough care.

# build and run the service

When you need to build the jar:

    docker build -t xsltservlet:dev dev/
    docker run --rm -it -v "$PWD:/app" xsltservlet:dev
    mvn package

Once you have the jar:

    cp target/saxonheservlet-0.1.0.jar run/
    docker build -t xsltservlet run/
    docker run --rm -p "8090:8080" -v "<MYWORKDIR>:/app" xsltservlet

# license

This repo distributes Saxon-HE 9.8.
[Saxon-HE is open source][license] under [MPL 2.0][mpl], and is itself composed of several open source components.
What little here that isn't covered by another license is under the [BSD 3-clause][bsd3]

[license]: https://www.saxonica.com/html/documentation/conditions/
[mpl]: http://www.mozilla.org/MPL/
[bsd3]: https://opensource.org/licenses/BSD-3-Clause
[httpie]: http://httpie.org
