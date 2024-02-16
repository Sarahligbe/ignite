data "kubectl_filename_list" "kubernetes" {
    pattern = "../kubernetes/*.yaml"
}

resource "kubectl_manifest" "test" {
    count     = length(data.kubectl_filename_list.kubernetes.matches)
    yaml_body = file(element(data.kubectl_filename_list.kubernetes.matches, count.index))
}
