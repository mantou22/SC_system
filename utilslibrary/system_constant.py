# -*- coding: utf-8 -*-
"""存放系统常量
"""


class Constant(object):
    # current user flag in session
    SESSION_CURRENT_USER = 'DjangoAdmin_SESSION_CURRENT_USER'
    SESSION_CURRENT_USER_LOGINNAME = 'DjangoAdmin_SESSION_CURRENT_USER_LOGINNAME'
    SESSION_CURRENT_USER_ID = 'DjangoAdmin_SESSION_CURRENT_USER_ID'
    SESSION_CURRENT_USER_PERMISSION_LIST = 'DjangoAdmin_SESSION_CURRENT_USER_PERMISSION_LIST'
    SESSION_CURRENT_USER_PERMISSION_MENU_ID_LIST = 'DjangoAdmin_SESSION_CURRENT_USER_PERMISSION_MENU_ID_LIST'

    # would insert into db of operations
    LOG_DB_OPERATIONS_METHOD = ['add_', 'upd_', 'del_']
 