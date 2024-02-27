#!/bin/bash
set -eof pipefail

# Error handling here is annoying; xcode-select will fail if the CLI dev tools
# are already installed, but it could also error, and I don't know that it has
# a different exit code when it's a real install failure. Giving it its own
# script so I can just manually intervene as needed.
xcode-select --install


