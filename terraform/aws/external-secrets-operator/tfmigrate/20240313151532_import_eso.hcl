# migration "state" "import_eso" {
#   actions = [
#     "mv aws_security_group.foo aws_security_group.foo2",
#     "import aws_security_group.foo foo",
#   ]
# }

# migration "multi_state" "import_eso" {
#   from_dir = "../foo"
#   to_dir   = "."
#   actions = [
#     "mv aws_security_group.foo aws_security_group.foo2",
#   ]
# }
