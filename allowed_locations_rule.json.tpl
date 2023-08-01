{
  "if": {
    "not": {
      "field": "location",
      "in": [${allowed_locations}]
    }
  },
  "then": {
    "effect": "deny"
  }
}
