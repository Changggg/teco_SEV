FROM centos:7
MAINTAINER Chang Gyo Jung <cgjung86@nau.edu>

RUN mkdir /source
COPY . /source
WORKDIR /source
RUN yum install -y gcc gcc-gfortran
RUN gfortran -o /source/teco_SEV /source/TECO_SEV.f90
RUN chmod +x /source/teco_SEV
ENTRYPOINT ["./teco_SEV"]
CMD ["./input/SEV_pars.txt", "./input/SEV_forcing_2010_2017.txt","./input/SEV_obs_flux.txt","/source/output/","0"]



