# MCW-Serverless-architecture

This repository contains resources for use with the Serverless architecture workshop, including 
ARM template for deploying the Lab virtual machine (VM) to Azure
WhiteBoard Design Session 
Source Code for the Workshop


## Agenda
* 09:00 - 09:30   Welcome and Introduction
* 09:30 - 10:00   PAAS @Microsoft
* 10:00 - 10:30   Serverless @Microsoft
* 10:30 - 10:45   Coffee Break
* 10:45 - 12:00   Serverless ([Whiteboard Session workshop](https://github.com/Microsoft/MCW-Serverless-architecture/blob/master/Whiteboard%20design%20session/WDS%20student%20guide%20-%20Serverless%20architecture.md))
* 12:00 - 13:00   Lunch break
* 13:00 - 16:00   Hands-on Labs: [ServerLess](https://github.com/Microsoft/MCW-Serverless-architecture/blob/master/Hands-on%20lab/HOL%20step-by-step%20-%20Serverless%20architecture.md)
* 16:00 - 16:30   Closing and Q&A

## Context
Litware, Inc. is rapidly expanding their toll booth management business to operate in a much larger area. As this is not their primary business, which is online payment services, they are struggling with scaling up to meet the upcoming demand to extract license plate information from a large number of new tollbooths, using photos of vehicles uploaded to cloud storage. Currently, they have a manual process where they send batches of photos to a 3rd-party who manually transcodes the license plates to CSV files that they send back to Litware to upload to their online processing system. 

They want to automate this process in a way that is cost effective and scalable. They believe serverless is the best route for them, but do not have the expertise to build the solution.

## Target Audience

Application developers

## Abstract

### Workshop

In this workshop, you will work as a group to setup and configure a serverless architecture within Azure using a combination of Azure Functions, Logic Apps, Event Grid, Cosmos DB, and Azure Storage. The focus is on removing server management from the equation, breaking down the solution into smaller components that are individually scalable, and allowing the customer to only pay for what they use.

At the end of this workshop, you will have learned how to use a series of Azure Functions that independently scale and break down business logic to discrete components, use computer vision algorithms within an Azure Function to accurately detect license plates in car images at scale, provision and use Cosmos DB as a highly available NoSQL data store for processed data, create a Logic App that contains a workflow to export processed license plates and conditionally send alerts based on successful or unsuccessful operation, use App Insights to monitor the serverless topology, observing how well the solution scales when under load, and implement a Continuous Deployment DevOps process to automatically publish changes to Function Apps.

### Whiteboard Design Session

In this whiteboard design session, you will work with a group to design a solution for processing vehicle photos as they are uploaded to a storage account, using serverless technologies on Azure. The license plate data needs to be extracted and stored in a highly available NoSQL data store for exporting. The data export process will be orchestrated by a serverless Azure component that coordinates exporting new license plate data to file storage and sending notifications as needed. You will also configure a Continuous Deployment process to automatically publish new changes to Function Apps. Finally, the entire processing pipeline will need to be monitored, with particular attention paid to components scaling to meet processing demand.

At the end of this whiteboard design session, you will have gained insight on how best to take advantage of the new serverless wave by designing a highly scalable and cost-effective solution that requires very little code and virtually no infrastructure, compared to traditional hosted web applications and services.

### Hands-on Lab

In this hand-on lab, you will be challenged to implement an end-to-end scenario using a supplied sample that is based on Microsoft Azure Functions, Azure Cosmos DB, Event Grid, and related services. The scenario will include implementing compute, storage, workflows, and monitoring, using various components of Microsoft Azure. The hands-on lab can be implemented on your own, but it is highly recommended to pair up with other members at the lab to model a real-world experience and to allow each member to share their expertise for the overall solution.

At the end of the hands-on-lab, you will have confidence in designing, developing, and monitoring a serverless solution that is resilient, scalable, and cost-effective.

## Azure services and related products

- Azure Functions
- Azure Cognitive Services
- Azure Event Grid
- Application Insights
- AzureCosmos DB
- Logic Apps

## Azure solution

Cloud-Native Apps


## Azure VM
[![Deploy Linux Devtools VM to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fjivane%2FMCW-Serverless-architecture%2Fmaster%2FDevVM%2Fazuredeploy.json)


## Related references

[MCW](https://github.com/Microsoft/MCW)
