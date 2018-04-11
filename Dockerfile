FROM quay.io/pires/docker-elasticsearch:6.2.3

MAINTAINER thomasriley@rentalcars.com

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Add scripts for pre/post lifecycle hooks
ADD hooks /elasticsearch/hooks

# Set environment
ENV DISCOVERY_SERVICE elasticsearch-discovery

# Kubernetes requires swap is turned off, so memory lock is redundant
ENV MEMORY_LOCK false