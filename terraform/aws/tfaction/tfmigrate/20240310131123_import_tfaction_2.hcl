# migration "state" "import_tfaction_2" {
#   actions = [
#     "mv aws_security_group.foo aws_security_group.foo2",
#     "import aws_security_group.foo foo",
#   ]
# }

# migration "multi_state" "import_tfaction_2" {
#   from_dir = "../foo"
#   to_dir   = "."
#   actions = [
#     "mv aws_security_group.foo aws_security_group.foo2",
#   ]
# }
