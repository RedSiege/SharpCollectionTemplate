This template (SharpCollection.PipelineTemplate.json) can be used to create a new pipeline to build a .NET project. To use this template, you must have already signed up for a free or paid Azure DevOps account.

# Overview
This template will create a a new template to build a .NET executable from a  GitHub project. The template will configure the pipeline to clone the repository, download any dependencies via NuGet, build executables for the `Any`, `x86`, and `x64` CPU targets, and build each of these executables for .NET 4.0, 4.5, and 4.7.

# Creating an Organization and Project
After creating and activating your account, you will need to create a new DevOps organization using the "New organization" link found in your DevOps homepage. In the example below, the organization name is **SiegeFactory**. After creating an organzation, you will create a new project using the "+ New Project" button in your DevOps homepage. In the example below, the project name is **SharpCollection**. You will also enter in a description for that project. In this example, the description is "Red Siege C# Tools Collection."

<img src="https://github.com/RedSiege/SharpCollectionTemplate/blob/main/images/OrgAndProject.png" width="50%">

# Connect your GitHub account
If you have not already done so, the easiest way to connect your Azure DevOps account to your GitHub account is to create a new pipeline by clicking on the "New pipeline" button. Click the GitHub button. You will be prompted to log into your GitHub account. Save the connection to your Azure DevOps account and note the name used.

# Modifying the template
In order to use the new pipeline template, you will need to replace several placeholders in the template with with information about your Azure DevOps account, organization, project, and the GitHub project you wish to build:  

- GitHub Information
  - **###GHOrg###**
    - This placeholder is the GitHub organization name. For example, in https://github.com/RedSiege, RedSiege is the GitHub organization name.  Replace ###GHOrg### with RedSiege. 

  - **###GHProject###**
    - This is the placeholder for the GitHub project/repository name. For example, for this project, the replace ###GHProject### with SharpCollection.  

  - **###GHProjectBranch###**
    - This is the default branch of the GitHub project you wish to build. This is typically set to `main` or `master.`

  - **###BuildName###**
    - In some cases, you may wish to use a different name to refer to the tool than the project name. For example, if a project contains multiple tools but you are only building one tool, replace ###BuildName### with the specific tool name. The ###BuildName### placeholder is used to populate the `$BuildName` pipeline variable.

All Azure DevOps organization, project, and account information can be gathered using data you provided when creating your organization and project, or by viewing the page source of the Azure DevOps organization homepage. 

- Azure DevOps Information
  - **###AzOrg###**
    - This is the Azure DevOps organization name you created earlier. In the example above, the organization name was **SiegeFactory**.
  
  - **###AzProjectName###**
      - This is the name you gave the project you created. In the example above, the project name was **SharpCollection**.
    
  - **###AzProjectDescription###**
      - This is the description you gave the project you created. In the example above, the description was "Red Siege C# Tools Collection.

  - **###AzProjectUUID###**
    - Project information can be found by searching for `{"projects"` in the page source. Locate the `projectId` UUID and replace the **###AzProjectUUID##** placeholder with this value.

- Azure DevOps Account Information
  - **###AzAccountID###**
    - This is the ID for your account, shown as #4 in the example below.

  - **###AzAccountURL###**
    - This is the URL for your Azure DevOps account. In the example below, the **##AzAccountUrl##** is shown as #2.

  - **###AzAccountDisplayName###**
    - This is the display name for your Azure DevOps account. In the example below (#1), the `displayName` is "Mike Saunders."

  - **###AzAvatarDescriptor###**
    - This is the unique ID for your avatar. In the example below, the descriptor is shown as #5.

  - **###AzAvatarURL###**
    - This is the URL for your Azure DevOps account avatar. It is shown as #3 in the example below.

<img src="https://github.com/RedSiege/SharpCollectionTemplate/blob/main/images/AccountInfo.png" width="75%">

# Importing the pipeline template
To import your modified pipeline template and create a new pipeline, open your Azure DevOps project by clicking on the project name in the Azure DevOps organization homepage. Click on the Pipelines icon on the left-hand side of the page. In the upper right-hand side of the page, next to the "New pipeline" button, click on the three vertical dots and select "Import a pipeline." Follow the dialog box to open your modified template and click the "Import" button to start the import process.

The initial pipeline name will be `SharpCollection.###BuildName###-import`. For example, if you set **###BuildName###** to `Certify`, the initial pipeline name will be `SharpCollection.Certify-import.` Delete the "-import" from the pipeline name field. Select "Azure Pipelines" from the "Agent pool" dropdown. In some cases, it may be necessary to use the "windows-2022" or "windows-latest" agents, however you will typically want to select "windows-2019" from the "Agent Specification" dropdown.

Select "Save & queue" from the top menu to save the pipeline and queue a build.

# Adding artifacts to Organization
Artifacts can be manually added to an Azure DevOps organization for use in pipelines. To upload artifacts to your organization, create a folder and place the items to upload in the folder. Then, using the Azure CLI, `cd` to the folder you created and use the command shown below. In this example, the Organization and feed names have been set to "ExampleFactory." The artifact name has been set to "example-executble." **Note:** Artifact names must be lowercase alphanumeric strings separated by a period, a dash, or a \\.

```
az artifacts universal publish \
 --organization https://dev.azure.com/ExampleFactory/ \
 --feed ExampleFactory \
 --name example-executable \
 --version 0.0.1 \
 --description "Example executable" \
 --path .
 ```

