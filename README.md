# extract-clickfunnels-data
Extract ClickFunnels "extra info" data from the .csv

This is a work in progress, you can find out more from the website:

https://nicktemple.com/blog/extracting-clickfunnels-data/

# AWS Lambda
The project is evelving from a simple example to a more robust webapp.

As it stands, there is no error checking and it's bare bones. Pull requests gratefully accepted.

## Lambda development notes

This article is used for dev:
https://www.twilio.com/blog/serverless-ruby-on-aws-lambda-with-the-jets-framework

We're hitting the 6MB payload limit on the lambda, this could be fixed a number of ways, here are some suggestions:

https://theburningmonk.com/2020/04/hit-the-6mb-lambda-payload-limit-heres-what-you-can-do/

Ensure Ruby 2.5.3 is installed, as Jets doesn't work with 2.7 (though Lambda does)
RVM is recommended, other utilities seem to have trouble with Ruby versions that old. 
https://rvm.io/rvm/install


