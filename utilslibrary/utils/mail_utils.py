# -*- coding: utf-8 -*-
import smtplib
from email.header import Header
from email.mime.text import MIMEText


def mail():
    # 第三方 SMTP 服务
    mail_host="smtp.qq.com"  #设置服务器
    mail_user="948445086@qq.com"    #用户名
    mail_pass="zwupwyqdnwtqbfhg"   #口令 
    sender = '948445086@qq.com'
    receivers = ['1559504282@qq.com']  # 接收邮件，可设置为你的QQ邮箱或者其他邮箱
    message = MIMEText('Python 邮件发送测试...', 'plain', 'utf-8')
    message['From'] = Header("fromfromfrom", 'utf-8')
    message['To'] =  Header("tototo", 'utf-8')
    subject = 'Python SMTP 邮件测试'
    message['Subject'] = Header(subject, 'utf-8')
    try:
        smtpObj = smtplib.SMTP() 
        smtpObj.connect(mail_host, 25)    # 25 为 SMTP 端口号
        smtpObj.login(mail_user,mail_pass)  
        smtpObj.sendmail(sender, receivers, message.as_string())
        print("邮件发送成功")
    except smtplib.SMTPException:
        print("Error: 无法发送邮件")

if __name__ == '__main__':
    mail()