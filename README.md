# MiniTwit

"Because writing todo lists is not fun"

# What is MiniTwit?

A simple twitter clone, written in Python, powered by SQLite and Flask.

# Runtime

> **Requirements**: Python 3, C++, MySQL Client to build clients

## :snake: How do I use it using Python?

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

5. Go to the browser at http://127.0.0.1:5000.

## :whale: How do I use it using Docker?

> **Requirement**: Make sure to have the docker engine or containerd installed.

1. Make sure to adjust the port number on `docker-compose.yaml`
2. Initialize a container with `docker compose up`

```console
$ docker compose up --build minitwit-runtime
[+] Building 13.5s (17/17) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                     0.0s
 => => transferring dockerfile: 1.39kB                                                                                                                   0.0s
 => [internal] load .dockerignore                                                                                                                        0.0s
 => => transferring context: 2B                                                                                                                          0.0s
 => [internal] load metadata for docker.io/library/python:3.8.16-alpine3.17                                                                              1.1s
 => [auth] library/python:pull token for registry-1.docker.io                                                                                            0.0s
 => [builder 1/9] FROM docker.io/library/python:3.8.16-alpine3.17@sha256:8518dd6657131d938f283ea97385b1db6724e35d45ddab6cd1c583796e35566a                0.0s
 => => resolve docker.io/library/python:3.8.16-alpine3.17@sha256:8518dd6657131d938f283ea97385b1db6724e35d45ddab6cd1c583796e35566a                        0.0s
 => [internal] load build context                                                                                                                        0.0s
 => => transferring context: 767B                                                                                                                        0.0s
 => CACHED [builder 2/9] RUN apk add musl-dev python3-dev mariadb-dev gcc build-base bash                                                                0.0s
 => CACHED [builder 3/9] WORKDIR /viasat/minitwit                                                                                                        0.0s
 => CACHED [builder 4/9] COPY requirements.txt .                                                                                                         0.0s
 => CACHED [builder 5/9] RUN pip install -r requirements.txt                                                                                             0.0s
 => CACHED [builder 6/9] COPY ./static /viasat/minitwit/static                                                                                           0.0s
 => CACHED [builder 7/9] COPY ./templates /viasat/minitwit/templates                                                                                     0.0s
 => CACHED [builder 8/9] COPY *.py /viasat/minitwit                                                                                                      0.0s
 => CACHED [builder 9/9] COPY *.sql /viasat/minitwit                                                                                                     0.0s
 => CACHED [runtime 1/1] COPY run-app .                                                                                                                  0.0s
 => exporting to oci image format                                                                                                                       12.2s
 => => exporting layers                                                                                                                                  0.0s
 => => exporting manifest sha256:961d6ad7ce1a276bca5785193769284de530c6fab4af3993d79a25212b222df6                                                        0.0s
 => => exporting config sha256:ff6eb4ca21b161d3a710f8302313e4506042511aa611356e95f5144897a22acb                                                          0.0s
 => => sending tarball                                                                                                                                  12.2s
 => importing to docker                                                                                                                                  0.2s
[+] Running 1/0
 ⠿ Container minitwit-minitwit-runtime-1  Created                                                                                                        0.0s
Attaching to minitwit-minitwit-runtime-1
minitwit-minitwit-runtime-1  | [2023-03-08 01:37:42,142] INFO in minitwit: Using local db sqlite:////var/minitwit/minitwit.db
minitwit-minitwit-runtime-1  |  * Serving Flask app 'minitwit.py'
minitwit-minitwit-runtime-1  |  * Debug mode: off
minitwit-minitwit-runtime-1  | WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
minitwit-minitwit-runtime-1  |  * Running on all addresses (0.0.0.0)
minitwit-minitwit-runtime-1  |  * Running on http://127.0.0.1:5000
minitwit-minitwit-runtime-1  |  * Running on http://192.168.192.2:5000
minitwit-minitwit-runtime-1  | Press CTRL+C to quit
```

3. Go to the browser at http://127.0.0.1:5000.

