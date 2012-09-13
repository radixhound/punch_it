# PunchIt!

PunchIt! is a simple service for tracking users in an office. They can punch in and out using simple strings like "IN" and "OUT going for lunch".

Part of the idea of this is that potentially it can be hooked up to twitter or some other messaging service to easily do updates.

## Collaboration:

Additionally, you can update the status of other members. This is a philosophical choice because the natural reaction is to secure everything so only the user herself can update their status. However, the goal here is to make a useful tool that people can work together on, so they can do something like "IN back from lunch WITH: jonny jessy brad". 

## Tradeoffs

- Auth features like update password and remember me were not implemented for simplicity but are easy to add
- For the sake of simplicity and having a minimalist feel, for now just went with usernames rather than including full names, which is important.
- The CSS and HTML are very ad-hoc and need to be done properly.
- Peformance of SQL queries hasn't been addressed. e.g. no indexes.

## Future Plans

- Make people part of teams and display the lists per team
- Add sorting and filtering based on status and time since last update
- Add integration for a chat client like HipChat
- Add a basic external api
- Add the ability to have aditional statuses like IN / busy and IN / available etc.
- Integrate with a calendar or just allow people to update future statuses like 'AWAY next monday'

Overall my initial impression is that the main reason for something like this is for support requests or when you need to ask a question of someone in another department and need to know who is available. I am imagining an ideal end goal for this would be to integrate this with other communication tools and set up a kind of queue for getting help. For example, a sales person could click a button to talk to the next available support person, and that could launch a chat window, and then store the contents of the chat into a CRM system when it's all done.

!(https://github.com/radixhound/punch_it/blob/master/screen_sample.png?raw=true)
