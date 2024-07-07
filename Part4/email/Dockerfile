FROM python

COPY . /app
WORKDIR /app
# RUN apt-get update && apt-get install -y sendmail
RUN pip install -r requirements.txt
CMD ["python","-u","mailsender.py" ]