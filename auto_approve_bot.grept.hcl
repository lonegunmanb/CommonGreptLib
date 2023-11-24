data "http" auto_approve_n_merge_yaml {
  url = "https://raw.githubusercontent.com/lonegunmanb/CommonGreptLib/main/static/LICENSE"
}

rule "file_hash" auto_approve_n_merge_yaml {
  glob = ".github/workflows/auto-approve-n-merge.yaml"
  hash = sha1(data.http.auto_approve_n_merge_yaml.response_body)
}

fix "local_file" auto_approve_n_merge_yaml {
  rule_ids = [rule.file_hash.auto_approve_n_merge_yaml.id]
  paths    = [rule.file_hash.auto_approve_n_merge_yaml.glob]
  content  = data.http.auto_approve_n_merge_yaml.response_body
}