# Simple Rasa Deployment

This is a very simple way to deploy a Rasa bot.
It runs everything inside a single container.
You can instantly deploy this to Render, or to any other platform where you can run a docker container.
You can then connect a chat widget to your running Rasa bot.

## Deploying to Render

1. Ensure your trained Rasa model is committed to your repository at `models/model.tar.gz`
2. Ensure your `credentials.yml` file is configured to use the socket.io channel:
   ```
   socketio:
     user_message_evt: user_uttered
     bot_message_evt: bot_uttered
     session_persistence: true
   ```
3. Create a web service on render using an instance with at least 1Gb RAM. Remember to set your Rasa Pro License key as an environment variable.

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)


## Setting up the Chat Widget

Edit the index.html file in this repo, to modify the `server-url` to point to your running container.
On render, your server-url will look like: `https://<my-project>.onrender.com`.

```
<rasa-chatbot-widget server-url="https://example.com"></rasa-chatbot-widget>
```

Then open the `index.html` file in your browser.
Alternatively, add the [Rasa Chat Widget](https://github.com/RasaHQ/chat-widget) to your site.


## Deploying to other platforms

Train your rasa bot:

```bash
rasa train
```

Then build your container:

```bash
docker build -t my-rasa-chatbot .
```

And follow your platform's instructions to deploy your container.
