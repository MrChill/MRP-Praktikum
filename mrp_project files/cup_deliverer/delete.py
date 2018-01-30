#!/usr/bin/env python  

import couchdb

couch = couchdb.Server('http://localhost:5984/')
couchdb = 'object_recognition'
db = couch[couchdb]
for id in db:
	if (id != "0f561189d54f5d93db5998a99f06ffe9"):
		 db.delete(db[id])
