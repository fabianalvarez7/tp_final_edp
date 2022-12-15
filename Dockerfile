FROM bash:latest

WORKDIR /app

COPY ./menu ./blankLinesCounter.sh ./findNames.sh ./statsSentences.sh ./statsUsageWords.sh ./statsWords.sh textotp.txt /app/

RUN chmod +x /app/menu.sh 

RUN mkdir data

ENTRYPOINT [ "/app/menu.sh" ]

