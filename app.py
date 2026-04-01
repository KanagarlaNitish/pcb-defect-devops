from flask import Flask
app = Flask(__name__)
@app.route('/')
def home():
         return "pcb defect dection api running!"
if __name__ == '__main__':
         app.run(debug=True)
#ts
