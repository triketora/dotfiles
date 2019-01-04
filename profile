# -*- mode: sh -*-

# Fix for virtualenvwrapper.
# https://stackoverflow.com/questions/11507186/python-virtualenv-no-module-named-virtualenvwrapper-hook-loader
export PATH=$PATH:/usr/local/bin/virtualenv

# Add /opt/local/bin to PATH for MacPorts.
export PATH=$PATH:/opt/local/bin

# Add Mac Postgres.app bin path to PATH for using psql.
# http://postgresapp.com/documentation/cli-tools.html
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# Add NPM bin path to PATH.
export PATH="$HOME/.npm-packages/bin:$PATH"
