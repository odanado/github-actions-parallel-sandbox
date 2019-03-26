workflow "New workflow" {
  on = "push"
  resolves = ["check"]
}

action "Sleep 1" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "sleep 1 && echo \"1\" > poyo.txt"
  runs = "bash -c"
}

action "check" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = ["Sleep 1"]
  runs = "bash"
  args = "cat poyo.txt"
}