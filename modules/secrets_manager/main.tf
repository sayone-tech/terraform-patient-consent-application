resource "aws_secretsmanager_secret" "secretsmanager" {
  name = lower("${var.App_Name}/${var.Env_Type}")
  # name = lower("${var.Scretes_Manager_Name}")
  recovery_window_in_days = "0"
        // ignore any updates to the initial values above done after creation. 
      # lifecycle {
      #       ignore_changes = [
      #         secret_string
      #       ]
      #     } 

}

# resource "aws_secretsmanager_secret_version" "secretsmanager_version" {
#   secret_id = aws_secretsmanager_secret.secretsmanager.id

#   # Other type of secret with an empty key/value pair
#   secret_string = "{\"\":\"\"}"

#       // ignore any updates to the initial values above done after creation. 
#       lifecycle {
#             ignore_changes = [
#               secret_string
#             ]
#           }  
# }