# Tree Cadastre (Baumkataster) Data

This is a list of trees in the City of Zürich provided as a [Simple Data Format](http://dataprotocols.readthedocs.io/en/latest/simple-data-format.html), compiled by [dat.alets.ch](https://dat.alets.ch). The metadata was collected by us through web searches and public contributions, and is provided as "best effort", without any guarantee of correctness.

**To add new datasets or make modifications, please visit our [GitHub repository](https://github.com/schoolofdata-ch/baumkataster-data) and contact us via Issues or Pull Request.**

## Preparation

A CSV file was created based on the [GeoPackage](https://www.stadt-zuerich.ch/portal/de/index/ogd/werkstatt/gpkg.html) obtained from [opendata.swiss](https://opendata.swiss/de/dataset/baumkataster-der-stadt-zurich), and filtered to exclude binary blobs and extract data using an SQL query.

> **Note**: it is no longer possible to directly download this data. You have to [visit this webpage](https://www.stadt-zuerich.ch/geodaten/download/Baumkataster?format=10005), under the map select `Ausschnitt > Stadt Zürich` then click Download. Then select `Zu Meine Bestellungen`, wait for the process to complete (2-5 minutes), and then click `Herunterladen`. Extract this ZIP in the root of this project, and you should see a `data.gpkg` in the **data** folder.

Run `make` in the root folder to ~~fetch and~~ convert the data. You need to have **ogr2ogr**, **awk** and **curl** commands available on your system. (Note on Windwows: make sure to have both ogr2ogr, e.g. if you have QGIS installed `C:\Program Files\QGIS 3.8\bin`, in your system path and the `GDAL_DATA` variable, e.g. to `C:\Program Files\QGIS 3.8\share\gdal`, set)

In case **ogr2ogr** is not available, you can run `make nogeom`. For this **sqlite3** needs to be installed.

[![](https://assets.okfn.org/p/data/img/logo.png) Preview Data Package](https://data.okfn.org/tools/view?url=https%3A%2F%2Fraw.githubusercontent.com%2Floleg%2Fbaumkataster-data%2Fmaster%2Fdatapackage.json)

## Service

This repository contains a minimalist backend service API based on the [Falcon](http://falconframework.org/) framework and [Pandas DataPackage Reader](https://github.com/rgieseke/pandas-datapackage-reader). To run:

```
cd api
virtualenv env
. env/bin/activate
pip install -Ur requirements.txt
python server.py
```

At this point you should see the message "Serving on port..." Test the API using a REST client such as [RESTer](https://github.com/frigus02/RESTer) with queries such as:

http://localhost:8000/tree?quartier=Oerlikon

Which gives you all the trees in 'Oerlikon'. You can adjust the amount of output with a `page` and `per_page` parameter in your query.

## License

This package is licensed by its maintainers under the Public Domain Dedication
and License.

If you intended to use these data in a public or commercial product, please
check the data sources themselves for any specific restrictions.
