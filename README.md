# deploy-to-takeshape
A GitHub action for deploying a project that uses the TakeShape SSG

## Customization
There's a few areas of the action you may want to customize for your own needs:
* In the `job` commands, changing the command to reflect the package manager you're using.
* In the `on` trigger, changing the branches or conditions under which the action will run.

If you're looking to deploy different static sites depending on which branch is updated,
for instance if you'd like to update a staging site when a `dev` branch is pushed-to,
you'll want to add multiple actions, with each one customized for that branch and that site.

## Secrets
This action depends on the following secrets, set in `/settings/secrets`:
* `TS_PROJECT_ID`: the ID of your TakeShape project. Found in the URL of your project on app.takeshape.io
* `TS_AUTH_TOKEN`: a TakeShape API key. [Learn how to create one](https://www.takeshape.io/docs/creating-an-api-key/) in the TakeShape docs
* `TS_SITE_NAME`: the name of the static site you want to deploy
* `TS_SITE_ID`: the ID of the static site you want to deploy. Found in the URL of the static site in your project on app.takeshape.io
