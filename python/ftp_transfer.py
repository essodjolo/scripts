#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
This script sends files from one or more directories to an FTP server.
Passive mode is enabled by default since python version 2.1.
"""

FTPSERVER = ''
USERNAME = ''
PASSWORD = ''
LOCALDIRS='/home/test1','/home/test2'

import ftplib, os

for directory in LOCALDIRS:
	for filename in os.listdir(directory):
		file_fullpath =  os.path.join(directory, filename)
		if os.path.isfile(file_fullpath):
			try:
				session = ftplib.FTP(FTPSERVER,USERNAME,PASSWORD)
				file = open(file_fullpath,'rb')                  # the file to send
				session.storbinary('STOR '+filename, file)     # sending the file
				file.close()                                 
				os.remove(file_fullpath) # remove the file once sent
				session.quit()
			except Exception, e:
				print str(e)
