FROM ubuntu
RUN apt-get update
RUN apt-get install -y nano
RUN apt-get install -y nodejs && apt install -y git
#ENTRYPOINT ["/bin/bash"]
RUN mkdir datos
WORKDIR /datos
RUN touch f1.txt
RUN mkdir /datos1
WORKDIR /datos1


##COPY##
COPY f2.txt .

##ADD es mas potente que copy##
ADD docs docs
ADD f* /datos/

##ENV##
ENV dir=/data dir1=/data1
RUN mkdir $dir && mkdir $dir1

##ARG -> docker build -t image:v5 --build-arg dir2=/data2 ##
ARG dir2
RUN mkdir $dir2

##Se pasa el nombre de usuario por env se copia el sh local a la imagen y se ejecuta. El script tiene una error y no funciona pero para el ejemplo nos vale ##
# ARG user
# ENV user_docker $user
# ADD add-user.sh /datos1/
# RUN /datos1/add-user.sh

##EXPOSE && CMD EL CMD ejecuta intruciones de la consola en la imagen cuando se lanza##
RUN apt-get install -y apache2
EXPOSE 80

ADD entrypoint.sh /datos1/
CMD /datos1/entrypoint.sh

##VOLUME##
add paginas /var/www/html/
VOLUME ["/var/www/html"]
