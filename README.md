# Azure-Devops-ML-WebApp

Current Status (badge)
[![Build Status](https://dev.azure.com/magrathj/Azure-Flask-ML-App-Project/_apis/build/status/magrathj.Azure-Devops-ML-WebApp?branchName=main)](https://dev.azure.com/magrathj/Azure-Flask-ML-App-Project/_build/latest?definitionId=3&branchName=main)

![CI](https://github.com/magrathj/Azure-Devops-ML-WebApp/workflows/CI/badge.svg)

![CodeQL](https://github.com/magrathj/Azure-Devops-ML-WebApp/workflows/CodeQL/badge.svg)


Machine learning web app with CI/CD component using the agile framework to build out the project.





![cloned repo in Azure Cloud Shell](./images/azure-cli-cloned-repo.PNG)


![Pytest](./images/pytest_passing.PNG)


## Project Plan

![A link to a Trello board for the project](https://github.com/magrathj/Azure-Devops-ML-WebApp/projects/1)

* A link to a spreadsheet that includes the original and final project plan>

## Instructions

  
***Architectural Diagram***

![intro](./images/project_framework.PNG)


***Instructions for running the Python project locally***

``` bash 
git clone https://github.com/magrathj/Azure-Devops-ML-WebApp.git
```

``` bash 
    python3 -m venv ~/.flask-ml-azure
    source ~/.flask-ml-azure/bin/activate
```

``` bash 
    make all
```

***Instructions for running the Project on Azure App Service***

***Project cloned into Azure Cloud Shell***


* Passing tests that are displayed after running the `make all` command from the `Makefile`

* Output of a test run


* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).


* Running Azure App Service from Azure Pipelines automatic deployment


* Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/make_predict_azure_app.sh).
The output should look similar to this:

```bash
udacity@Azure:~$ ./make_predict_azure_app.sh
Port: 443
{"prediction":[20.35373177134412]}
```

* Output of streamed log files from deployed application

> 

## Enhancements

<TODO: A short description of how to improve the project in the future>

## Demo 

<TODO: Add link Screencast on YouTube>


# additional

# flask-ml-azure-serverless
Deploy Flask Machine Learning Application on Azure App Services

![continuous-delivery](https://user-images.githubusercontent.com/58792/85061538-f7352780-b174-11ea-8001-b0561c5bad73.jpg)

## To run it locally follow these steps

1.  Create virtual environment and source

```bash
python3 -m venv ~/.flask-ml-azure
source ~/.flask-ml-azure/bin/activate
```

2.  Run `make install`

3.  Run `python app.py`

4.  In a separate shell run: `./make_prediction.sh`

## To run it in Azure Pipelines

1.  Refer to [Azure Official Documentation guide here throughout](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops)

2. Launch Azure Shell  

![1-launch-azure-shell](https://user-images.githubusercontent.com/58792/89555246-cc169e00-d7dd-11ea-8164-88caa1b8beba.png)

3.  Create Github Repo with Azure Pipelines Enabled (Could be a fork of this repo)

![2-create-Github-Repo](https://user-images.githubusercontent.com/58792/89555912-a3db6f00-d7de-11ea-9d2f-5ac030b43ec9.png)

4. Clone the repo into Azure Cloud Shell

*Note:  You make need to follow this YouTube video guide on how to [setup SSH keys and configure cloudshell environment](https://www.youtube.com/watch?v=3vtBAfPjQus)*

5.  Create virtual environment and source

```bash
python3 -m venv ~/.flask-ml-azure
source ~/.flask-ml-azure/bin/activate
```

2.  Run `make install`

3.  Create an app service and initially deploy your app in Cloud Shell

`az webapp up -n <your-appservice>`

![3-flask-ml-service](https://user-images.githubusercontent.com/58792/89557009-2e709e00-d7e0-11ea-9b31-9090c8067a10.png)

4. Verify deployed application works by browsing to deployed url: `https://<your-appservice>.azurewebsites.net/`

You will see this output:

![4-deployed-app](https://user-images.githubusercontent.com/58792/89557343-a8088c00-d7e0-11ea-891c-4d88333b8097.png)

5.  Verify Machine Learning predictions work

Change the line in `make_predict_azure_app.sh` to match the deployed prediction
`-X POST https://<yourappname>.azurewebsites.net:$PORT/predict `

![5-successful-prediction](https://user-images.githubusercontent.com/58792/89557573-02a1e800-d7e1-11ea-8318-1c628e13dae7.png)

6. [Create an Azure DevOps project and connect to Azure, (as official documentation describes)](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops)

![6-devops](https://user-images.githubusercontent.com/58792/89558313-097d2a80-d7e2-11ea-8b65-df052b300331.png)

7.  Connect to Azure Resource Manager

![7-service-connection](https://user-images.githubusercontent.com/58792/89558869-d0918580-d7e2-11ea-8ffe-52cfaf95fe16.png)

8.  Configure connection to previously deployed resource group

![8-azure-pipelines-setup](https://user-images.githubusercontent.com/58792/89560149-988b4200-d7e4-11ea-9e25-3554ac2bd8fd.png)

9.  Create new Python Pipeline with Github Integration

![9-newpipeline](https://user-images.githubusercontent.com/58792/89560429-f750bb80-d7e4-11ea-9f85-241d65d25c55.png)

![10-github-integration](https://user-images.githubusercontent.com/58792/89560627-5282ae00-d7e5-11ea-8b0b-bdecfff0e4d3.png)


This process will create a YAML file that looks roughly like the YAML output shown below.  Refer to the [official Azure Pipeline YAML documentation for more information about it](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops#yaml-pipeline-explained).

```
# Python to Linux Web App on Azure
# Build your Python project and deploy it to Azure as a Linux Web App.
# Change python version to one thats appropriate for your application.
# https://docs.microsoft.com/azure/devops/pipelines/languages/python

trigger:
- master

variables:
  # Azure Resource Manager connection created during pipeline creation
  azureServiceConnectionId: '<youridhere>'
  
  # Web app name
  webAppName: 'flask-ml-service'

  # Agent VM image name
  vmImageName: 'ubuntu-latest'

  # Environment name
  environmentName: 'flask-ml-service'

  # Project root folder. Point to the folder containing manage.py file.
  projectRoot: $(System.DefaultWorkingDirectory)
  
  # Python version: 3.7
  pythonVersion: '3.7'

stages:
- stage: Build
  displayName: Build stage
  jobs:
  - job: BuildJob
    pool:
      vmImage: $(vmImageName)
    steps:
    - task: UsePythonVersion@0
      inputs:
        versionSpec: '$(pythonVersion)'
      displayName: 'Use Python $(pythonVersion)'
    
    - script: |
        python -m venv antenv
        source antenv/bin/activate
        python -m pip install --upgrade pip
        pip install setup
        pip install -r requirements.txt
      workingDirectory: $(projectRoot)
      displayName: "Install requirements"

    - task: ArchiveFiles@2
      displayName: 'Archive files'
      inputs:
        rootFolderOrFile: '$(projectRoot)'
        includeRootFolder: false
        archiveType: zip
        archiveFile: $(Build.ArtifactStagingDirectory)/$(Build.BuildId).zip
        replaceExistingArchive: true

    - upload: $(Build.ArtifactStagingDirectory)/$(Build.BuildId).zip
      displayName: 'Upload package'
      artifact: drop

- stage: Deploy
  displayName: 'Deploy Web App'
  dependsOn: Build
  condition: succeeded()
  jobs:
  - deployment: DeploymentJob
    pool:
      vmImage: $(vmImageName)
    environment: $(environmentName)
    strategy:
      runOnce:
        deploy:
          steps:
          
          - task: UsePythonVersion@0
            inputs:
              versionSpec: '$(pythonVersion)'
            displayName: 'Use Python version'

          - task: AzureWebApp@1
            displayName: 'Deploy Azure Web App : flask-ml-service'
            inputs:
              azureSubscription: $(azureServiceConnectionId)
              appName: $(webAppName)
              package: $(Pipeline.Workspace)/drop/$(Build.BuildId).zip
  ```
10.  Verify Continuous Delivery of Azure Pipelines by changing `app.py`

You can watch this [YouTube Walkthrough of this process](https://www.youtube.com/watch?v=3KF9DltYvZU)

11.  Add a lint step (this gates your code against syntax failure)

```
    - script: |
        python -m venv antenv
        source antenv/bin/activate
        make install
        make lint
      workingDirectory: $(projectRoot)
      displayName: 'Run lint tests'
```

You can watch this [YouTube Walkthrough of this process](https://www.youtube.com/watch?v=TItOatTfAOc)



