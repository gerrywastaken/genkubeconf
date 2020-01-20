class Data
  def self.help_text
    <<-DOC
      This program just takes the repetitiveness out of generating a new kubeconfig

      It essentially just takes a [[name]], [[ip]] and a [[system_name]] and runs the following:

      # Add cluster
      kubectl config set-cluster kubernetes-the-hard-way \\
        --certificate-authority=ca.crt \\
        --embed-certs=true \\
        --server=https://[[ip]]:6443 \\
        --kubeconfig=[[name]].kubeconfig

      # Add user
      kubectl config set-credentials [[system_name]] \\
        --client-certificate=[[name]].crt \\
        --client-key=[[name]].key \\
        --embed-certs=true \\
        --kubeconfig=[[name]].kubeconfig

      # Add default context
      kubectl config set-context default \\
        --cluster=kubernetes-the-hard-way \\
        --user=[[system_name]] \\
        --kubeconfig=[[name]].kubeconfig

      # Set current context to default
      kubectl config use-context default --kubeconfig=[[name]].kubeconfig

      e.g. genkubeconf kube-proxy $LOADBALANCER_ADDRESS system:kube-proxy
      DOC
  end
end