# MiniTwit

Because writing todo lists is not fun

# What is MiniTwit?

A SQLite and Flask powered twitter clone

# How do I use it?

1. install flask and flask-cli via pip
2. edit the configuration in the minitwit.py file 
  * export the environment variable `MINITWIT_SETTINGS` pointing to a configuration file.
3. Initialize the database by running:

```console
export FLASK_APP=minitwit.py; \
export LC_ALL=en_US.utf-8; \
export LANG=en_US.utf-8; \
flask initdb
```

4. Now you can run `minitwit`:

```console
flask run --host=0.0.0.0 --with-threads --no-debugger --no-reload
```

The application will greet you on:

```
[2023-03-07 19:54:16,940] INFO in minitwit: Using local db sqlite:////var/minitwit/minitwit.db
 * Serving Flask app 'minitwit.py'
 * Debug mode: off
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on all addresses (0.0.0.0)
 * Running on http://127.0.0.1:5000
 * Running on http://10.105.238.6:5000
Press CTRL+C to quit
```

# Is it tested?

You betcha.  Run the `test_minitwit.py` file to see the tests pass.

1. Initialize the database for testing
2. Install the dev dependencies
3. Execute the test cases

> **NOTE**: the runtime dependencies must have been installed as well.

1. Initialize the dabase for testing
  * Just initialize the database with `init-db`

```console
$ ./init-db
[2023-03-08 00:25:47,358] INFO in minitwit: Using local db sqlite:////var/minitwit/minitwit.db
Initialized the database.
```

2. Install the dev dependencies 

```
$ pip install -r requirements-dev.txt
Collecting pytest==5.3.2
  Downloading pytest-5.3.2-py3-none-any.whl (234 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 234.5/234.5 KB 1.5 MB/s eta 0:00:00
Collecting attrs>=17.4.0
  Downloading attrs-22.2.0-py3-none-any.whl (60 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 60.0/60.0 KB 5.5 MB/s eta 0:00:00
Collecting more-itertools>=4.0.0
  Downloading more_itertools-9.1.0-py3-none-any.whl (54 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 54.2/54.2 KB 4.3 MB/s eta 0:00:00
Collecting py>=1.5.0
  Downloading py-1.11.0-py2.py3-none-any.whl (98 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 98.7/98.7 KB 7.1 MB/s eta 0:00:00
Collecting packaging
  Downloading packaging-23.0-py3-none-any.whl (42 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 42.7/42.7 KB 3.3 MB/s eta 0:00:00
Collecting pluggy<1.0,>=0.12
  Downloading pluggy-0.13.1-py2.py3-none-any.whl (18 kB)
Collecting wcwidth
  Downloading wcwidth-0.2.6-py2.py3-none-any.whl (29 kB)
Installing collected packages: wcwidth, py, pluggy, packaging, more-itertools, attrs, pytest
Successfully installed attrs-22.2.0 more-itertools-9.1.0 packaging-23.0 pluggy-0.13.1 py-1.11.0 pytest-5.3.2 wcwidth-0.2.6
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv
WARNING: You are using pip version 22.0.4; however, version 23.0.1 is available.
You should consider upgrading via the '/usr/local/bin/python -m pip install --upgrade pip' command.
```

3. Execute the test cases

```console
pytest test_minitwit.py
==================================================================== test session starts =====================================================================
platform linux -- Python 3.8.16, pytest-5.3.2, py-1.11.0, pluggy-0.13.1
rootdir: /Users/mdesales/dev/github.com/marcellodesales/minitwit
collected 4 items

test_minitwit.py ....                                                                                                                                  [100%]

=============================================================== 4 passed, 1 warning in 29.14s ================================================================
```
