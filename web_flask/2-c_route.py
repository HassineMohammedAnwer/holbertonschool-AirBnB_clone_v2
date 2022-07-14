#!/usr/bin/python3
"""Start server using Flask"""

from flask import Flask
app = Flask(__name__)


@app.route('/', strict_slashes=False)
def hello_hbnb():
    """ prints Hello HBNB!"""
    return 'Hello HBNB!'


@app.route('/hbnb', strict_slashes=False)
def hbnb():
    """ display hello hbnb on 0.0.0.0 port=5000"""
    return 'HBNB'

@app.route('/c/<text>', strict_slashes=False)
def C_text(text):
    """ /C_text"""
    return 'C {:s}'.format(text.replace('_', ' '))

if __name__ == "__main__":
    """ running app.route on 0.0.0.0:5000"""
    app.run(host='0.0.0.0', port=5000)
