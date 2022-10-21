# Atlantis


## What is Atlantis

Atlantis is an application to automate the Terraform plan/apply process via pull requests (PR). 

Instead of running Terraform locally, engineers should check code into Github under a new branch and open and PR. The PR will kick off the Atlantis process which will run a `terraform plan` and post a comment with the results of that plan to the PR. 

Approval (as well as other potential requirements -- must be mergable, undiverged) of the PR will allow for commenting back to the PR with `atlantis apply` which instructs Atlantis to apply the changes from the plan and post the results of that plan to the PR.

Additonal settings can be set to occur after an `apply` such as auto-merge of the branch and deleting of the source branch.

<img src="../images/atlantis_flow.png" alt="Atlantis Flow" title="Atlantis Flow">

## What is Infracost

Infracost creates cost estimates on your Terraform Pull Requests. Within the flow above we inject an addtional task to run Infracost and comment back on the PR on the cost of what is being configured/deployed within the cloud.

Infracost parses the Terraform code to extract only cost-related parameters, such as instance type and disk size, and retrives pricing from the Infracost Cloud Pricing API (no sensative data or plans are set to or shared with Infracost). The output caluclates the monthly cost in a table.

<img src="../images/infracost_comment.png" alt="Infracost Comment" title="Infracost Comment">


##