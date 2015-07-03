FROM ndeloof/java

MAINTAINER Baptiste Mathus <batmat@batmat.net>

RUN curl http://ftp.halifax.rwth-aachen.de/eclipse//technology/epp/downloads/release/mars/R/eclipse-java-mars-R-linux-gtk-x86_64.tar.gz | tar -xvz

WORKDIR /eclipse

RUN ./eclipse -nosplash -application org.eclipse.equinox.p2.director \
              -repository http://download.eclipse.org/releases/mars \
              -installIUs org.eclipse.egit.feature.group,org.eclipse.jgit.feature.group

RUN ./eclipse -nosplash -application org.eclipse.equinox.p2.director \
              -repository http://download.eclipse.org/releases/mars \
              -installIUs org.eclipse.m2e.feature.feature.group

CMD ["cp","-R","/eclipse","/eclipse-provisioned"]
