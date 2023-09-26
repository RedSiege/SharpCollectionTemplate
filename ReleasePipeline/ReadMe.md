# Overview
Release pipelines can be used to package completed builds into a release. For the purposes of the build pipeline, this means collecting the build artifacts (executables) for successful builds and publishing them to a GitHub repository.

# Dependencies
For pushing to GitHub, you will need a GitHub repository you control, and you will need to configure an OAuth token in Azure DevOps to allow access to your GitHub repositories. This should already be completed if you have created a build pipeline.

## Modifying GitCommit.ps1
You will need to make several changes to this script. If your Azure DevOps project is not named "SharpCollection," you will need to modify the `$binaryPaths` variable on line 3 and change "SharpCollection" to your project name.

The GitCommit.ps1 script is configured to publish to the YourAzureDevOpsOrg SharpCollection repository. This is referred to in the script as `\_YourAzureDevOpsOrg\_SharpCollection`. If your GitHub username is `LittleBobbyTables` and your repository is named `MySharpTools`, you would replace all instances of `\_LittleBobbyTables\_MySharpTools` with 

Change the `user.email` and `user.name` values on lines 9 and 10 to match your GitHub account.

# Building a Release Pipeline
- From the left-hand menu, select the Pipelines icon, then select Releases from the Pipelines menu.  Click the "+ New" menu and select "+ New Release Pipeline" from the dropdown. In the template selection window, select "Empty job." When prompted, enter "Publish to GitHub" for the stage name."
- From the Artifacts section, click "+ Add" to add an artifact. Select the GitHub icon. From the Service menu, select the GitHub connection you associated with Azure DevOps. If you have not previously configured an OAuth connection, you can create a new connection using the "+ New" menu and following the prompts. In the "Source (repository)" menu, enter the organization name and repository information. For example, to use the YourAzureDevOpsOrg SharpCollection repository, enter `YourAzureDevOpsOrg/SharpCollection`. **Note:** Do not enter the full URL. Enter only the organization name and repository name.
- Select the default branch to use from the "Default branch" menu.
- Select "Lates from the default branch" from the "Default version" menu.
- Define a "Source alias" that will be referred to by your publisher script. The default name will be "\_OrgName\_RepositoryName."
- Click "Add"

You will now need to add the artifact collection for each pipeline you have configured.
- From the Artifacts section, click "+ Add" to add an artifact. Select the "Build" source type. Select the appropriate Project from the dropdown. For the YourAzureDevOpsOrg SharpCollection pipeline, the Project would be SharpCollection. Select the desired source from the "Source (build pipeline)" dropdown. Repeat this process for each pipeline you wish to publish.
- Leave the "Default version" dropdown at the default of "Latest."
- Leave the "Source alias" entry as the default.
- Click "Add"
- Click the lightning bolt icon on the newly-created artifact and set the configuration slider for the "Continuous deployment trigger" to Enabled. This will cause the release pipeline to fire each time a new build is available.

To configure the publication stage:
- Click on the "Tasks" menu near the top of the page.
- Click the "+" icon on the "Agent job" task.
- From the Utility task menu, scroll and select "PowerShell" and click the Add button.
- Click on the new PowerShell task to configure it.
- If desired, change the "Display name" to something more descriptive, such as "Publish artifacts to GitHub."
- Select the "Inline" radio button
- Paste the contets of GitCommit.ps1 into the script pane.
- Click "Save" near the top right.

# Creating and publish a release
- To create a release, select the "Create release" button near the top right-hand side of the page.
- Click on the stage name. Alternatively, select the Stage name from the "Stages for a trigger change from automated to manual" dropbox.
- Click Create.
- Near the top of the page, you will see a message saying "Release \"Release-\#\#\" has been created". Click on the "Release-\#\#" to access the next phase.
- From the Stages section, hover over your stage name and select the Deploy icon that appears below.
- If necessary, scroll to the bottom of the page and select the Deploy button.

