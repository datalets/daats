# DaaS Package

This is a template repository, which lets you create a quick API around your Frictionless [Data Package](https://frictionlessdata.io/). This could be useful in several ways: as a microservice for your frontend code, for integration with Web-based workflows, for more efficient access to larger datasets.

This is based on an earlier [baumkataster](https://github.com/schoolofdata-ch/baumkataster-data) project.

## Getting started

Place a `datapackage.json` file and `data` folder with your own data to start setting up an API.

If you have not used Data Packages before, the easiest way to get started is to convert your dataset to a CSV file (or a set of CSV files), in UTF-8 format - which you can create with any spreadsheet program.

Then, use the [Data Package CLI](https://github.com/frictionlessdata/datapackage-py#cli) or [Create Frictionless Data](https://create.frictionlessdata.io) tool to generate a Data Package by clicking the "Load" button and then adding and defining the columns and metadata. "Download" and place the resulting files here.

## Installation

This repository contains a minimalist backend service API based on the [Falcon](http://falconframework.org/) framework and [Pandas DataPackage Reader](https://github.com/rgieseke/pandas-datapackage-reader). To run:

```
cd api
virtualenv env
. env/bin/activate
pip install -Ur requirements.txt
python server.py
```

(Alternatively: use [Pipenv](https://pipenv.pypa.io/en/latest/) and run `pipenv install && pipenv run python server.py`)

At this point you should see the message "Serving on port..."

Soon there will be a webpage where you can test the API. Until then ...

Test the API using a REST client such as [RESTer](https://github.com/frigus02/RESTer) with queries such as:

`http://localhost:8000/[my resource name]?[column]=[query]`

For instance, if you had a Resource in your Data Package with the name "tree", which has a "quartier" column, you can search for "Oerlikon" in it using:

http://localhost:8000/tree?quartier=Oerlikon

You can adjust the amount of output with a `page` and `per_page` parameter in your query.

## License

This project is licensed by its maintainers under the MIT License.

If you intended to use these data in a public or commercial product, please
check the data sources themselves for any specific restrictions.
