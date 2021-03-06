#!/bin/bash

OCSERVER="http://127.0.0.1:8080"
HWADDR="02:42:ac:11:00:2b"

DB_USER=root
DB_PWD=admin
DB_DB=opencms
DB_PRODUCT=mysql
DB_URL="jdbc:mysql://localhost:3306/"
DB_DRIVER=org.gjt.mm.mysql.Driver

# Create setup.properties
echo "OpenCms Setup: Writing configuration to '$CONFIG_FILE'"
echo "-- Components: $OPENCMS_COMPONENTS"
PROPERTIES="

setup.webapp.path=$OPENCMS_HOME_INSTALL
setup.default.webapp=
setup.install.components=$OPENCMS_COMPONENTS
setup.show.progress=true

db.product=$DB_PRODUCT
db.provider=$DB_PRODUCT
db.create.user=$DB_USER
db.create.pwd=$DB_PWD
db.worker.user=$DB_USER
db.worker.pwd=$DB_PWD
db.connection.url=$DB_URL
db.name=$DB_DB
db.create.db=true
db.create.tables=true
db.dropDb=true
db.default.tablespace=
db.index.tablespace=
db.jdbc.driver=$DB_DRIVER
db.template.db=
db.temporary.tablespace=

server.url=$OCSERVER
server.name=OpenCmsServer
server.ethernet.address=$HWADDR
server.servlet.mapping=

"
echo "$PROPERTIES" > $CONFIG_FILE || { echo "Error: Couldn't write to '$CONFIG_FILE'!" ; exit 1 ; }
