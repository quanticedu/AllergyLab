import smtplib, ssl
import redis
import time
import os


# Email Setup
# from email.mime.text import MIMEText
# to_addr = os.environ['TO_ADDRESS']
# print(f'to_addr is {to_addr}')
class Mail:
    def __init__(self):
        self.port = 465
        self.smtp_server_domain_name = "smtp.gmail.com" # Move to ENV
        self.sender_mail = "allergylaborders@gmail.com" # Move to ENV
        self.password = "qqlthowpeudnywll" # Move to ENV

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

# Loop to read Redis queue
while True:
    message = p.get_message()
    if message:
        # If we have an active message in the queue
        print(message)
        print(message['data'])
        if message['data'] != 1:
            mail = Mail()
            # Working - Move to ENV & read from Front-End
            mail.send(['craig.gardner1@gmail.com'], 'Test AllergyLab Email', 'This is a Test')

    time.sleep(0.01)


