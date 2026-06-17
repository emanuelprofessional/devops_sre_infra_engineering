from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello_world():
    debug_mode = os.environ.get('FLASK_DEBUG', '0')
    return f'''
    <h1>Hello, World!</h1>
    <p>FLASK_DEBUG = {debug_mode}</p>
    <p><a href="/health">Health Check</a></p>
    '''

@app.route('/health')
def health():
    return {'status': 'healthy'}, 200

if __name__ == '__main__':
    debug = os.environ.get('FLASK_DEBUG', '0') in ['1', 'true', 'True']
    app.run(host='0.0.0.0', port=5000, debug=debug)