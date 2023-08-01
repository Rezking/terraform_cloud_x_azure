resource "azurem_policy_definition" "allowed_locations" {
    name = "allowed-locations-policy"
    display_name = "Allowed Locations Policy"
    description = "This policy enforces a location for resource"
    policy_type = "Custom"
    policy_rule = data.template_file.allowed_locations_rule.rendered
}

#convert allowed location list to a JSON-formatted string
locals {
    allowed_locations_json = jsonencode(var.allowed_locations)
}

data "template_file" "allowed_locations_rule" {
    template = file("${path.module}/allowed_locations_rule.json.tpl")
    
    vars = {
        allowed_locations = locals.allowed_locations_json
    }
}

resource "azurerm_policy_assignment" "assignment" {
  name                 = "allowed_location_assignment"
  display_name         = "Assignment for locations"
  policy_definition_id = azurerm_policy_definition.allowed_locations.id
  scope = "/subscriptions/${var.subscriptionId}/resourceGroups/${var.rg_name}"
}

output "policy_rule_generated" {
    value = data.template_file.allowed_locations_rule.rendered
}