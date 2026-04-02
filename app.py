from flask import Flask, Response
from prometheus_client import Counter, generate_latest

app = Flask(__name__)

# Create a counter
REQUEST_COUNT = Counter('request_count', 'Total Requests')

# This runs before every request
@app.before_request
def before_request():
    REQUEST_COUNT.inc()

# Home route
@app.route('/')
def home():
    return "pcb defect detection api running!"

# Metrics route (VERY IMPORTANT)
@app.route('/metrics')
def metrics():
    return Response(generate_latest(), mimetype='text/plain')

# Run app
if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000)
