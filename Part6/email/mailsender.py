import smtplib, ssl
import redis
import time
import os


# Email Setup
to_addr = os.environ['TO_ADDRESS']

class Mail:
    def __init__(self):
        self.port = 465
        self.smtp_server_domain_name = "smtp.gmail.com"
        self.sender_mail = os.environ['FROM_ADDRESS']
        self.password = os.environ['FROM_PASSWORD'] 

    def send(self, emails, subject, content):
        ssl_context = ssl.create_default_context()
        service = smtplib.SMTP_SSL(self.smtp_server_domain_name, self.port, context=ssl_context)
        service.login(self.sender_mail, self.password)
        
        for email in emails:
            result = service.sendmail(self.sender_mail, email, f"Subject: {subject}\n{content}")

        service.quit()


# Redis Setup
r = redis.Redis(host='redis-server', port=6379, db=0)
p = r.pubsub()
p.subscribe('food_info')

# Queue Loop & Email Action
while True:
    message = p.get_message()
    if message:
        # If we have an active message in the queue
        print(message)
        print(message['data'])
        if message['data'] != 1:
            mail = Mail()
            # Working - Move to ENV & read from Front-End
            mail.send([to_addr], 'New Order Generated', "New order generated for " + message['data'].decode())

    time.sleep(0.01)


