RedCross GeoDB
============

Using PostgreSQL 9.2 and PostGIS 2.0. 

Instructions for setting up Postgres 9.2.2 and PostGIS 2.0.3 on Ubuntu 12.04 (EC2)
=========================================================================	

### Install 'make', g++, python, etc
	sudo apt-get install make
	sudo apt-get install build-essential
	sudo apt-get install python-software-properties

### Install Readline and zlib libraries
	sudo apt-get install libreadline-gplv2-dev
	sudo apt-get install zlib1g-dev

### Create a directory to hold downloaded source codes
	mkdir /home/ubuntu/installs
	cd /home/ubuntu/installs

### Download and Install PostgreSQL database server
	sudo wget http://ftp.postgresql.org/pub/source/v9.2.2/postgresql-9.2.2.tar.bz2
	bzip2 -d postgresql-9.2.2.tar.bz2
	tar -xf postgresql-9.2.2.tar
	cd postgresql-9.2.2
	./configure
	make
	sudo make install


### Configure PostgreSQL database server
##### Add 'postgres' user
	sudo adduser postgres
	Enter new UNIX password: 
	Retype new UNIX password:

##### Make and set permissions on the pgsql directory
	sudo mkdir /usr/local/pgsql/data
	sudo chown postgres /usr/local/pgsql/data

##### Initialize the postgres DB
	su - postgres
	/usr/local/pgsql/bin/initdb -D /usr/local/pgsql/data

##### Start the service and logging
	/usr/local/pgsql/bin/postgres -D /usr/local/pgsql/data >logfile 2>&1 &

##### Create a test DB
	/usr/local/pgsql/bin/createdb test
	/usr/local/pgsql/bin/psql test
	\q

##### Set postgres DB password
	su - postgres
	/usr/local/pgsql/bin/psql
	\password postgres
	<Enter new password:>
	<Enter it again:>
	\q
	
	su - ubuntu


### Add Soundex ability
	cd /home/ubuntu/installs/postgresql-9.2.2/contrib/fuzzystrmatch
	make
	sudo make install


### Make a directory for PostGIS install stuff
	cd /home/ubuntu/installs
	mkdir postgis
	cd postgis

### Download and Install requirements for PostGIS Installation

#####Proj4
	cd /home/ubuntu/installs/postgis
	wget http://download.osgeo.org/proj/proj-4.8.0.tar.gz
	gzip -d proj-4.8.0.tar.gz
	tar -xvf proj-4.8.0.tar
	cd proj-4.8.0
	./configure
	make
	sudo make install

#####GEOS
	cd /home/ubuntu/installs/postgis
	wget http://download.osgeo.org/geos/geos-3.3.7.tar.bz2
	bzip2 -d geos-3.3.7.tar.bz2
	tar -xvf geos-3.3.7.tar
	cd geos-3.3.7
	./configure
	make
	sudo make install

#####  LibXML2, (version 2.5.x or higher)
	sudo apt-get install libxml2
	sudo apt-get install libxml2-dev

##### JSON-C, (version 0.9 or higher)
	cd /home/ubuntu/installs/postgis
	wget http://oss.metaparadigm.com/json-c/json-c-0.9.tar.gz
	gzip -d json-c-0.9.tar.gz
	tar -xvf json-c-0.9.tar
	cd json-c-0.9
	./configure
	make
	sudo make install


##### GDAL
	cd /home/ubuntu/installs/postgis
	wget http://download.osgeo.org/gdal/gdal-1.9.2.tar.gz
	gzip -d gdal-1.9.2.tar.gz
	tar -xvf gdal-1.9.2.tar
	cd gdal-1.9.2
	./configure
	make
	sudo make install

##### Update Libraries
	sudo su
	echo /usr/local/lib >> /etc/ld.so.conf

### PostGIS installation
	cd /home/ubuntu/installs/postgis
	wget http://postgis.net/stuff/postgis-2.0.3SVN.tar.gz
	gzip -d postgis-2.0.3SVN.tar.gz
	tar -xf postgis-2.0.3SVN.tar
	cd postgis-2.0.3SVN
	./configure --with-pgconfig=/usr/local/pgsql/bin/pg_config --with-raster
	make
	sudo make install

### Build PostGIS Extensions and Deploy
	cd extensions/postgis
	make clean
	make
	sudo make install
	
	cd ..
	cd postgis_topology
	make clean
	make
	sudo make install


### Modify Files
	su - postgres
	cd /usr/local/pgsql/data
	pico postgresql.conf
	
	# Add this line, then save and exit pico
	listen_addresses = '*'
<br />

	pico pg_hba.conf
	
	# Add this line, then save and exit pico
	host  all all 0.0.0.0/0 md5

The following was not necessary on EC2 instance, but was on a Ubuntu server VM instance

	su - ubuntu
	sudo pico /etc/ld.conf.d/local.conf

	# Add this line, then save and exit pico
	/usr/local/lib

### Config libraries
	sudo ldconfig 

### Restart postgres service
	su - postgres
	/usr/local/pgsql/bin/postgres -D /usr/local/pgsql/data >logfile 2>&1 &
You may also have to restart the server, then restart the postgres service

<br />
### Create the PostGIS template
Connect to postgres DB either thru pgAdmin3 or psql and execute the following SQL
	Create extension postgis

<br />
You should be good to go.





