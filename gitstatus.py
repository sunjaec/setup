#!/usr/bin/python
import os
import sys
import subprocess


def determineActiveBranch():

    process = subprocess.Popen(["git", "branch"], stdout=subprocess.PIPE)
    (output, error) = process.communicate()
    
    for line in output.split('\n'):
        if line.startswith('*'):
            return line[2:].strip()

def showStatus(d, flag) :

    pwd = os.getcwd()
    os.chdir(d)
    command = "git status"
    print "===== Package: %s =====" % (d)
    os.system(command)
   
    branch = determineActiveBranch()

    if flag == 'm' : 
        merge(branch)
    elif flag == 'u' :
        update(branch)
    elif flag == 'f' :
        fetch()
    print 
    print
    os.chdir(pwd)


def update(branch):

    fetch()
    command = "git reset --hard origin/" + branch
    os.system(command)
    
def merge(branch) :

    fetch()
    command = "git merge origin/" + branch
    os.system(command)
    
def fetch() :

    command = "git fetch"
    os.system(command)
    
updateFlag = None

if len(sys.argv) > 1 :
    if sys.argv[1] in ["u", "update"] :
        updateFlag = 'u'
    elif sys.argv[1] in ["m", "merge"] :
        updateFlag = 'm'
    elif sys.argv[1] in ["f", "fetch"] :
        updateFlg = 'f'
    
for d in os.listdir(".") :
    if os.path.isdir(d + "/.git") :
        showStatus(d, updateFlag)
