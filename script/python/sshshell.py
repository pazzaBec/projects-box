#!/usr/bin/python

import pexpect, os, socket, re, sys

def localCmd(_cmd) : 
    _p = os.popen(_cmd)
    _data = _p.read()
    _p.close()
    return _data

expectRet = [
    '.*assword.*',
    'Last login.*',
    '.*verification code sent to your mobile phone.*',
    'Permission denied',
    '.*continue.*?',
    'Welcome to Ubuntu.*',
    pexpect.EOF,
    pexpect.TIMEOUT,
]

class switchLoginExpect :
    #list = {}
    #err = None
    def __init__(self, s, h):
        self.list = {
            #'password'
            0:self.password,
            #'success'
            1:self.success,
            #'verifycode'
            2:self.verification,
            #'permission'
            3:self.denied,
            #'continue'
            4:self.sendYes,
            #'welcome'
            5:self.success
        }
        self.ssh = s
        self.host = h
        #function = self.list.get(expt, self.default)
        #function()
    def switch(self, expt) :
        #print(expt)
        func = self.list.get(expt, self.default)
        return func()
    def Run(self) :
        while True :
            _r = self.switch(self.ssh.expect(expectRet, timeout = 3))
            if _r == 0 :
                continue
            elif _r > 0 :
                return self.ssh
            return None
    def default(self):
        print(self.ssh.before)
        print(self.ssh.after)
        #self.err = self.ssh.after
        return  -1
    def password(self):
        print("send password")
        self.ssh.sendline(self.host.passwd)
        _swt = switchLoginExpect(self.ssh, self.host)
        return _swt.switch(self.ssh.expect(expectRet, timeout = 3))
    def sendYes(self):
        print('send yes')
        self.ssh.sendline('yes\n')
        return 0
    def success(self):
        print(self.ssh.before)
        return 1
    def verification(self):
        _vfcode = input('\r\nPlease enter the verification code sent to your mobile phone:')
        self.ssh.sendline(_vfcode)
        return 0
    def denied(self):
        localCmd('chmod 400 %s'%(os.path.dirname(__file__) + '/key/%s'%(self.host.key)))
        print('key file mod change to 400, try again!')
        #self.err = 'key file mod change to 400, try again!'
        return -1

class Host :
    def __init__(self, _ip, _port, _usrname, _passwd, _key, _alias, _route) :
        self.ip = _ip
        self.port = _port
        self.usrname = _usrname
        self.passwd = _passwd
        self.key = _key
        self.alias = _alias
        self.route = _route
    def __repr__(self) :
        return "Host %s@%s(%s)"%(self.usrname, self.ip, self.getSSHLoginCmd())
    def getSSHLoginCmd(self) :
        if self.key != '' :
            kpath = os.path.dirname(__file__) + '/key/%s'%(self.key)
            return 'ssh -p %d %s@%s -i %s'%(self.port, self.usrname, self.ip, kpath)
        else :
            return 'ssh -p %d %s@%s'%(self.port, self.usrname, self.ip)
    def SSH(self) :
        if self.route == None :
            _shell = pexpect.spawn(self.getSSHLoginCmd())
            print('Login@%s ......'%self.ip)
            return switchLoginExpect(_shell, self).Run()
        else :
            _route = self.route.SSH()
            if _route == None :
                return None
            _route.sendline(self.getSSHLoginCmd())
            print('Login@%s ......'%self.ip)
            return switchLoginExpect(_route, self).Run()
    def getError(self, e) :
        return "Host(%s) error: %s"%(self.ip, e)
    def Shell(self) :
        _shell = self.SSH()
        if _shell == None :
            return
        _rows, _columns = os.popen('stty size', 'r').read().split()
        _shell.setwinsize(int(_rows), int(_columns))
        print('Welcome to %s\n'%(self.ip))
        _shell.interact()

#class switchHost :
#    def __init__(self) :

def InputIndex() :
    try :
        _idx = int(input('Select one:')) - 1
    except :
        _idx = -1
    return _idx

hosts = [
    Host("106.52.103.36", 22, "root", "", "itsp.dms","tencent-wy", None),
    Host("113.31.119.157 ", 22, "ubuntu", "", "euclan", "uclound-euclan", None),
    #Host("10.198.103.2", 22, "user", "Stfypt@123", "", "ITSP-APP", None),
    #Host("10.198.61.2", 22, "user", "Stfypt@123", "", "ITSP-DataBase", None),
    #Host("49.233.162.142", 22, "root", "Dwgl1234", "","Zhouky", None),
    #Host("115.220.10.35", 753, "root", "Ubs547629134307", "","unknown", None)
]

if __name__ == "__main__":
    _i = 1
    for _h in hosts :
        print("\n%2d\t%s\t%s\n"%(_i, _h.ip, _h.alias))
        _i = _i + 1
    
    _id = InputIndex()
    if _id < len(hosts) and _id > 0 :
        _h = hosts[_id]
        _h.Shell()