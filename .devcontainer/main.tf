variable "user" {
  type = object({
    name = string
    mail = string
    age = number
  })

  default = {
    name = "vinay"
    mail = "vina@gmail.com"
    age = "26"
}
}