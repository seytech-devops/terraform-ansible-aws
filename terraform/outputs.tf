output "app_instance_ids" {
  value = aws_instance.app.*.id
}

output "web_instance_ids" {
  value = aws_instance.web.*.id
}

output "example_instance_ids" {
  value = aws_instance.example.*.id
}