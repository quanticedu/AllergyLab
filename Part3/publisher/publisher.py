import redis

r = redis.Redis(host='redis-server', port=6379, db=0)

r.publish('food_info', 'Ham Sandwich')