# oow-bot
Telegram bot for best team ever - OOW

Prerequisites
-------------
Required software:
- Ruby `>= 2.6.0`

Install
-----------------
```
git clone https://github.com/olehvavryniv/oow-bot.git && cd oow-bot
bundle install
```
Create `.ENV` file from `.env.example` or ask some developers for example

`cp .env.example .env`

Install dependencies

`bundle install`

Launch
------------
```
ruby oow-bot.rb
```

Docker
------------
Run
```bash
docker run --name oow-bot --restart=always --mount type=bind,src=/root/oow-bot-env,dst=/usr/src/app/.ENV -d ghcr.io/olehvavryniv/oow-bot
```

Build
```bash
docker build -t ghcr.io/olehvavryniv/oow-bot .
```

Publish
```bash
docker push ghcr.io/olehvavryniv/oow-bot
```
