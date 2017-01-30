# Five Minutes With slack-notifier


Wouldn't it be great if your app was smart enough to contact you when notable events occurred?

![Important message](https://i.imgur.com/keViLUo.png)

####Well it can!

How you ask?  Through the magic of [a sweet gem named slack-notifier.](https://github.com/stevenosloan/slack-notifier)

![Gems](http://www.whereoware.com/blog/wp-content/uploads/Colorful-Gems.jpg)

*Oooooooooohhhh....shiny!*

It's pretty easy really...there are just three step:

* Set up a slack account and a personal slack team with a web hook
* Install slack-notifier
* Write a notifier into your code for any important event

So let's get started!

---

### 1. Setting up a Slack Web Hook

![Webhooks](https://abdelkrim.files.wordpress.com/2014/02/aaarr-webhooks-pirate.gif)

Ok, so what's a webhook?  Well....I have no idea.  Off to google!

```
So, what exactly is a webhook? 
A webhook (also called a web callback or HTTP push API) is a way for an app to provide other applications
with real-time information. 
A webhook delivers data to other applications as it happens, meaning you get data immediately.
```

[Answer provided by sendgrid.com](https://sendgrid.com/blog/whats-webhook/)

Thanks all knowing magical search bar.  

Now that we know what it is, time to set one up.  We can follow the simple instructions provided to us by the slack-notifier documentation.

```
To get the WEBHOOK_URL you need:

1. go to https://slack.com/apps/A0F7XDUAZ-incoming-webhooks
2. choose your team, press configure
3. in configurations press add configuration
4. choose channel, press "Add Incoming WebHooks integration"
```

When you're done, you should see something like this:

![example slack webhook](https://i.imgur.com/b3bA0zR.png)

Copy that sucker and save it for a minute.  Let's get our gem installed.

### 2. Install slack-notifier

Go to terminal and type the following where your rails app is installed:

```
Gem install slack-notifier
```

That's it.  What?  You wanted something harder?  Fine...

<details><summary>click harder and cooler method</summary>
```
Just kidding...that's seriously it.  Move on.  Take the easy win.
```
</details>

### 3. Test for sanity, then add some code to your app!

First things first...let's make sure it's working.  If we open the rails console, we can try it out before we implement it.

Type the following lines into the console to give it a try.

```
require 'slack-notifier'

notifier = Slack::Notifier.new "WEBHOOK_URL"
notifier.ping "Hello World"
```

Great!  Now that it's working, let's actually see how this might work in your code.  This repo is a test app.  Feel free to use it to send me a bunch of annoying notifications later, but for now, let's see what it does when I create a new user.

Kinda neat, huh?

Here's the code that makes this happen.  You'll notice it seems pretty similar to what was previously entered into the console.  You can use this to make all kinds of custom notifications throughout your app.  

```
class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    login(@user)
    notifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
    notifier.ping "A new user named #{current_user.name} has joined your site!"
    redirect_to @user
  end
  ```
  ---
  
  So that's slack-notifier.  I hope you learned something.
  
  If you did, you can officially consider yourself........
  
  ## NOTIFIED!!!
  
  ![rimshot](https://media.giphy.com/media/cD7PLGE1KWOhG/giphy.gif)
