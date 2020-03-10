The documentation for this project is handled by [Read the Docs](https://readthedocs.org/), a web service dedicated to documentation management for the open source community.

* [Reference documentation](https://docs.readthedocs.org/en/latest/)

By default, the [`Falkor/RR-tutorials`](https://github.com/Falkor/RR-tutorials) repository is bound to the [RR-tutorials](http://RR-tutorials.rtfd.org) project on [Read the Docs](https://readthedocs.org/).

You might wish to generate locally the docs:

* Install [`mkdocs`](http://www.mkdocs.org/#installation)
* Preview your documentation from the project root by running `mkdocs serve` and visit with your favorite browser the URL `http://localhost:8000`
     - Alternatively, you can run `make doc` at the root of the repository.
* build the full documentation locally (in the `site/` directory) by running `mkdocs build`.
