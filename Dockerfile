#Dockerfile contents

# starting container
FROM ubuntu:22.04
LABEL maintainer="danielle.mcmillion@emory.edu"
#Setting enviroment to non-interactive
ARG DEBIAN_FRONTEND=noninteractive

# install software
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y --no-install-recommends r-base

# Installing R packages
RUN Rscript -e "install.packages(c('here', 'dplyr', 'ggplot2', 'tidyr', 'rmarkdown', 'knitr', 'renv'))"

#Creating a folder named "final_project_mcmillion" in the root directory
RUN mkdir /final_project_mcmillion

#Setting the working directory to /final_project_mcmillion
WORKDIR /final_project_mcmillion

# Copying project files
COPY . /final_project_mcmillion/

# Command to render an R Markdown report
CMD ["make", "all"]