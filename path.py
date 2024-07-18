import os, shutil
import math
import itertools
import time
import subprocess
from os import listdir
from os.path import isfile, join
from pathlib import Path
from threading import *
import tkinter.filedialog as filedialog
import tkinter as tk
from tkinter import *
from tkinter import ttk
from tkinter import messagebox
from path import Path

#Function to export path
def exportpath():
	#get dataa from textbox
	pathfolder = txt_folder_path.get()
	#Create list to store dat
	getlist = []
	#Call function get_all_files with pathfolder is params
	getlist = get_all_files(pathfolder)
	#Write data to text file
	writetext(getlist)
	#Enable the button replace and open file
	btn_replace_path.config(state="normal")

#Function to load folder into textbox
def loadfolder():
	#Function to show the choose folder window
	browse_folder = filedialog.askdirectory()
	#Replace the slash sign "/" by two backslash "\\"
	browse_folder_get = browse_folder.replace("/","\\")
	#Enable textbox
	txt_folder_path.config(state="normal")
	#Delete all data in textbox
	txt_folder_path.delete(0, tk.END)
	#Insert new data (the path of folder you choose)
	txt_folder_path.insert(0, browse_folder_get)

#function get all files paths including folder and subfolder
def get_all_files(folder):
	#Create a list to store data
	file_list = []
	#Check path exist or not
	if os.path.exists(folder):
		#Make a loop for including root, dirs, subdirs, files in path
		for root, dirs, files in os.walk(folder):
			#with each file in list
			for file in files:
				#Combine the folder path and file name
				file_list.append(os.path.join(root,file))
	#return a list
	return file_list

#function write to file with param is list
def writetext(listpathget):
	#Open file 
	with open(os.getcwd() + '\\filelist.txt','w') as writefile:
		#Make a loop with each item in list
		for item in listpathget:
			#Write to file with full path and the enter sign '\'
			writefile.write(item + '\n')

#Function replace root path by relative path	
def replacepath():
	#get path string
	fprep = txt_folder_path.get()
	#get the last folder name of path
	getlast = os.path.basename(os.path.normpath(fprep))
	#Open and read file filelist.txt
	with open(os.getcwd() + '\\filelist.txt','r') as rfile:
		#Create a variable to read file
		filedata = rfile.read()
	#while reading in file, replace the root folder name by "\\" and getlast = here is the last folder name
	#For example: if you want to get all files in setting folder
	filedata = filedata.replace(fprep, '\\' + getlast)
	#open again to write
	with open(os.getcwd() + '\\filelist.txt','w') as wfile:
		#write the new data
		wfile.write(filedata)
	#open text file
	os.startfile(os.getcwd() + '\\filelist.txt')

#Make main window with title, size and icon
mainprogram = tk.Tk()
mainprogram.title('Get files path - @Copyright by Jackie Gaming')
mainprogram.geometry('324x70')
mainprogram.iconbitmap(os.getcwd() + "\\vltk.ico")

#Create button in window, with name, size and function to call
btn_folder_path = tk.Button(mainprogram, text="Chọn đường dẫn Folder", width=25, command=loadfolder)
btn_folder_path.place(x = 7, y = 7)

#Create entry textbox to show the string, first it is disabled
txt_folder_path = tk.Entry(mainprogram, text="", width=30, state="disabled")
#Place the position of the textbox
txt_folder_path.place(x = 7, y = 36, height = 27)

#Create another button
btn_export_txt = tk.Button(mainprogram, text="Export TXT", width=15, command=exportpath)
btn_export_txt.place(x=200, y = 7)

#Create last button
btn_replace_path = tk.Button(mainprogram, text="Replace and Open", width=15, command=replacepath, state = "disabled")
btn_replace_path.place(x=200, y = 36)

#The other params for creating window of the program without sizeable
mainprogram.minsize(width=324, height=70)
mainprogram.maxsize(width=324, height=70)
mainprogram.mainloop()