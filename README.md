# usage

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
