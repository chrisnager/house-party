# House Party

## Running

First, install nessecary gems via bundler: 
`$ bundle install`

Second, it is nessecary to provide the proper Facbeook credentials.

The APP SECRET and APP ID can be obtained from the facebook developer application page: https://developers.facebook.com/apps/1463273950565798/summary

Dev app credentials can be obtained from: https://developers.facebook.com/apps/419480054847402/summary

To provide these running locally set them in the .env file. 

To provide them to heroku see https://devcenter.heroku.com/articles/config-vars.

The committted .env file contains the credentials for the -DEV app. Heroku is set to use production credentials.

Run app locally via foreman: 
`$ foreman start`

Push to Heroku to deploy: 
`$ git push heroku master`

To push a branch other than master you can: 
`$ git push heroku yourbranch:master`

## Git Notes

First, create and swtich to a new branch for your feature:
`$ git checkout -b feature_branch`

To merge feature and ship:
```bash
$ git rebase master
$ git checkout master
$ git merge feature_branch
$ git branch -d feature_branch
$ git push [origin|github] master
```

## Software Notes

This app uses [Koala](https://github.com/arsduo/koala) to talk to the Facebook API.


## About 
Crafted by @chrisnager and @tdmackey.
