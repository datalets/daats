# Tree Cadastre (Baumkataster) Data

This is a list of trees in the City of Zürich provided as a [Simple Data Format](http://dataprotocols.readthedocs.io/en/latest/simple-data-format.html), compiled by [dat.alets.ch](https://dat.alets.ch). The metadata was collected by us through web searches and public contributions, and is provided as "best effort", without any guarantee of correctness.

**To add new datasets or make modifications, please visit our [GitHub repository](https://github.com/schoolofdata-ch/baumkataster-data) and contact us via Issues or Pull Request.**

## Preparation

A CSV file was created based on the [GeoPackage](https://www.stadt-zuerich.ch/portal/de/index/ogd/werkstatt/gpkg.html) obtained from [opendata.swiss](https://opendata.swiss/de/dataset/baumkataster-der-stadt-zurich), and filtered to exclude binary blobs and extract data using an SQL query.

Run `make` in the root folder to fetch and convert the data. You need to have **sqlite3** and **curl** commands available on your system.

[![](https://assets.okfn.org/p/data/img/logo.png)](https://data.okfn.org/tools/view?url=https%3A%2F%2Fraw.githubusercontent.com%2Fschoolofdata-ch%2Fbaumkataster-data%2Fmaster%2Fdatapackage.json)

[View this Data Package ](https://data.okfn.org/tools/view?url=https%3A%2F%2Fraw.githubusercontent.com%2Fschoolofdata-ch%2Fbaumkataster-data%2Fmaster%2Fdatapackage.json)

## License

This package is licensed by its maintainers under the Public Domain Dedication
and License.

If you intended to use these data in a public or commercial product, please
check the data sources themselves for any specific restrictions.
