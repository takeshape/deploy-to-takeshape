# deploy-to-takeshape
A GitHub action for deploying a project that uses the TakeShape SSG

## How to use
First, set the following secrets in `/settings/secrets`:
  
* `TS_PROJECT_ID`: the ID of your TakeShape project. Found in the URL of your project on app.takeshape.io
* `TS_AUTH_TOKEN`: a TakeShape API key. [Learn how to create one](https://www.takeshape.io/docs/creating-an-api-key/) in the TakeShape docs
* `TS_SITE_NAME`: the name of the static site you want to deploy
* `TS_SITE_ID`: the ID of the static site you want to deploy. Found in the URL of the static site in your project on app.takeshape.io

Once your secrets are in place, copy this example config into `.github/workflows/ci.yml`. Then commit and push your changes:

```yml
# This workflow deploys a TakeShape project.
# Make sure to set Secrets in your GitHub repo's settings!
# https://github.com/<profile>/<repo>/settings/secrets 
name: CI

# We only want to deploy on changes to the master branch
# You can change this to better meet the needs of your own project
# For example, you could deploy to different static sites depending on the branch
# Learn more about configuring jobs:
# https://help.github.com/en/actions/reference/workflow-syntax-for-github-actions
on:
  push:
    branches:
    - master

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    # Uses secrets set in https://github.com/<profile>/<repo>/settings/secrets
    # You can change this to better meet the needs of your own project
    - name: Deploy to TakeShape
      uses: takeshape/deploy-to-takeshape@v1.0
      with:
        project-id: ${{ secrets.TS_PROJECT_ID }}
        auth-token: ${{ secrets.TS_AUTH_TOKEN }}
        site-name: ${{ secrets.TS_SITE_NAME }} 
        site-id: ${{ secrets.TS_SITE_ID }}
```

This will trigger a deployment for every commit to master. If you'd like to change the "on" event,
see the [GitHub action documentation](https://help.github.com/en/github/automating-your-workflow-with-github-actions/workflow-syntax-for-github-actions#on),
which shows how to build on Pull Requests, Releases, Tags and more.

If you're looking to deploy different static sites depending on which branch is updated,
for instance if you'd like to update a staging site when a `dev` branch is pushed-to,
you'll want to add multiple workflow files, with each one customized for that branch and that site.

## Configuration

The `with` portion of the workflow **must** be configured before the action will work. Any `secrets` must be referenced using the bracket syntax and stored in the GitHub repositories `Settings/Secrets` menu. You can learn more about setting environment variables with GitHub actions [here](https://help.github.com/en/articles/workflow-syntax-for-github-actions#jobsjob_idstepsenv).

| Key  | Value Information | Type | Required |
| ------------- | ------------- | ------------- | ------------- |
| `project-id`  | The ID of your TakeShape project. Found in the URL of your project on `app.takeshape.io`. | `string` | **Yes** |
| `auth-token`  | A TakeShape API key. [Learn how to create one](https://www.takeshape.io/docs/creating-an-api-key/) in the TakeShape docs. | `secrets` | **Yes** |
| `site-name` | The name of the static site you want to deploy. The static site must be configured in your TakeShape project. | `string` | **Yes** |
| `site-id` | The ID of the static site you want to deploy. Found in the URL of the static site in your project on `app.takeshape.io`. | `string` | **Yes** |
