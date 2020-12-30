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


