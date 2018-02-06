FROM ubuntu:16.04
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL software.version="1.0"
LABEL version="0.1"
LABEL software="dimspy"
LABEL base.image="ubuntu:16.04"
LABEL description="Python package to process direct-infusion mass spectrometry-based metabolomics and lipidomics data"
LABEL website="https://github.com/phnmnl/container-dimspy"
LABEL documentation="https://github.com/phnmnl/container-dimspy"
LABEL license="https://github.com/phnmnl/container-dimspy"
LABEL tags="Metabolomics"

RUN apt-get update && \
	apt-get install -y curl && apt-get install -y bzip2 && apt-get install -y git

RUN curl -LO http://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
RUN bash Miniconda2-latest-Linux-x86_64.sh -p /miniconda2 -b
RUN rm Miniconda2-latest-Linux-x86_64.sh

ENV PATH=/miniconda2/bin:${PATH}

RUN conda update -y conda

RUN conda install -c conda-forge -c bioconda dimspy

