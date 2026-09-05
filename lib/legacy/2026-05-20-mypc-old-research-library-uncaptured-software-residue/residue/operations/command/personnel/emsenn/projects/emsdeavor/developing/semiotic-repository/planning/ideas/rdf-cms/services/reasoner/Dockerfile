FROM openjdk:17-slim

RUN apt-get update && apt-get install -y \
    wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN wget https://repo1.maven.org/maven2/org/apache/jena/apache-jena/4.10.0/apache-jena-4.10.0.tar.gz && \
    tar -xzf apache-jena-4.10.0.tar.gz && \
    rm apache-jena-4.10.0.tar.gz

COPY reasoner.py .
COPY requirements.txt .

RUN apt-get update && apt-get install -y python3 python3-pip && \
    pip3 install -r requirements.txt

CMD ["python3", "reasoner.py"]
