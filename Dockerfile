FROM ubuntu:16.04
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL software.version="1.1.0"
LABEL version="1.0"
LABEL software="dimspy"
LABEL base.image="ubuntu:16.04"
LABEL description="Python package to process direct-infusion mass spectrometry-based metabolomics and lipidomics data"
LABEL website="https://github.com/phnmnl/container-dimspy"
LABEL documentation="https://github.com/phnmnl/container-dimspy"
LABEL license="https://github.com/computational-metabolomics/dimspy/blob/master/LICENSE"
LABEL tags="Metabolomics"

RUN apt-get update && \
	apt-get install -y --no-install-recommends \ 
	ca-certificates \
	curl \
	bzip2 && \
	curl -LO http://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh && \
	bash Miniconda2-latest-Linux-x86_64.sh -p /miniconda2 -b && \	
	rm Miniconda2-latest-Linux-x86_64.sh 

ENV PATH=/miniconda2/bin:${PATH}

RUN conda update -y conda && \
    conda install -c conda-forge -c bioconda dimspy=1.1.0 && \
    apt-get purge -y \
	ca-certificates \
	curl \
	bzip2 && \
    apt-get -y clean && apt-get -y autoremove && \
    rm -rf  /var/lib/apt/lists/* /var/lib/{cache,log}/ /tmp/* /var/tmp/*

ADD runTest1.sh /usr/local/bin/runTest1.sh
RUN chmod a+x /usr/local/bin/runTest1.sh
