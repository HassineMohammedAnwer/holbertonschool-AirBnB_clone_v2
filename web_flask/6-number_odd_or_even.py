#!/usr/bin/python3
"""Start server using Flask odd_eeven"""
from flask import Flask, render_template
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


@app.route('/python', defaults={'text': 'is cool'}, strict_slashes=False)
@app.route('/python/<text>', strict_slashes=False)
def python_text(text):
    """ /python_text"""
    return 'Python {:s}'.format(text.replace('_', ' '))


@app.route('/number/<int:n>', strict_slashes=False)
def _number(n):
    """number_route"""
    return '{:d} is a number'.format(n)


@app.route('/number_template/<int:n>', strict_slashes=False)
def _number_template(n):
    return render_template('5-number.html', n=n)


@app.route('/number_odd_or_even/<int:n>', strict_slashes=False)
def number_odd_or_even(n):
    """ number_odd_or_even"""
    if (n % 2 == 0):
        return render_template('6-number_odd_or_even.html',
                               str='{:d} is even'.format(n))
    elif (n % 2 == 1):
        return render_template('6-number_odd_or_even.html',
                               str='{:d} is odd'.format(n))


if __name__ == "__main__":
    """ running app.route on 0.0.0.0:5000"""
    app.run(host='0.0.0.0', port=5000)