> **NOTE**: When operating this server, the database file is created under the local dir `db/minitwit.db` as mapped in
> docker-compose.yaml. Make sure to change the path to anything else desired.

```console
☁️  aws-cli@2.9.15
☸️  kubectl@1.24.3 📛 kustomize@1.24.3 🎡 helm@3.10.2    🐳 docker@20.10.21-rd 🐙 docker-compose@v2.14.0
👮 marcellodesales
🏗  1.24.3+k3s1 🔐 rancher-desktop 🍱 default
~/dev/github.com/marcellodesales/minitwit on  feature/improve-experience-with-docker! 📅 03-07-2023 ⌚18:07:30
$ tree db
db
└── minitwit.db

0 directories, 1 file

$ file db/minitwit.db
db/minitwit.db: SQLite 3.x database, last written using SQLite version 3040001, file counter 5, database pages 5, cookie 0x3, schema 4, UTF-8, version-valid-for 5
```

# Development

> **Requirements**: Install `requirements-dev.txt` for build and testing tools.

## Is it tested?

You betcha.  Run the `test_minitwit.py` file to see the tests pass.

1. Install the dev dependencies

> **NOTE**: the runtime dependencies must have been installed as well.

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

2. Execute the test cases

```console
pytest test_minitwit.py
==================================================================== test session starts =====================================================================
platform linux -- Python 3.8.16, pytest-5.3.2, py-1.11.0, pluggy-0.13.1
rootdir: /Users/mdesales/dev/github.com/marcellodesales/minitwit
collected 4 items

test_minitwit.py ....                                                                                                                                  [100%]

=============================================================== 4 passed, 1 warning in 29.14s ================================================================
```

## Test using Docker Container

1. Build a docker image with the runtime needed

> **NOTE**: The docker image `viasat/minitwit-test` is created locally.

The tests are executed within the docker build process and are set as CMD to execute as containers.

```console
$ docker compose build minitwit-test
[+] Building 63.0s (18/18) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                     0.0s
 => => transferring dockerfile: 1.08kB                                                                                                                   0.0s
 => [internal] load .dockerignore                                                                                                                        0.0s
 => => transferring context: 2B                                                                                                                          0.0s
 => [internal] load metadata for docker.io/library/python:3.8.16-alpine3.17                                                                              0.4s
 => [builder 1/9] FROM docker.io/library/python:3.8.16-alpine3.17@sha256:8518dd6657131d938f283ea97385b1db6724e35d45ddab6cd1c583796e35566a                0.0s
 => => resolve docker.io/library/python:3.8.16-alpine3.17@sha256:8518dd6657131d938f283ea97385b1db6724e35d45ddab6cd1c583796e35566a                        0.0s
 => [internal] load build context                                                                                                                        0.0s
 => => transferring context: 490B                                                                                                                        0.0s
 => CACHED [builder 2/9] RUN apk add musl-dev python3-dev mariadb-dev gcc build-base bash                                                                0.0s
 => CACHED [builder 3/9] WORKDIR /viasat/minitwit                                                                                                        0.0s
 => CACHED [builder 4/9] COPY requirements.txt .                                                                                                         0.0s
 => CACHED [builder 5/9] RUN pip install -r requirements.txt                                                                                             0.0s
 => CACHED [builder 6/9] COPY ./static /viasat/minitwit/static                                                                                           0.0s
 => CACHED [builder 7/9] COPY ./templates /viasat/minitwit/templates                                                                                     0.0s
 => CACHED [builder 8/9] COPY *.py /viasat/minitwit                                                                                                      0.0s
 => CACHED [builder 9/9] COPY *.sql /viasat/minitwit                                                                                                     0.0s
 => [tester 1/3] COPY requirements-dev.txt .                                                                                                             0.0s
 => [tester 2/3] RUN pip install -r requirements-dev.txt                                                                                                12.2s
 => [tester 3/3] RUN pytest test_minitwit.py                                                                                                            30.5s
 => exporting to oci image format                                                                                                                       19.5s
 => => exporting layers                                                                                                                                  0.3s
 => => exporting manifest sha256:20a82b1dfbe5398ebb6e8f65917221f2a5bf2a932fb5f19d9e62e19b97ab4450                                                        0.0s
 => => exporting config sha256:64a9ebf40a546f12f97d3d74903846dc170bc776f110feb0cde2a508a51b300b                                                          0.0s
 => => sending tarball                                                                                                                                  19.0s
 => importing to docker
```

