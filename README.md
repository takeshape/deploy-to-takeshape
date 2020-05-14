# deploy-to-takeshape
A GitHub action for deploying a project that uses the TakeShape SSG

## Secrets
This action depends on the following secrets, set in `/settings/secrets`:
* `TS_PROJECT_ID`: the ID of your TakeShape project. Found in the URL of your project on app.takeshape.io
* `TS_AUTH_TOKEN`: a TakeShape API key. [Learn how to create one](https://www.takeshape.io/docs/creating-an-api-key/) in the TakeShape docs
* `TS_SITE_NAME`: the name of the static site you want to deploy
* `TS_SITE_ID`: the ID of the static site you want to deploy. Found in the URL of the static site in your project on app.takeshape.io