# cinma_demo
Simple Ruby api to handle four different entities. 
- movies
- reviews

## How to install

To install you need docker and docker composer to be installed on your machine. 
And you need to create and .env file with the variables like `.env.erb`:
```
docker compose up --build
```

or if you have ruby and rails installed
```
bundle install 
rails s
```

### To activate the rake tasks

```
rake movies:import
rake reviews:import
```