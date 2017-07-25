#!/bin/sh

USER=fernandomayer
HOST=leg.ufpr.br
DIR=public_html/aulas/ce083/

Rscript -e 'rmarkdown::render_site()' && rsync -avz --delete docs/ ${USER}@${HOST}:~/${DIR}

exit 0
