import inspect, re
from utilslibrary.system_constant import Constant


#trans var to str
def varname(p):
    for line in inspect.getframeinfo(inspect.currentframe().f_back)[3]:
        m = re.search(r'\bvarname\s*\(\s*([A-Za-z_][A-Za-z0-9_]*)\s*\)', line)
    if m:
        return m.group(1)

#get user id in session
def getCurrentSessionID(request):
    return request.session[Constant.SESSION_CURRENT_USER_ID]
#get user name in session
def getCurrentSessionName(request):
    return request.session[Constant.SESSION_CURRENT_USER_LOGINNAME]
                