# migration "state" "remove_broken_cloudflare_access" {
#   actions = [
#     "mv aws_security_group.foo aws_security_group.foo2",
#     "import aws_security_group.foo foo",
#   ]
# }

# migration "multi_state" "remove_broken_cloudflare_access" {
#   from_dir = "../foo"
#   to_dir   = "."
#   actions = [
#     "mv aws_security_group.foo aws_security_group.foo2",
#   ]
# }
