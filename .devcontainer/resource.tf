
resource "random_integer" "name2" {
  min = 500
  max = 1000
   lifecycle {
     #create_before_destroy = true
     ignore_changes = [ min,max ]
   }
}