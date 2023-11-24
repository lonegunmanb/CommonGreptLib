data "http" auto_approve_n_merge_yaml {
  url = "https://github.com/lonegunmanb/CommonGreptLib/blob/main/static/auto-approve-n-merge.yaml"
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