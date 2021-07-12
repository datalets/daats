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

DATA_URL = https://www.stadt-zuerich.ch/geodaten/download/Baumkataster?format=10005
DATA_NAME = data
DATA_SQL = select primaryindex,kategorie,quartier,strasse,baumgattunglat,baumartlat,baumnamelat,baumnamedeu,baumnummer, status,baumtyp,baumtyptext,pflanzjahr,genauigkeit from Baumkataster

all: build
nogeom: build-sqlite

build: conv-data preview-extract
build-sqlite: conv-data-sqlite

# Would normally be part of the build steps above, mais cest la vie
fetch-data:
	curl -X GET -L $(DATA_URL) > data/$(DATA_NAME).gpkg

conv-data:
	rm -f data/gsz_*
	cd data && ogr2ogr -lco GEOMETRY=AS_XY -lco STRING_QUOTING=ALWAYS -t_srs "EPSG:4326" $(DATA_NAME).csv $(DATA_NAME).gpkg

preview-extract:
	cd data && awk "NR==1, NR==100" $(DATA_NAME).csv > preview.csv

conv-data-sqlite:
	cd data && sqlite3 -header -csv $(DATA_NAME).gpkg "$(DATA_SQL)" > $(DATA_NAME)-nogeom.csv
