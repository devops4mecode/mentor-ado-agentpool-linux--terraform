output "vmpassword" {
  value = random_password.password
  sensitive = true
}
