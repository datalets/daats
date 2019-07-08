# Project : Data Package Makefile
# -----------------------------------------------------------------------------
# Author : Oleg Lavrovsky <oleg@opendata.ch>
# -----------------------------------------------------------------------------
# License : GNU General Public License
# -----------------------------------------------------------------------------
# This Data Package is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# The Data Package is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with the Data Package. If not, see <http://www.gnu.org/licenses/>.

DATA_URL = https://data.stadt-zuerich.ch/dataset/baumkataster/resource/9e2d501e-0902-4449-a9f3-b65d1c7b3e23/download/baumkataster.gpkg
DATA_NAME = baumkataster
DATA_SQL = select primaryindex,kategorie,quartier,strasse,baumgattunglat,baumartlat,baumnamelat,baumnamedeu,baumnummer, status,baumtyp,baumtyptext,pflanzjahr,genauigkeit from Baumkataster


all: build

build: fetch-data conv-data

fetch-data:
	curl -X GET -L $(DATA_URL) > data/$(DATA_NAME).gpkg

conv-data:
	cd data && sqlite3 -header -csv $(DATA_NAME).gpkg "$(DATA_SQL)" > $(DATA_NAME).csv
