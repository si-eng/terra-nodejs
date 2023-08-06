# terraform {
#   required_providers {
#     azuredevops = {
#       source  = "microsoft/azuredevops"
#       version = "0.7.0"
#     }
#   }
# }
# provider "azurerm" {
#   features {}
#   # Configuration options
# }


# provider "azuredevops" {
  
#     org_service_url = "https://dev.azure.com/Sakshi-practice"
#     personal_access_token = "ydwdpqxf7oua3o4tzverqrzgaguu43cvdwloudlx32mo2qhv3i7q"
  
# }


# resource "azurerm_resource_group" "example" {
#   name     = "practice-greensight-sakshirg"
#   location = "East US"
# }

# resource "azuredevops_project" "example" {
#   name               = "Example Project"
#   visibility         = "private"
#   version_control    = "Git"
#   work_item_template = "Agile"
#   description        = "Managed by Terraform"
# }

# resource "azuredevops_agent_pool" "example" {
#   name           = "Example Pool"
#   auto_provision = false
#   auto_update    = false
# }

# resource "azuredevops_agent_queue" "example" {
#   project_id    = azuredevops_project.example.id
#   agent_pool_id = azuredevops_agent_pool.example.id
# }

# resource "azuredevops_serviceendpoint_github" "github" {
#   project_id            = aazuredevops_project.example.id
#   service_endpoint_name = "Github Service endpoint"

#   auth_personal {
#     personal_access_token = data.azurerm_key_vault_secret.git_token.value
#   }
# }

# resource "azuredevops_build_definition" "example" {
#   project_id = azuredevops_project.example.id
#   name       = "Example Pipeline"

#   repository {
#     repo_type = "TfsGit"
#     repo_id   = data.azuredevops_git_repository.example.id
#     yml_path  = "azure-pipelines.yml"
#   }
# }

# resource "azuredevops_pipeline_authorization" "example" {
#   project_id  = azuredevops_project.example.id
#   resource_id = azuredevops_agent_queue.example.id
#   type        = "queue"
#   pipeline_id = azuredevops_build_definition.example.id
# }

terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "0.7.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  # Configuration options for the azurerm provider
}

provider "azuredevops" {
  org_service_url     = "https://dev.azure.com/Sakshi-practice"
  personal_access_token = "your_personal_access_token"
}

resource "azurerm_resource_group" "example" {
  name     = "practice-greensight-sakshirg"
  location = "East US"
}

resource "azuredevops_project" "example" {
  name               = "Example Project"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
  description        = "Managed by Terraform"
}

# Other resource definitions

# Define your GitHub service endpoint
resource "azuredevops_serviceendpoint_github" "github" {
  project_id            = azuredevops_project.example.id
  service_endpoint_name = "Github Service endpoint"

  auth_github {
    github_pat = "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"
  }
}

# Define other resources such as agent pools, queues, build definitions, etc.