2. You can re-execute the test cases

```console
$ docker run -ti viasat/minitwit-test
WARNING: The requested image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8) and no specific platform was requested
==================================================================== test session starts =====================================================================
platform linux -- Python 3.8.16, pytest-5.3.2, py-1.11.0, pluggy-0.13.1
rootdir: /viasat/minitwit
collected 4 items

test_minitwit.py ....                                                                                                                                  [100%]

====================================================================== warnings summary ======================================================================
test_minitwit.py::test_register
  /viasat/minitwit/minitwit.py:200: RemovedIn20Warning: Deprecated API features detected! These feature(s) are not compatible with SQLAlchemy 2.0. To prevent incompatible upgrades prior to updating applications, ensure requirements files are pinned to "sqlalchemy<2.0". Set environment variable SQLALCHEMY_WARN_20=1 to show all deprecation warnings.  Set environment variable SQLALCHEMY_SILENCE_UBER_WARNING=1 to silence this message. (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    the_db.execute(query.strip() + ';')

-- Docs: https://docs.pytest.org/en/latest/warnings.html
=============================================================== 4 passed, 1 warning in 29.42s ================================================================
```

3. You can inspect the tests by initializing a docker container with the current sources mounted as a volume.

> **NOTE**: You need to override the entrypoint with bash.

```console
☁️  aws-cli@2.9.15
☸️  kubectl@1.24.3 📛 kustomize@1.24.3 🎡 helm@3.10.2    🐳 docker@20.10.21-rd 🐙 docker-compose@v2.14.0
👮 marcellodesales
🏗  1.24.3+k3s1 🔐 rancher-desktop 🍱 default
~/dev/github.com/marcellodesales/minitwit on  feature/improve-experience-with-docker! 📅 03-07-2023 ⌚16:41:53
$ docker run --platform linux/amd64 -ti -w $(pwd) -v $(pwd):$(pwd) --entrypoint bash viasat/minitwit
93078096ab1b:/Users/mdesales/dev/github.com/marcellodesales/minitwit#
```

4. Execute the test cases from within the container

```console
602f533b1fa6:/Users/mdesales/dev/github.com/marcellodesales/minitwit# pytest test_minitwit.py
==================================================================== test session starts =====================================================================
platform linux -- Python 3.8.16, pytest-5.3.2, py-1.11.0, pluggy-0.13.1
rootdir: /Users/mdesales/dev/github.com/marcellodesales/minitwit
collected 4 items

test_minitwit.py ... .                                                                                                                                  [100%]

====================================================================== warnings summary ======================================================================
test_minitwit.py::test_register
  /Users/mdesales/dev/github.com/marcellodesales/minitwit/minitwit.py:200: RemovedIn20Warning: Deprecated API features detected! These feature(s) are not compatible with SQLAlchemy 2.0. To prevent incompatible upgrades prior to updating applications, ensure requirements files are pinned to "sqlalchemy<2.0". Set environment variable SQLALCHEMY_WARN_20=1 to show all deprecation warnings.  Set environment variable SQLALCHEMY_SILENCE_UBER_WARNING=1 to silence this message. (Background on SQLAlchemy 2.0 at: https://sqlalche.me/e/b8d9)
    the_db.execute(query.strip() + ';')

-- Docs: https://docs.pytest.org/en/latest/warnings.html
=============================================================== 4 passed, 1 warning in 29.50s ================================================================
602f533b1fa6:/Users/mdesales/dev/github.com/marcellodesales/minitwit# exit
exit
```
