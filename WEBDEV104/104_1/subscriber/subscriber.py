import redis
import time

r = redis.Redis(host='redis-server', port=6379, db=0)

p = r.pubsub()
p.subscribe("food_info")

while True:
    message = p.get_message()
    if message:
        print(message)
        print(message['data'])
    time.sleep(0.01)