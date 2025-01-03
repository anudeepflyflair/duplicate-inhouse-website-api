output "api_id" {
  value = aws_api_gateway_rest_api.website_dev.id
}

output "base_url" {
  value = "https://${aws_api_gateway_rest_api.website_dev.id}.execute-api.ca-central-1.amazonaws.com/dev"
}
