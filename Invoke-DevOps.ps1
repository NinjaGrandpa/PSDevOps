# Group
#     az devops : Manage Azure DevOps organization level operations.
function Invoke-DevOps {az devops @args}

#         Related Groups
#         az pipelines: Manage Azure Pipelines
#         az boards: Manage Azure Boards
#         az repos: Manage Azure Repos
#         az artifacts: Manage Azure Artifacts.

# Subgroups:
#     admin            : Manage administration operations.
#     extension        : Manage extensions.
#     project          : Manage team projects.
#     security         : Manage security related operations.
#     service-endpoint : Manage service endpoints/connections.
#     team             : Manage teams.
#     user             : Manage users.
#     wiki             : Manage wikis.

# Commands:
#     configure        : Configure the Azure DevOps CLI or view your configuration.
#     invoke           : This command will invoke request for any DevOps area and resource. Please use
#                        only json output as the response of this command is not fixed. Helpful docs -
#                        https://docs.microsoft.com/en-us/rest/api/azure/devops/.
#     login            : Set the credential (PAT) to use for a particular organization.
#     logout           : Clear the credential for all or a particular organization.

#region az boards

# Group
#     az boards : Manage Azure Boards.
#         This command group is a part of the azure-devops extension.
function Invoke-DevOpsBoards {az boards @args}

# Commands:
#     query     : Query for a list of work items.
function Get-DevOpsBoards {Invoke-DevOpsBoards query @args }

# Subgroups:
#     area      : Manage area paths.
#     iteration : Manage iterations.
#     work-item : Manage work items.

#region az boards work-item

# Group
#     az boards work-item : Manage work items.
function Invoke-DevOpsWorkItems {Invoke-DevOpsBoards work-item @args}

# Commands:
#     create   : Create a work item.
#     delete   : Delete a work item.
#     show     : Show details for a work item.
#     update   : Update work items.
function New-WorkItem {Invoke-DevOpsWorkItems create @args}
function Remove-WorkItem {Invoke-DevOpsWorkItems remove @args}
function Show-WorkItem {Invoke-DevOpsWorkItems show @args}
function Update-WorkItem {Invoke-DevOpsWorkItems update @args}

# Subgroups:
#     relation : Manage work item relations.

#region az boards work-item relation
# Group
#     az boards work-item relation : Manage work item relations.
function Invoke-DevOpsRelations {Invoke-DevOpsWorkItems relation @args}

# Commands:
#     add       : Add relation(s) to work item.
#     list-type : List work item relations supported in the organization.
#     remove    : Remove relation(s) from work item.
#     show      : Get work item, fill relations with friendly name.
function Add-WorkItemRelations {Invoke-DevOpsRelations add @args}
function Get-WorkItemRelations {Invoke-DevOpsRelations list-type @args}
function Remove-WorkItemRelations {Invoke-DevOpsRelations remove @args}
function Show-WorkItemRelations {Invoke-DevOpsRelations show @args}
#endregion az boards work-item relation
#endregion az boards work-item
#endregion az boards