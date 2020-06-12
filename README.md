## Setup
#### TODO: For docker add: 'docker-compose' commands before the commands below
* cd dashboard-api
* bundle install
* rake db:create
* rake db:migrate
* replace API keys in app.rb with valid ones

## Run
* ruby app.rb
* visit localhost:4567

## Routes
This API has one route, the root which returns aggregated data from the 3rd party APIs in use


root route: /

stats| | | | | 
:-----:|:-----:|:-----:|:-----:|:-----:|:-----:
 |cases|int| | | 
 |deaths|int| | | 
 |recovered|int| | | 
news| | | | | 
 |totalResults|int| | | 
 |articles|[ ]| | | 
articles| | | | | 
 |source|{ }| | | 
 | |id|string| | 
 | |name|string| | 
 |author|{ }| | | 
 | |title|string| | 
 | |description|string| | 
 | |url|string| | 
 | |urlToImage|string| | 
 | |publishedAt|string| | 
 | |content|string| | 
assets| | | | | 
 |spy1m| | | | 
 | |Meta Data|{ }| | 
 | | |1. Information|string| 
 | | |2. Symbol|string| 
 | | |3. Last Refreshed|string| 
 | | |4. Output Size|string| 
 | | |5. Time Zone|string| 
 | |Time Series (Daily)|[ ]| | 
 | | |$DATE (YYY-MM-DD)|{ }| 
 | | | |1. open|float
 | | | |2. high|float
 | | | |3. low|float
 | | | |4. close|float
 | | | |5. volume|float
 |btc1m| | | | 
 | |Meta Data|{ }| | 
 | | |1. Information|string| 
 | | |2. Digital Currency Code|string| 
 | | |3. Digital Currency Name|string| 
 | | |4. Market Code|string| 
 | | |5. Market Name|string| 
 | | |6. Last Refreshed|string| 
 | | |7. Time Zone|string| 
 | |Time Series (Digital Currency Monthly)|[ ]| | 
 | | |$DATE (YYY-MM-DD)|{ }| 
 | | | |1a. open (CNY)|float
 | | | |1b. open (USD)|float
 | | | |2a. high (CNY)|float
 | | | |2b. high (USD)|float
 | | | |3a. low (CNY)|float
 | | | |3b. low (USD)|float
 | | | |4a. close (CNY)|float
 | | | |4b. close (USD)|float
 | | | |5. volume|float
 | | | |6. market cap (USD)|float
countries|{ }| | | | 
 |country|string| | | 
 |cases|int| | | 
 |todayCases|int| | | 
 |deaths|int| | | 
 |todayDeaths|int| | | 
 |recovered|int| | | 
 |active|int| | | 
 |critical|int| | | 
 |casesPerOneMillion|int| | | 
 |deathsPerOneMillion|int| | | 
 |totalTests|int| | | 
 |testsPerOneMillion|int| | | 
timeline|[ ]| | | | 
 |date|string  (YYY-MM-DD)| | | 
 |confirmed|int| | | 
 |deaths|int| | | 
 |recovered|int| | | 
