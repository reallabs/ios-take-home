# JetFuel Take Home Exercise

This is a frontend exercise that will give you the chance to see what kind of things we build at JetFuel!

You will be building a simplified version of our main app, the Plug (www.plugco.in). This is the app through which our influencer access our offers, track their earnings, and manage their account. In particular, you will be recreating our main 'offer' feed:

![starter-screenshot](https://i.imgur.com/rOE6IPf.mp4)

We've spun up an endpoint on our server to return a sample feed of offers as a JSON blob. You can access that here:
http://www.plugco.in/api/take_home_sample_feed

Your job is set up an Objective-C iOS project that calls the sample endpoint and renders feed based on the JSON data returned. I've provided a design of the feed and explanation of each component in the Sketch file: 'feed_template_react_01.sketch'

![starter-screenshot](https://i.imgur.com/y4wuYGx.png)

Ideally, this should take around a day to finish, but let us know how much time you spent so we can calibrate our expectations!


## Getting started

Run the following commands:

```
cd iOS\ Takehome/
open iOS\ Takehome.xcworkspace
```

This should open an empty Objectice-C project. Please implement this in the provided UIViewController at 'ViewController.m'. Feel free to add any additional files you need. 

The project already has a Podfile set up, so any CocoaPod integrations are fair game. 

## Bonus

- Can you get the videos to play inline when the 'play' icon is tapped?
- What steps can you take to optimize the scroll performance? 


## Questions?

Feel free to reach out if you have any questions!
