FROM python:3.8
RUN apt-get update && apt-get install -y git && apt-get install -y jq
WORKDIR ./dgsm-docker
RUN git clone https://github.com/jonahwh/DiscordGSM.git .
RUN git fetch && git checkout "$(curl --silent "https://api.github.com/repos/jonahwh/DiscordGSM/commits" | jq -r '.[0].sha')"
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
CMD ["python3", "-u", "bot.py", "-d"]
