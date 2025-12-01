## The rocker containers provide a solid basis for everything R related
FROM rocker/tidyverse

## Update package data base
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y graphviz libnetcdf-dev python3-pip python3-venv
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN python3 -m pip install xarray zarr fsspec requests aiohttp
RUN Rscript -e 'install.packages(c("xaringan", "ncdf4", "reticulate"), Ncpus = 8)'


## this is what is being run with docker run
CMD ["make"]
