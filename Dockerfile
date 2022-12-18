FROM ubuntu

WORKDIR /app

COPY ./menu.sh /app
COPY ./blankLinesCounter.sh /app
COPY ./findNames.sh /app
COPY ./statsSentences.sh /app
COPY ./statsUsageWords.sh /app
COPY ./statsWords.sh /app
COPY ./textotp.txt /app

RUN chmod +x /app/menu.sh blankLinesCounter.sh findNames.sh statsSentences.sh statsUsageWords.sh statsWords.sh 

#RUN mkdir /volumenapp

ENTRYPOINT ["bash", "./menu.sh"]

CMD ["./menu"]

#VOLUME /volumenapp

