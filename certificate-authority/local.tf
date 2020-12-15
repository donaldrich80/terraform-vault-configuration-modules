# resource local_file ca_file_vault {
#     sensitive_content = vault_pki_secret_backend_root_cert.ca-cert.certificate
#     filename = "${path.root}/output/certs/clinical6_ca_cert.pem"
#     file_permission = "0400"
# }


# resource local_file signed_intermediate {
#   sensitive_content = vault_pki_secret_backend_root_sign_intermediate.intermediate.certificate
#   filename          = "${path.root}/output/int_ca/int_cert.pem"
#   file_permission   = "0400"
# }

# Create a private key for use with the Root CA.
# resource local_file private_key {
#   sensitive_content = var.ca_key_private
#   filename          = "${path.root}/output/root_ca/ca_key.pem"
#   file_permission   = "0400"
# }

# resource local_file ca_file {
#   sensitive_content = tls_self_signed_cert.ca_cert.cert_pem
#   filename          = "${path.root}/output/root_ca/ca_cert.pem"
#   file_permission   = "0400"
# }
# This PEM bundle is not like most others.  Most PEM bundles are a chain of Certificate Authority Certs.
# This bundle is the Private Key (first), followed by the the Certificate.
# resource local_file ca_pem_bundle {
#   sensitive_content = "${tls_private_key.ca_key.private_key_pem}${tls_self_signed_cert.ca_cert.cert_pem}"
#   filename          = "${path.root}/output/root_ca/ca_cert_key_bundle.pem"
#   file_permission   = "0400"
# }
