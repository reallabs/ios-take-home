# JetFuel Take Home Exercise

This is a frontend exercise that will give you the chance to see what kind of things we build at JetFuel!

You will be building a simplified version of our main app, the Plug (www.plugco.in). This is the app through which our influencer access our offers, track their earnings, and manage their account. In particular, you will be recreating our main 'offer' feed:

We've spun up an endpoint on our server to return a sample feed of offers as a JSON blob. You can access that here:
http://www.plugco.in/public/take_home_sample_feed

Your job is set up an Objective-C or Swift iOS project that calls the sample endpoint and renders feed based on the JSON data returned. I've provided the design and an explanation of each component in a Sketch file - 'feed_template_react_01.sketch'. This file is included in the repository:

![starter-screenshot](https://i.imgur.com/b5O8M1Z.png)

We're giving you 3 hours to make as much progress on this project as possible. While we recognize it will be difficult to finish everything, part of the goal is to see how you prioritize, and how much you're able to get through. 


## Getting started

Run the following commands:

```
cd iOS\ Takehome/
open iOS\ Takehome.xcworkspace
```

This should open an empty Objectice-C project. Please implement this in the provided UIViewController at 'ViewController.m'. Feel free to add any additional files you need. 

We set this up as Objective-C, because our app is in Objective-C. However, if you'd prefer Swift, that's okay too. Just set up your own project in the same way!

The project already has a Podfile set up, so any CocoaPod integrations are fair game. 

## Bonus

- Can you add pull-to-refresh? 
- Can you handle failed API requests gracefully? Maybe redirect to a 'failed' UI state with a rety option? 
- Can you get the videos to play inline when the 'play' icon is tapped?
- What steps can you take to optimize the load time of cover photos? How about the scroll performance? 

## Questions?

Feel free to reach out if you have any questions!
